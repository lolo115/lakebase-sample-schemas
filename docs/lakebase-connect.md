# Connecting to a Databricks Lakebase database

Lakebase is standard PostgreSQL, reachable over the wire with `psql` and any libpq client.
Authentication uses a short-lived OAuth token as the password.

## Autoscaling Postgres (projects / branches / endpoints)

Discover your project, branch, endpoint and database with the Databricks CLI:

```bash
PROFILE=decat        # your ~/.databrickscfg profile for the workspace

databricks postgres list-projects -p "$PROFILE"
databricks postgres list-branches  projects/<project>/... -p "$PROFILE"
databricks postgres list-endpoints projects/<project>/branches/<branch> -p "$PROFILE"
databricks postgres list-databases projects/<project>/branches/<branch> -p "$PROFILE"
```

Generate a credential (token) for the endpoint and connect:

```bash
EP=projects/<project>/branches/<branch>/endpoints/<endpoint>
export PGPASSWORD=$(databricks postgres generate-database-credential "$EP" -p "$PROFILE" \
    | python3 -c 'import sys,json;print(json.load(sys.stdin)["token"])')
export PGHOST=<endpoint>.database.<region>.cloud.databricks.com
export PGPORT=5432
export PGDATABASE=<your-database>
export PGUSER="you@databricks.com"
export PGSSLMODE=require

psql -c "select current_user, current_database();"
```

The token is short-lived (~1 hour); regenerate it if a long load expires it.

## Example: the fevm-decathlon-lakebase demo workspace

```bash
PROFILE=decat
EP=projects/laurent-prj/branches/production/endpoints/primary
export PGPASSWORD=$(databricks postgres generate-database-credential "$EP" -p "$PROFILE" \
    | python3 -c 'import sys,json;print(json.load(sys.stdin)["token"])')
export PGHOST=ep-crimson-sun-d7j097rv.database.eu-central-1.cloud.databricks.com
export PGPORT=5432 PGDATABASE=decat-db PGSSLMODE=require
export PGUSER="you@databricks.com"

./load_all.sh
```

## Notes for Lakebase

- The login role is **not** a superuser: no server-side `COPY FROM file`, no
  `CREATE EXTENSION`, no `session_replication_role`. This repo uses only standard SQL and
  client-side `\copy`, so it loads fine as a normal user.
- Make sure your role can `CREATE` in the target database (to create the `hr`/`co`/`sh`
  schemas), or pre-create the schemas and grant usage.
- Loading ~0.9M `sales` rows over `\copy` takes a little time and will wake an idle
  autoscaling endpoint.
