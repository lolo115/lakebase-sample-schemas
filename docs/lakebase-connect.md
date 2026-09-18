# Connecting to a Databricks Lakebase database

Lakebase is standard PostgreSQL, reachable over the wire with `psql` and any libpq client.
Authentication uses a short-lived OAuth token as the password.

## Prerequisite: the target database must already exist

`load_all.sh` creates the `hr`, `co` and `sh` **schemas** inside the database your connection
points at — it does **not** create the database itself. Create the target database once before
running the loader (name it whatever you like; this repo uses `lakebase-sample-db` as the example):

```bash
PROFILE=<profile>                          # your ~/.databrickscfg profile for the workspace
BRANCH=projects/<project>/branches/<branch>

# choose the Postgres role that will own the database
databricks postgres list-roles "$BRANCH" -p "$PROFILE"

# both spec.postgres_database and spec.role are required
databricks postgres create-database "$BRANCH" \
  --database-id lakebase-sample-db \
  --json '{"spec":{"postgres_database":"lakebase-sample-db","role":"projects/<project>/branches/<branch>/roles/<role-id>"}}' \
  -p "$PROFILE"
```

## Discover your project / branch / endpoint / database

```bash
PROFILE=<profile>
databricks postgres list-projects  -p "$PROFILE"
databricks postgres list-branches  projects/<project> -p "$PROFILE"
databricks postgres list-endpoints projects/<project>/branches/<branch> -p "$PROFILE"
databricks postgres list-databases projects/<project>/branches/<branch> -p "$PROFILE"
```

## Connect and load

Generate a credential (token) for the endpoint, point libpq at the database you created, and
run the loader:

```bash
PROFILE=<profile>
EP=projects/<project>/branches/<branch>/endpoints/<endpoint>

export PGPASSWORD=$(databricks postgres generate-database-credential "$EP" -p "$PROFILE" \
    | python3 -c 'import sys,json;print(json.load(sys.stdin)["token"])')
export PGHOST=<endpoint>.database.<region>.cloud.databricks.com
export PGPORT=5432
export PGDATABASE=lakebase-sample-db          # the database created in the prerequisite step
export PGUSER="you@databricks.com"
export PGSSLMODE=require

psql -c "select current_user, current_database();"   # sanity check
./load_all.sh
```

The token is short-lived (~1 hour); regenerate it if a long load expires it.

## Notes for Lakebase

- The login role is **not** a superuser: no server-side `COPY FROM file`, no
  `CREATE EXTENSION`, no `session_replication_role`. This repo uses only standard SQL and
  client-side `\copy`, so it loads fine as a normal user.
- Make sure your role can `CREATE` in the target database (to create the `hr`/`co`/`sh`
  schemas), or pre-create the schemas and grant usage.
- Loading ~0.9M `sales` rows over `\copy` takes a little time and will wake an idle
  autoscaling endpoint.
