# lakebase-sample-schemas

PostgreSQL ports of the **Oracle sample schemas**, ready to load into a
**Databricks Lakebase** (autoscaling Postgres) database. Useful for Oracle → Databricks
migration demos, Lakebase / LTAP demos, and query examples.

The data is Oracle's own open-source sample data, **ported verbatim** to PostgreSQL
(same rows, same values), plus faithful DDL, constraints, indexes, views and comments.

## What's included

| Oracle schema | → Postgres schema | Status | Contents |
|---|---|---|---|
| **HR** – Human Resources | `hr` | ✅ full (DDL + data) | 7 tables, sequences, view, trigger |
| **CO** – Customer Orders | `co` | ✅ full (DDL + data) | 7 tables, JSON (`jsonb`), identity cols, 4 views |
| **SH** – Sales History   | `sh` | ✅ full (DDL + data) | 9 tables, **range partitioning**, ~0.9M-row `sales` fact, materialized views |
| **SCOTT** – classic `scott/tiger` | `scott` | ✅ full (DDL + data) | the legacy Oracle demo: `EMP` / `DEPT` / `BONUS` / `SALGRADE` |

HR, CO and SH are the schemas Oracle actively maintains; **SCOTT** is the legendary legacy
`scott/tiger` demo (`EMP`/`DEPT`/`BONUS`/`SALGRADE`), ported from Oracle's `utlsampl.sql` and
included for convenience. Oracle's other, *archived* sample schemas — **OE** (Order Entry /
Online Catalog) and **PM** (Product Media) — are intentionally **not** included: they rely on
Oracle-only features (object types, `VARRAY`, nested tables, `XMLTYPE`, `ORDSYS` multimedia)
that have no PostgreSQL equivalent and cannot be ported "verbatim".

> **Validated:** the full load runs clean on a Databricks Lakebase PostgreSQL 17 database
> (`sh.sales` = 918,843 rows), including partition routing, foreign keys, the `jsonb`/`GROUPING SETS`/
> `string_agg` views, and the materialized views.

### Row counts after load

| Table | Rows |
|---|---|
| `hr.*` (all 7 tables) | ~215 |
| `co.*` (7 tables) | ~8.7k |
| `sh.customers` | 55,499 |
| `sh.costs` | 82,111 |
| `sh.sales` | **918,842** |
| `sh.times` / `sh.products` / … | dimensions |
| `scott.emp` / `scott.dept` / `scott.salgrade` | 14 / 4 / 5 (`scott.bonus` empty) |

## Repo layout

```
sql/00_schemas.sql          create the hr / co / sh schemas
schemas/hr|co|sh/           per-schema DDL, data, views, comments, install.sql
schemas/sh/data/*.csv.gz    Oracle's SH CSV data (gzipped), loaded via \copy
tools/convert_oracle_to_pg.py  the Oracle→Postgres transformer (provenance / re-generation)
load_all.sh                 one-shot loader
docs/                       type-mapping, lakebase-connect, conversion-notes
```

## Prerequisites

- A **target database that already exists** — `load_all.sh` creates the `hr`/`co`/`sh`
  schemas *inside* the database you connect to; it does **not** create the database itself.
  Create one first (e.g. `lakebase-sample-db`); see [docs/lakebase-connect.md](docs/lakebase-connect.md).
- `psql` (PostgreSQL 14+ client; **server target is PostgreSQL 16/17**, e.g. Lakebase)
- `gzip` (SH data is loaded from `*.csv.gz` via `\copy ... FROM PROGRAM 'gzip -dc ...'`)
- `python3` — only if you want to regenerate the data files from the Oracle source

## Quick start (Databricks Lakebase)

1. Connect. Point libpq at your Lakebase endpoint (full walkthrough in
   [docs/lakebase-connect.md](docs/lakebase-connect.md)):

   ```bash
   export PGHOST=<endpoint>.database.<region>.cloud.databricks.com
   export PGPORT=5432 PGDATABASE=lakebase-sample-db PGSSLMODE=require
   export PGUSER="you@databricks.com"
   export PGPASSWORD=$(databricks postgres generate-database-credential \
       projects/<proj>/branches/<branch>/endpoints/<ep> -p <profile> \
       | python3 -c 'import sys,json;print(json.load(sys.stdin)["token"])')
   ```

2. Load everything:

   ```bash
   ./load_all.sh            # or: ./load_all.sh hr co   (subset)
   ```

   Each schema also has its own `install.sql` you can run from its directory:
   `cd schemas/hr && psql -v ON_ERROR_STOP=1 -f install.sql`.

> The Lakebase login role is not a superuser. Everything here uses only standard,
> non-superuser SQL (no `COPY FROM` server-side, no extensions). Data loads via
> client-side `\copy`, so run the loader from a machine that has the repo checked out.

## Oracle → PostgreSQL mapping

Type and construct conversions (NUMBER→numeric/integer, VARCHAR2→varchar, DATE→date,
BLOB→bytea/jsonb, IDENTITY, sequences, IOT, partitioning, LISTAGG, GROUPING SETS,
JSON_TABLE, materialized views, …) are documented in
[docs/type-mapping.md](docs/type-mapping.md). Per-schema deviations from the Oracle
originals are listed in [docs/conversion-notes.md](docs/conversion-notes.md).

## Regenerating the data files from Oracle source

The `*_data.sql`, `02_dimensions_data.sql` and `comments.sql` files are generated:

```bash
# get Oracle's MIT-licensed source, then:
python3 tools/convert_oracle_to_pg.py /path/to/db-sample-schemas .
```

## License & provenance

Data and original DDL for **HR, CO and SH**: **Oracle sample schemas**, MIT License
(<https://github.com/oracle-samples/db-sample-schemas>) — see `ORACLE-LICENSE.txt`.
The PostgreSQL ports and tooling in this repo are provided under the same MIT terms.
This is a community port and is **not** an Oracle or Databricks product.

> **The `scott` schema is different.** `scott` (`EMP`/`DEPT`/`BONUS`/`SALGRADE`) is **not** part
> of the MIT-licensed `oracle-samples/db-sample-schemas` project. It is the historical Oracle
> "scott/tiger" demo, distributed for decades with Oracle Database
> (`$ORACLE_HOME/rdbms/admin/utlsampl.sql`, which is Oracle-copyrighted). Its tiny, ubiquitous
> structure and data are reproduced here from their long-published definition for educational and
> testing convenience — it is **not** covered by the MIT grant above, and no separate license is
> claimed for it. If licensing matters for your use, treat `scott` accordingly, or simply skip it:
> `./load_all.sh hr co sh`.
