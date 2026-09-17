# Conversion notes & known deviations

General rules are in [type-mapping.md](type-mapping.md). Per-schema specifics below.

## HR
- `EMP_DETAILS_VIEW` ported (was `WITH READ ONLY`).
- Sequences `locations_seq`, `departments_seq`, `employees_seq` recreated with the same
  START/INCREMENT/MAXVALUE. They are standalone (Oracle populated ids explicitly), not
  attached to the `employee_id` column.
- `update_job_history` trigger ported to PL/pgSQL. Oracle's `secure_dml` / `secure_employees`
  (a business-hours DML guard) are **omitted** — demo-only access control, not data.
- The cyclic FK pair `employees.department_id → departments` / `departments.manager_id →
  employees` is created after data load.

## CO
- `product_details` is `jsonb` (Oracle stored JSON in a `BLOB` with `CHECK (... is json)`).
  One product row in Oracle's own script references an **undefined** `prod_details`
  variable — that single value is loaded as `NULL` (matches what Oracle would do with the
  broken reference).
- Binary `BLOB` columns (`logo`, `product_image`) map to `bytea`; Oracle ships no data for
  them, so they load as `NULL`.
- Views: `LISTAGG` → `string_agg`; `GROUPING_ID` → `GROUPING`; `JSON_TABLE` →
  `jsonb_array_elements`. `product_reviews` reads the reviews array out of `product_details`.
- Identity sequences are advanced past the highest loaded id (`05_identity_sync.sql`).

## SH
- `SALES` and `COSTS` keep Oracle's range-partitioning scheme as PostgreSQL declarative
  partitions (quarterly/half-yearly by `time_id`), each with a `DEFAULT` partition as a
  safety net. Oracle `COMPRESS` is dropped.
- Large tables (`sales` ~918.8k, `costs`, `customers`, `times`, `promotions`,
  `supplementary_demographics`) load from gzipped CSV via `\copy`. Small dimensions
  (`channels`, `countries`, `products`) load from INSERTs.
- `sales.csv` had fixed-width trailing spaces on the numeric column; these were stripped
  during repo prep (values unchanged) so `\copy` parses cleanly.
- All foreign keys (including `sales`/`costs` → `promotions`) are satisfiable by the data
  and are enforced.
- `profits` view ported. Materialized views `cal_month_sales_mv`, `fweek_pscat_sales_mv`
  ported (Oracle `ENABLE QUERY REWRITE` dropped); populated at create, `REFRESH` to update.
- Oracle `CREATE DIMENSION` objects (query-rewrite metadata) are not represented — no
  PostgreSQL equivalent and not needed to query the data.

## OE / PM (excluded)
Oracle's archived **OE** (Order Entry / Online Catalog) and **PM** (Product Media) schemas are
not included. They are object-relational / multimedia schemas built on Oracle-only features
(`CREATE TYPE ... AS OBJECT`, `VARRAY`, nested tables, `SYS.XMLTYPE`, `ORDSYS.ORDImage`/`ORDDoc`)
that have no PostgreSQL equivalent, so a verbatim port is not possible.
