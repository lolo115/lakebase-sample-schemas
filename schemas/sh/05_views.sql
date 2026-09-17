-- SH - views and materialized views.
--   Oracle "ENABLE QUERY REWRITE" is dropped (no PostgreSQL equivalent).
--   PostgreSQL materialized views are populated at CREATE time; REFRESH to update them.
SET search_path TO sh, public;

CREATE OR REPLACE VIEW profits AS
  SELECT s.channel_id, s.cust_id, s.prod_id, s.promo_id, s.time_id,
         c.unit_cost, c.unit_price, s.amount_sold, s.quantity_sold,
         c.unit_cost * s.quantity_sold AS total_cost
  FROM   costs c
  JOIN   sales s
    ON   c.prod_id = s.prod_id
   AND   c.time_id = s.time_id
   AND   c.channel_id = s.channel_id
   AND   c.promo_id = s.promo_id;

CREATE MATERIALIZED VIEW cal_month_sales_mv AS
  SELECT t.calendar_month_desc, SUM(s.amount_sold) AS dollars
  FROM   sales s
  JOIN   times t ON s.time_id = t.time_id
  GROUP  BY t.calendar_month_desc;

CREATE MATERIALIZED VIEW fweek_pscat_sales_mv AS
  SELECT t.week_ending_day, p.prod_subcategory,
         SUM(s.amount_sold) AS dollars, s.channel_id, s.promo_id
  FROM   sales s
  JOIN   times t    ON s.time_id = t.time_id
  JOIN   products p ON s.prod_id = p.prod_id
  GROUP  BY t.week_ending_day, p.prod_subcategory, s.channel_id, s.promo_id;
