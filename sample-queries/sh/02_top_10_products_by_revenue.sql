-- Top 10 products by revenue
SET search_path TO sh, public;

SELECT p.prod_id, p.prod_name, p.prod_category,
       ROUND(SUM(s.amount_sold), 2) AS revenue,
       SUM(s.quantity_sold)         AS units
FROM sales s
JOIN products p ON s.prod_id = p.prod_id
GROUP BY p.prod_id, p.prod_name, p.prod_category
ORDER BY revenue DESC
LIMIT 10;
