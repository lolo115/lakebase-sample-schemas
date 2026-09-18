-- SCOTT - foreign key (added after data load), as in the original schema (FK_DEPTNO).
SET search_path TO scott, public;

ALTER TABLE emp ADD CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno);
