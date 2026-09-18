# Sample queries

Ready-to-run example queries for each schema, showing the kind of analysis these datasets
support. Each file sets its own `search_path`, so you can run it as-is once connected
(see [../docs/lakebase-connect.md](../docs/lakebase-connect.md)):

```bash
psql -f sample-queries/hr/queries.sql
psql -f sample-queries/co/queries.sql
psql -f sample-queries/sh/queries.sql
```

or paste individual queries into psql / any SQL client.

| File | What it covers |
|---|---|
| `hr/queries.sql` | Headcount & pay bands, top earners, out-of-range salaries, org hierarchy (recursive), manager spans, commissions, geography, hiring trends, job history, salary distribution |
| `co/queries.sql` | Revenue by status, top customers/products, monthly trend, store AOV, JSON product reviews & attributes, repeat customers, stock vs demand, fulfilment |
| `sh/queries.sql` | Revenue by year/channel/region, monthly trend, promotion impact, profit & margin (profits view), year-over-year growth, demographics, top customers with running total |

All queries are read-only `SELECT`s and were verified against a loaded PostgreSQL 17 / Lakebase database.
