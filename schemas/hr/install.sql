-- HR install - run from this directory:  psql -v ON_ERROR_STOP=1 -f install.sql
\echo '== HR: tables =='
\i 01_tables.sql
\echo '== HR: data =='
\i 02_data.sql
\echo '== HR: indexes =='
\i 03_indexes.sql
\echo '== HR: foreign keys =='
\i 04_constraints.sql
\echo '== HR: views =='
\i 05_views.sql
\echo '== HR: comments =='
\i comments.sql
\echo '== HR: code (trigger) =='
\i 06_code.sql
