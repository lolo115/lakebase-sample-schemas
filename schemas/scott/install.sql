-- SCOTT install - run from this directory:  psql -v ON_ERROR_STOP=1 -f install.sql
\echo '== SCOTT: tables =='
\i 01_tables.sql
\echo '== SCOTT: data =='
\i 02_data.sql
\echo '== SCOTT: foreign key =='
\i 03_constraints.sql
