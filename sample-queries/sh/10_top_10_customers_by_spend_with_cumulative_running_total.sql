-- Top 10 customers by spend, with cumulative running total
SET search_path TO sh, public;

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
