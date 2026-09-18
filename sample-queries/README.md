# Sample queries

Ready-to-run example queries for each schema — **one query per file** (10 per schema),
named `NN_<description>.sql`. Every file sets its own `search_path`, so each runs standalone
once you're connected (see [../docs/lakebase-connect.md](../docs/lakebase-connect.md)):

```bash
# a single query
psql -f sample-queries/hr/01_headcount_and_average_salary_by_department.sql

# all queries for a schema, in order
for f in sample-queries/sh/*.sql; do psql -f "$f"; done
```

or paste a file's contents into psql / any SQL client.

| Folder | What it covers |
|---|---|
| `hr/` | Headcount & pay bands, top earners, out-of-range salaries, org hierarchy (recursive), manager spans, commissions, geography, hiring trends, job history, salary distribution |
| `co/` | Revenue by status, top customers/products, monthly trend, store AOV, JSON product reviews & attributes, repeat customers, stock vs demand, fulfilment |
| `sh/` | Revenue by year/channel/region, monthly trend, promotion breakdown, profit & margin (profits view), year-over-year growth, demographics, top customers with running total |

All queries are read-only `SELECT`s and were verified against a loaded PostgreSQL 17 / Lakebase database.
