#!/usr/bin/env bash
# Load all ported Oracle sample schemas (HR, CO, SH) into a PostgreSQL / Lakebase database.
#
# Connection: uses standard libpq environment variables. For Lakebase:
#   export PGHOST=<endpoint-host> PGPORT=5432 PGDATABASE=<db> PGSSLMODE=require
#   export PGUSER="<you>@databricks.com"
#   export PGPASSWORD=$(databricks postgres generate-database-credential <endpoint> -p <profile> \
#                        | python3 -c 'import sys,json;print(json.load(sys.stdin)["token"])')
# See docs/lakebase-connect.md for details.
#
# Usage:  ./load_all.sh [hr|co|sh ...]     (default: all three)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
PSQL=(psql -v ON_ERROR_STOP=1 -X -q)

SCHEMAS=("$@"); [ ${#SCHEMAS[@]} -eq 0 ] && SCHEMAS=(hr co sh)

echo "== creating schemas =="
"${PSQL[@]}" -f "$ROOT/sql/00_schemas.sql"

for s in "${SCHEMAS[@]}"; do
    echo "== loading schema: $s =="
    ( cd "$ROOT/schemas/$s" && "${PSQL[@]}" -f install.sql )
done

echo "== row counts =="
"${PSQL[@]}" -c "
  SELECT 'hr.employees'  AS table, count(*) FROM hr.employees
  UNION ALL SELECT 'co.orders',      count(*) FROM co.orders
  UNION ALL SELECT 'co.order_items', count(*) FROM co.order_items
  UNION ALL SELECT 'sh.customers',   count(*) FROM sh.customers
  UNION ALL SELECT 'sh.costs',       count(*) FROM sh.costs
  UNION ALL SELECT 'sh.sales',       count(*) FROM sh.sales
  ORDER BY 1;"
echo "Done."
