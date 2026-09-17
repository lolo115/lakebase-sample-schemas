-- HR (Human Resources) - tables, primary keys, sequences.
-- Ported from Oracle hr_create.sql. Foreign keys are added after data load (04_constraints.sql).
SET search_path TO hr, public;

CREATE TABLE regions (
    region_id    integer      NOT NULL,
    region_name  varchar(25),
    CONSTRAINT reg_id_pk PRIMARY KEY (region_id)
);

-- Oracle used ORGANIZATION INDEX (IOT); in PostgreSQL a normal table + PK is equivalent.
CREATE TABLE countries (
    country_id   char(2)      NOT NULL,
    country_name varchar(60),
    region_id    integer,
    CONSTRAINT country_c_id_pk PRIMARY KEY (country_id)
);

CREATE TABLE locations (
    location_id    integer      NOT NULL,
    street_address varchar(40),
    postal_code    varchar(12),
    city           varchar(30)  NOT NULL,
    state_province varchar(25),
    country_id     char(2),
    CONSTRAINT loc_id_pk PRIMARY KEY (location_id)
);

CREATE TABLE departments (
    department_id   integer     NOT NULL,
    department_name varchar(30) NOT NULL,
    manager_id      integer,
    location_id     integer,
    CONSTRAINT dept_id_pk PRIMARY KEY (department_id)
);

CREATE TABLE jobs (
    job_id     varchar(10)  NOT NULL,
    job_title  varchar(35)  NOT NULL,
    min_salary integer,
    max_salary integer,
    CONSTRAINT job_id_pk PRIMARY KEY (job_id)
);

CREATE TABLE employees (
    employee_id    integer      NOT NULL,
    first_name     varchar(20),
    last_name      varchar(25)  NOT NULL,
    email          varchar(25)  NOT NULL,
    phone_number   varchar(20),
    hire_date      date         NOT NULL,
    job_id         varchar(10)  NOT NULL,
    salary         numeric(8,2),
    commission_pct numeric(2,2),
    manager_id     integer,
    department_id  integer,
    CONSTRAINT emp_emp_id_pk PRIMARY KEY (employee_id),
    CONSTRAINT emp_email_uk  UNIQUE (email),
    CONSTRAINT emp_salary_min CHECK (salary > 0)
);

CREATE TABLE job_history (
    employee_id   integer     NOT NULL,
    start_date    date        NOT NULL,
    end_date      date        NOT NULL,
    job_id        varchar(10) NOT NULL,
    department_id integer,
    CONSTRAINT jhist_emp_id_st_date_pk PRIMARY KEY (employee_id, start_date),
    CONSTRAINT jhist_date_interval CHECK (end_date > start_date)
);

-- Sequences (Oracle: NOCACHE NOCYCLE). Used for manual inserts of new rows.
CREATE SEQUENCE locations_seq   START WITH 3300 INCREMENT BY 100 MAXVALUE 9900 NO CYCLE CACHE 1;
CREATE SEQUENCE departments_seq START WITH 280  INCREMENT BY 10  MAXVALUE 9990 NO CYCLE CACHE 1;
CREATE SEQUENCE employees_seq   START WITH 207  INCREMENT BY 1   NO CYCLE CACHE 1;
