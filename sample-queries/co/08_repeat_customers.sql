-- Repeat customers (more than one order)
SET search_path TO co, public;

SELECT c.customer_id, c.full_name, COUNT(DISTINCT o.order_id) AS orders
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY orders DESC
LIMIT 10;
