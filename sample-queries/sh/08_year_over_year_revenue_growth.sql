-- Year-over-year revenue growth
SET search_path TO sh, public;

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
