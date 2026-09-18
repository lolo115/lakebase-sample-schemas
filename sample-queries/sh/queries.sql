-- SH (Sales History) sample queries
-- Run against a database that has the `sh` schema loaded:
--   psql -f queries.sql
SET search_path TO sh, public;

-- 1. Total revenue and units by calendar year
SELECT t.calendar_year,
       ROUND(SUM(s.amount_sold), 2) AS revenue,
       SUM(s.quantity_sold)         AS units
FROM sales s
JOIN times t ON s.time_id = t.time_id
GROUP BY t.calendar_year
ORDER BY t.calendar_year;

-- 2. Top 10 products by revenue
SELECT p.prod_id, p.prod_name, p.prod_category,
       ROUND(SUM(s.amount_sold), 2) AS revenue,
       SUM(s.quantity_sold)         AS units
FROM sales s
JOIN products p ON s.prod_id = p.prod_id
GROUP BY p.prod_id, p.prod_name, p.prod_category
ORDER BY revenue DESC
LIMIT 10;

-- 3. Revenue by sales channel, with share of total
SELECT c.channel_desc,
       ROUND(SUM(s.amount_sold), 2) AS revenue,
       ROUND(100.0 * SUM(s.amount_sold) / SUM(SUM(s.amount_sold)) OVER (), 1) AS pct_of_total
FROM sales s
JOIN channels c ON s.channel_id = c.channel_id
GROUP BY c.channel_desc
ORDER BY revenue DESC;

-- 4. Revenue by customer region and country
SELECT co.country_region AS region, co.country_name AS country,
       ROUND(SUM(s.amount_sold), 2) AS revenue
FROM sales s
JOIN customers cu ON s.cust_id = cu.cust_id
JOIN countries co ON cu.country_id = co.country_id
GROUP BY co.country_region, co.country_name
ORDER BY revenue DESC
LIMIT 15;

-- 5. Monthly sales trend
SELECT t.calendar_month_desc,
       ROUND(SUM(s.amount_sold), 2) AS revenue
FROM sales s
JOIN times t ON s.time_id = t.time_id
GROUP BY t.calendar_month_desc
ORDER BY t.calendar_month_desc;

-- 6. Revenue by promotion type (includes the "no promotion" bucket)
SELECT pr.promo_subcategory,
       COUNT(*)                     AS line_items,
       ROUND(SUM(s.amount_sold), 2) AS revenue
FROM sales s
JOIN promotions pr ON s.promo_id = pr.promo_id
GROUP BY pr.promo_subcategory
ORDER BY revenue DESC
LIMIT 15;

-- 7. Profit and margin by product category (uses the profits view)
SELECT p.prod_category,
       ROUND(SUM(pr.amount_sold), 2)                  AS revenue,
       ROUND(SUM(pr.total_cost), 2)                   AS cost,
       ROUND(SUM(pr.amount_sold - pr.total_cost), 2)  AS profit,
       ROUND(100.0 * SUM(pr.amount_sold - pr.total_cost)
             / NULLIF(SUM(pr.amount_sold), 0), 1)     AS margin_pct
FROM profits pr
JOIN products p ON pr.prod_id = p.prod_id
GROUP BY p.prod_category
ORDER BY profit DESC;

-- 8. Year-over-year revenue growth
WITH yearly AS (
    SELECT t.calendar_year AS yr, SUM(s.amount_sold) AS revenue
    FROM sales s
    JOIN times t ON s.time_id = t.time_id
    GROUP BY t.calendar_year
)
SELECT yr,
       ROUND(revenue, 2)                        AS revenue,
       ROUND(LAG(revenue) OVER (ORDER BY yr), 2) AS prev_year,
       ROUND(100.0 * (revenue - LAG(revenue) OVER (ORDER BY yr))
             / NULLIF(LAG(revenue) OVER (ORDER BY yr), 0), 1) AS yoy_growth_pct
FROM yearly
ORDER BY yr;

-- 9. Revenue by customer education level (customer demographics)
SELECT d.education,
       COUNT(DISTINCT s.cust_id)    AS customers,
       ROUND(SUM(s.amount_sold), 2) AS revenue
FROM sales s
JOIN supplementary_demographics d ON s.cust_id = d.cust_id
WHERE d.education IS NOT NULL
GROUP BY d.education
ORDER BY revenue DESC;

-- 10. Top 10 customers by spend, with cumulative running total
WITH cust_rev AS (
    SELECT s.cust_id, SUM(s.amount_sold) AS revenue
    FROM sales s
    GROUP BY s.cust_id
)
SELECT cu.cust_first_name || ' ' || cu.cust_last_name AS customer,
       ROUND(cr.revenue, 2)                                    AS revenue,
       ROUND(SUM(cr.revenue) OVER (ORDER BY cr.revenue DESC), 2) AS cumulative
FROM cust_rev cr
JOIN customers cu ON cu.cust_id = cr.cust_id
ORDER BY cr.revenue DESC
LIMIT 10;
