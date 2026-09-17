-- CO install - run from this directory:  psql -v ON_ERROR_STOP=1 -f install.sql
\echo '== CO: tables =='
\i 01_tables.sql
\echo '== CO: data =='
\i 02_data.sql
\echo '== CO: indexes + foreign keys =='
\i 03_indexes_constraints.sql
\echo '== CO: views =='
\i 04_views.sql
\echo '== CO: identity sync =='
\i 05_identity_sync.sql
\echo '== CO: comments =='
\i comments.sql
