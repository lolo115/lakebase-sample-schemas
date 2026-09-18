-- SCOTT - the classic Oracle "scott/tiger" demo schema (EMP / DEPT / BONUS / SALGRADE).
-- Ported from Oracle's SCOTT sample schema (utlsampl.sql).
-- LICENSING: unlike hr/co/sh, SCOTT is NOT part of the MIT-licensed
-- oracle-samples/db-sample-schemas project; see the repo README (License & provenance).
--   NUMBER(2)/NUMBER(4) -> integer ; NUMBER(7,2) -> numeric(7,2) ; bare NUMBER -> numeric
-- The emp.deptno foreign key is added after data load (03_constraints.sql).
SET search_path TO scott, public;

CREATE TABLE dept (
    deptno integer     NOT NULL,
    dname  varchar(14),
    loc    varchar(13),
    CONSTRAINT pk_dept PRIMARY KEY (deptno)
);

CREATE TABLE emp (
    empno    integer      NOT NULL,
    ename    varchar(10),
    job      varchar(9),
    mgr      integer,
    hiredate date,
    sal      numeric(7,2),
    comm     numeric(7,2),
    deptno   integer,
    CONSTRAINT pk_emp PRIMARY KEY (empno)
);

-- BONUS is part of the schema but ships with no rows.
CREATE TABLE bonus (
    ename varchar(10),
    job   varchar(9),
    sal   numeric,
    comm  numeric
);

CREATE TABLE salgrade (
    grade integer NOT NULL,
    losal numeric,
    hisal numeric,
    CONSTRAINT pk_salgrade PRIMARY KEY (grade)
);
