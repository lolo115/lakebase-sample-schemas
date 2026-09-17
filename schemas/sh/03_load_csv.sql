-- SH - load the large tables from the gzipped CSVs via client-side \copy FROM PROGRAM.
-- IMPORTANT: run this with psql's current directory set to schemas/sh (load_all.sh does
-- this automatically), because the paths below are relative to the current directory.
--   FORMAT csv, HEADER      : the CSVs have a header row
--   NULL ''                 : an unquoted empty field is NULL (matches Oracle's export)
-- Column order in each CSV matches the table definition, so no explicit column list is needed.
SET search_path TO sh, public;

\echo '  loading times ...'
\copy times                      FROM PROGRAM 'gzip -dc data/times.csv.gz'                      WITH (FORMAT csv, HEADER true, NULL '')
\echo '  loading promotions ...'
\copy promotions                 FROM PROGRAM 'gzip -dc data/promotions.csv.gz'                 WITH (FORMAT csv, HEADER true, NULL '')
\echo '  loading customers ...'
\copy customers                  FROM PROGRAM 'gzip -dc data/customers.csv.gz'                  WITH (FORMAT csv, HEADER true, NULL '')
\echo '  loading supplementary_demographics ...'
\copy supplementary_demographics FROM PROGRAM 'gzip -dc data/supplementary_demographics.csv.gz' WITH (FORMAT csv, HEADER true, NULL '')
\echo '  loading costs ...'
\copy costs                      FROM PROGRAM 'gzip -dc data/costs.csv.gz'                      WITH (FORMAT csv, HEADER true, NULL '')
\echo '  loading sales (~0.9M rows) ...'
\copy sales                      FROM PROGRAM 'gzip -dc data/sales.csv.gz'                      WITH (FORMAT csv, HEADER true, NULL '')
