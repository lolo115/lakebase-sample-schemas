-- Top 10 customers by lifetime spend
SET search_path TO co, public;

SELECT c.customer_id, c.full_name, c.email_address,
       COUNT(DISTINCT o.order_id)                 AS orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS lifetime_spend
FROM customers c
JOIN orders o       ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY c.customer_id, c.full_name, c.email_address
ORDER BY lifetime_spend DESC
LIMIT 10;
