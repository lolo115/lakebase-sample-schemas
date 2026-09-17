-- SH (Sales History) - tables, primary keys, and RANGE partitioning for SALES and COSTS.
-- Ported from Oracle sh_create.sql.
--   Oracle range partitions (VALUES LESS THAN TO_DATE(...)) -> PostgreSQL declarative
--     partitions (FOR VALUES FROM (..) TO (..)); Oracle COMPRESS clause dropped.
--   A DEFAULT partition is added on each table as a safety net.
-- Foreign keys are added after data load (04_constraints.sql).
SET search_path TO sh, public;

CREATE TABLE countries (
    country_id           integer     NOT NULL,
    country_iso_code     char(2)     NOT NULL,
    country_name         varchar(40) NOT NULL,
    country_subregion    varchar(30) NOT NULL,
    country_subregion_id integer     NOT NULL,
    country_region       varchar(20) NOT NULL,
    country_region_id    integer     NOT NULL,
    country_total        varchar(11) NOT NULL,
    country_total_id     integer     NOT NULL,
    CONSTRAINT countries_pk PRIMARY KEY (country_id)
);

CREATE TABLE customers (
    cust_id                integer     NOT NULL,
    cust_first_name        varchar(20) NOT NULL,
    cust_last_name         varchar(40) NOT NULL,
    cust_gender            char(1)     NOT NULL,
    cust_year_of_birth     integer     NOT NULL,
    cust_marital_status    varchar(20),
    cust_street_address    varchar(40) NOT NULL,
    cust_postal_code       varchar(10) NOT NULL,
    cust_city              varchar(30) NOT NULL,
    cust_city_id           integer     NOT NULL,
    cust_state_province    varchar(40) NOT NULL,
    cust_state_province_id integer     NOT NULL,
    country_id             integer     NOT NULL,
    cust_main_phone_number varchar(25) NOT NULL,
    cust_income_level      varchar(30),
    cust_credit_limit      numeric,
    cust_email             varchar(50),
    cust_total             varchar(14) NOT NULL,
    cust_total_id          integer     NOT NULL,
    cust_src_id            integer,
    cust_eff_from          date,
    cust_eff_to            date,
    cust_valid             varchar(1),
    CONSTRAINT customers_pk PRIMARY KEY (cust_id)
);

CREATE TABLE promotions (
    promo_id             integer      NOT NULL,
    promo_name           varchar(30)  NOT NULL,
    promo_subcategory    varchar(30)  NOT NULL,
    promo_subcategory_id integer      NOT NULL,
    promo_category       varchar(30)  NOT NULL,
    promo_category_id    integer      NOT NULL,
    promo_cost           numeric(10,2) NOT NULL,
    promo_begin_date     date         NOT NULL,
    promo_end_date       date         NOT NULL,
    promo_total          varchar(15)  NOT NULL,
    promo_total_id       integer      NOT NULL,
    CONSTRAINT promo_pk PRIMARY KEY (promo_id)
);

CREATE TABLE products (
    prod_id               integer       NOT NULL,
    prod_name             varchar(50)   NOT NULL,
    prod_desc             varchar(4000) NOT NULL,
    prod_subcategory      varchar(50)   NOT NULL,
    prod_subcategory_id   integer       NOT NULL,
    prod_subcategory_desc varchar(2000) NOT NULL,
    prod_category         varchar(50)   NOT NULL,
    prod_category_id      integer       NOT NULL,
    prod_category_desc    varchar(2000) NOT NULL,
    prod_weight_class     integer       NOT NULL,
    prod_unit_of_measure  varchar(20),
    prod_pack_size        varchar(30)   NOT NULL,
    supplier_id           integer       NOT NULL,
    prod_status           varchar(20)   NOT NULL,
    prod_list_price       numeric(8,2)  NOT NULL,
    prod_min_price        numeric(8,2)  NOT NULL,
    prod_total            varchar(13)   NOT NULL,
    prod_total_id         integer       NOT NULL,
    prod_src_id           integer,
    prod_eff_from         date,
    prod_eff_to           date,
    prod_valid            varchar(1),
    CONSTRAINT products_pk PRIMARY KEY (prod_id)
);

CREATE TABLE times (
    time_id                 date        NOT NULL,
    day_name                varchar(9)  NOT NULL,
    day_number_in_week      integer     NOT NULL,
    day_number_in_month     integer     NOT NULL,
    calendar_week_number    integer     NOT NULL,
    fiscal_week_number      integer     NOT NULL,
    week_ending_day         date        NOT NULL,
    week_ending_day_id      integer     NOT NULL,
    calendar_month_number   integer     NOT NULL,
    fiscal_month_number     integer     NOT NULL,
    calendar_month_desc     varchar(8)  NOT NULL,
    calendar_month_id       integer     NOT NULL,
    fiscal_month_desc       varchar(8)  NOT NULL,
    fiscal_month_id         integer     NOT NULL,
    days_in_cal_month       integer     NOT NULL,
    days_in_fis_month       integer     NOT NULL,
    end_of_cal_month        date        NOT NULL,
    end_of_fis_month        date        NOT NULL,
    calendar_month_name     varchar(9)  NOT NULL,
    fiscal_month_name       varchar(9)  NOT NULL,
    calendar_quarter_desc   char(7)     NOT NULL,
    calendar_quarter_id     integer     NOT NULL,
    fiscal_quarter_desc     char(7)     NOT NULL,
    fiscal_quarter_id       integer     NOT NULL,
    days_in_cal_quarter     integer     NOT NULL,
    days_in_fis_quarter     integer     NOT NULL,
    end_of_cal_quarter      date        NOT NULL,
    end_of_fis_quarter      date        NOT NULL,
    calendar_quarter_number integer     NOT NULL,
    fiscal_quarter_number   integer     NOT NULL,
    calendar_year           integer     NOT NULL,
    calendar_year_id        integer     NOT NULL,
    fiscal_year             integer     NOT NULL,
    fiscal_year_id          integer     NOT NULL,
    days_in_cal_year        integer     NOT NULL,
    days_in_fis_year        integer     NOT NULL,
    end_of_cal_year         date        NOT NULL,
    end_of_fis_year         date        NOT NULL,
    CONSTRAINT times_pk PRIMARY KEY (time_id)
);

CREATE TABLE channels (
    channel_id       integer     NOT NULL,
    channel_desc     varchar(20) NOT NULL,
    channel_class    varchar(20) NOT NULL,
    channel_class_id integer     NOT NULL,
    channel_total    varchar(13) NOT NULL,
    channel_total_id integer     NOT NULL,
    CONSTRAINT channels_pk PRIMARY KEY (channel_id)
);

-- Fact table: no primary key (rows identified by the combination of foreign keys).
CREATE TABLE sales (
    prod_id       integer       NOT NULL,
    cust_id       integer       NOT NULL,
    time_id       date          NOT NULL,
    channel_id    integer       NOT NULL,
    promo_id      integer       NOT NULL,
    quantity_sold integer       NOT NULL,
    amount_sold   numeric(10,2) NOT NULL
) PARTITION BY RANGE (time_id);

CREATE TABLE sales_2018     PARTITION OF sales FOR VALUES FROM (MINVALUE)     TO ('2019-01-01');
CREATE TABLE sales_h1_2019  PARTITION OF sales FOR VALUES FROM ('2019-01-01') TO ('2019-07-01');
CREATE TABLE sales_h2_2019  PARTITION OF sales FOR VALUES FROM ('2019-07-01') TO ('2020-01-01');
CREATE TABLE sales_q1_2020  PARTITION OF sales FOR VALUES FROM ('2020-01-01') TO ('2020-04-01');
CREATE TABLE sales_q2_2020  PARTITION OF sales FOR VALUES FROM ('2020-04-01') TO ('2020-07-01');
CREATE TABLE sales_q3_2020  PARTITION OF sales FOR VALUES FROM ('2020-07-01') TO ('2020-10-01');
CREATE TABLE sales_q4_2020  PARTITION OF sales FOR VALUES FROM ('2020-10-01') TO ('2021-01-01');
CREATE TABLE sales_q1_2021  PARTITION OF sales FOR VALUES FROM ('2021-01-01') TO ('2021-04-01');
CREATE TABLE sales_q2_2021  PARTITION OF sales FOR VALUES FROM ('2021-04-01') TO ('2021-07-01');
CREATE TABLE sales_q3_2021  PARTITION OF sales FOR VALUES FROM ('2021-07-01') TO ('2021-10-01');
CREATE TABLE sales_q4_2021  PARTITION OF sales FOR VALUES FROM ('2021-10-01') TO ('2022-01-01');
CREATE TABLE sales_q1_2022  PARTITION OF sales FOR VALUES FROM ('2022-01-01') TO ('2022-04-01');
CREATE TABLE sales_q2_2022  PARTITION OF sales FOR VALUES FROM ('2022-04-01') TO ('2022-07-01');
CREATE TABLE sales_q3_2022  PARTITION OF sales FOR VALUES FROM ('2022-07-01') TO ('2022-10-01');
CREATE TABLE sales_q4_2022  PARTITION OF sales FOR VALUES FROM ('2022-10-01') TO ('2023-01-01');
CREATE TABLE sales_default  PARTITION OF sales DEFAULT;

CREATE TABLE costs (
    prod_id    integer       NOT NULL,
    time_id    date          NOT NULL,
    promo_id   integer       NOT NULL,
    channel_id integer       NOT NULL,
    unit_cost  numeric(10,2) NOT NULL,
    unit_price numeric(10,2) NOT NULL
) PARTITION BY RANGE (time_id);

CREATE TABLE costs_q1_2019 PARTITION OF costs FOR VALUES FROM (MINVALUE)     TO ('2019-04-01');
CREATE TABLE costs_q2_2019 PARTITION OF costs FOR VALUES FROM ('2019-04-01') TO ('2019-07-01');
CREATE TABLE costs_q3_2019 PARTITION OF costs FOR VALUES FROM ('2019-07-01') TO ('2019-10-01');
CREATE TABLE costs_q4_2019 PARTITION OF costs FOR VALUES FROM ('2019-10-01') TO ('2020-01-01');
CREATE TABLE costs_q1_2020 PARTITION OF costs FOR VALUES FROM ('2020-01-01') TO ('2020-04-01');
CREATE TABLE costs_q2_2020 PARTITION OF costs FOR VALUES FROM ('2020-04-01') TO ('2020-07-01');
CREATE TABLE costs_q3_2020 PARTITION OF costs FOR VALUES FROM ('2020-07-01') TO ('2020-10-01');
CREATE TABLE costs_q4_2020 PARTITION OF costs FOR VALUES FROM ('2020-10-01') TO ('2021-01-01');
CREATE TABLE costs_q1_2021 PARTITION OF costs FOR VALUES FROM ('2021-01-01') TO ('2021-04-01');
CREATE TABLE costs_q2_2021 PARTITION OF costs FOR VALUES FROM ('2021-04-01') TO ('2021-07-01');
CREATE TABLE costs_q3_2021 PARTITION OF costs FOR VALUES FROM ('2021-07-01') TO ('2021-10-01');
CREATE TABLE costs_q4_2021 PARTITION OF costs FOR VALUES FROM ('2021-10-01') TO ('2022-01-01');
CREATE TABLE costs_q1_2022 PARTITION OF costs FOR VALUES FROM ('2022-01-01') TO ('2022-04-01');
CREATE TABLE costs_q2_2022 PARTITION OF costs FOR VALUES FROM ('2022-04-01') TO ('2022-07-01');
CREATE TABLE costs_q3_2022 PARTITION OF costs FOR VALUES FROM ('2022-07-01') TO ('2022-10-01');
CREATE TABLE costs_q4_2022 PARTITION OF costs FOR VALUES FROM ('2022-10-01') TO ('2023-01-01');
CREATE TABLE costs_q1_2023 PARTITION OF costs FOR VALUES FROM ('2023-01-01') TO ('2023-04-01');
CREATE TABLE costs_q2_2023 PARTITION OF costs FOR VALUES FROM ('2023-04-01') TO ('2023-07-01');
CREATE TABLE costs_q3_2023 PARTITION OF costs FOR VALUES FROM ('2023-07-01') TO ('2023-10-01');
CREATE TABLE costs_q4_2023 PARTITION OF costs FOR VALUES FROM ('2023-10-01') TO ('2024-01-01');
CREATE TABLE costs_default PARTITION OF costs DEFAULT;

CREATE TABLE supplementary_demographics (
    cust_id        integer NOT NULL,
    education      varchar(21),
    occupation     varchar(21),
    household_size varchar(21),
    yrs_residence  integer,
    affinity_card  bigint,
    cricket        bigint,
    baseball       bigint,
    tennis         bigint,
    soccer         bigint,
    golf           bigint,
    unknown        bigint,
    misc           bigint,
    comments       varchar(4000),
    CONSTRAINT supp_demo_pk PRIMARY KEY (cust_id)
);
