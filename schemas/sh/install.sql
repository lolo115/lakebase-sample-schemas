-- SH install - run from this directory:  psql -v ON_ERROR_STOP=1 -f install.sql
-- (paths in 03_load_csv.sql are relative to this directory).
\echo '== SH: tables + partitions =='
\i 01_tables.sql
\echo '== SH: dimension data (channels/countries/products) =='
\i 02_dimensions_data.sql
\echo '== SH: load large tables from CSV =='
\i 03_load_csv.sql
\echo '== SH: foreign keys =='
\i 04_constraints.sql
\echo '== SH: views + materialized views =='
\i 05_views.sql
\echo '== SH: comments =='
\i comments.sql
