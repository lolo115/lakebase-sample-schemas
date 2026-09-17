#!/usr/bin/env python3
"""
Convert Oracle sample-schema *populate* scripts into PostgreSQL-loadable data files.

Source : oracle-samples/db-sample-schemas (MIT licensed)
Target : PostgreSQL 16/17 (Databricks Lakebase)

What it does (per schema):
  - strips SQL*Plus / SQLcl directives (SET, PROMPT, REM, DEFINE, LOAD, ALTER, ...)
  - HR / SH : converts Oracle empty-string values ('') -> NULL  (Oracle treats '' as NULL;
              PostgreSQL does not, and '' would break NOT NULL / numeric / date columns)
  - CO      : unwraps UTL_RAW.CAST_TO_RAW('<json>') -> '<json>'  (BLOB-of-JSON -> jsonb)
              rewrites TO_TIMESTAMP(...,'... .FF') -> to_timestamp(...,'... .US') truncated to microseconds
  - SH      : keeps only the small dimension INSERTs (channels/countries/products);
              the large tables (sales, costs, customers, times, promotions,
              supplementary_demographics) are loaded from CSV via \\copy.

Usage: convert_oracle_to_pg.py <oracle_src_dir> <repo_dir>
"""
import re
import sys
import pathlib

DIRECTIVE = re.compile(
    r'^\s*(SET|REM|PROMPT|DEFINE|WHENEVER|SPOOL|CONNECT|EXIT|QUIT|LOAD|'
    r'ALTER\s+SESSION|ALTER\s+TABLE|MODIFY\s+CONSTRAINT|DISABLE\s+CONSTRAINT|'
    r'ENABLE\s+CONSTRAINT|COMMENT|COMMIT|ROLLBACK|BEGIN|END;|CREATE\s+OR\s+REPLACE)\b',
    re.IGNORECASE)

# an empty-string value '' that stands alone as a column value (after ( or , ; before , or ))
EMPTY_VALUE = re.compile(r"([(,][ \t]*)''([ \t]*[,)])")
# UTL_RAW.CAST_TO_RAW( '<string, may contain '' escapes>' )  -> the string literal
UTLRAW = re.compile(r"UTL_RAW\.CAST_TO_RAW\(\s*('(?:[^']|'')*')\s*\)", re.IGNORECASE)
# TO_TIMESTAMP('dd-MON-yyyy hh24.mi.ss.<frac>','DD-MON-YYYY HH24.MI.SS.FF')
TOTS = re.compile(
    r"TO_TIMESTAMP\('([^']*)',\s*'DD-MON-YYYY HH24\.MI\.SS\.FF'\)", re.IGNORECASE)


LONE_SLASH = re.compile(r"^\s*/\s*$")           # SQL*Plus statement terminator


def strip_directives(text: str) -> str:
    return "\n".join(l for l in text.splitlines()
                     if not DIRECTIVE.match(l) and not LONE_SLASH.match(l))


def empties_to_null(text: str) -> str:
    prev = None
    while prev != text:                       # loop handles consecutive '' , '' , ...
        prev = text
        text = EMPTY_VALUE.sub(r"\1NULL\2", text)
    return text


def fix_timestamp(m: re.Match) -> str:
    val = m.group(1)
    # keep at most 6 fractional digits (Oracle FF up to 9 ns; PG timestamp = microseconds)
    val = re.sub(r"(\d{2}\.\d{2}\.\d{2})\.(\d{1,6})\d*", r"\1.\2", val)
    return f"to_timestamp('{val}','DD-MON-YYYY HH24.MI.SS.US')"


def keep_inserts_for(text: str, tables=None) -> str:
    """Keep only INSERT statements (statements end at ';'), optionally filtered to `tables`.
    This discards everything that is not an INSERT: SQL*Plus directives, PL/SQL
    DECLARE/BEGIN/END blocks, ALTER/COMMIT, etc."""
    out, buf, keeping = [], [], False
    pat = re.compile(r"^\s*INSERT\s+INTO\s+(\w+)", re.IGNORECASE)
    for line in text.splitlines():
        m = pat.match(line)
        if m:
            keeping = tables is None or m.group(1).lower() in tables
        if keeping:
            buf.append(line)
            if line.rstrip().endswith(";"):
                out.append("\n".join(buf)); buf = []; keeping = False
    return "\n".join(out)


def extract_comments(text: str) -> str:
    """Pull the COMMENT ON TABLE/COLUMN statements out of an Oracle *_create.sql."""
    out, buf, grab = [], [], False
    for line in text.splitlines():
        if re.match(r"^\s*COMMENT ON ", line, re.IGNORECASE):
            grab = True
        if grab:
            buf.append(line)
            if line.rstrip().endswith(";"):
                out.append("\n".join(buf)); buf = []; grab = False
    return "\n".join(out)


def header(schema: str) -> str:
    return (f"-- Generated from Oracle sample schemas (MIT). Do not edit by hand.\n"
            f"SET search_path TO {schema}, public;\n\n")


def main():
    src, repo = pathlib.Path(sys.argv[1]), pathlib.Path(sys.argv[2])

    # ---- HR --------------------------------------------------------------
    hr = (src / "human_resources" / "hr_populate.sql").read_text()
    hr = empties_to_null(keep_inserts_for(hr))
    (repo / "schemas/hr/02_data.sql").write_text(
        header("hr") + hr.strip() + "\n")

    # ---- CO --------------------------------------------------------------
    co = (src / "customer_orders" / "co_populate.sql").read_text()
    co = keep_inserts_for(co)
    co = UTLRAW.sub(r"\1", co)
    # one row in Oracle's own script references an undefined variable -> NULL
    co = re.sub(r"UTL_RAW\.CAST_TO_RAW\(\s*\w+\s*\)", "NULL", co, flags=re.IGNORECASE)
    co = TOTS.sub(fix_timestamp, co)
    (repo / "schemas/co/02_data.sql").write_text(
        header("co") + co.strip() + "\n")

    # ---- SH dimensions (channels/countries/products via INSERT) ----------
    sh = (src / "sales_history" / "sh_populate.sql").read_text()
    sh = keep_inserts_for(sh, {"channels", "countries", "products"})
    sh = empties_to_null(sh)
    (repo / "schemas/sh/02_dimensions_data.sql").write_text(
        header("sh") + sh.strip() + "\n")

    # ---- COMMENTs (faithful, from each *_create.sql) ---------------------
    # Oracle uses COMMENT ON TABLE for views; PostgreSQL needs COMMENT ON VIEW.
    views = {"co": ("customer_order_products", "store_orders",
                    "product_reviews", "product_orders")}
    for schema, folder, create in (("hr", "human_resources", "hr_create.sql"),
                                   ("co", "customer_orders", "co_create.sql"),
                                   ("sh", "sales_history", "sh_create.sql")):
        c = extract_comments((src / folder / create).read_text())
        for v in views.get(schema, ()):
            c = re.sub(rf"COMMENT ON TABLE\s+{v}\b", f"COMMENT ON VIEW {v}", c,
                       flags=re.IGNORECASE)
        (repo / f"schemas/{schema}/comments.sql").write_text(header(schema) + c.strip() + "\n")

    print("wrote hr/02_data.sql, co/02_data.sql, sh/02_dimensions_data.sql, "
          "and hr/co/sh comments.sql")


if __name__ == "__main__":
    main()
