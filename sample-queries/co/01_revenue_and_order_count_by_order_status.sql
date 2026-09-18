-- Revenue and order count by order status
SET search_path TO co, public;

SELECT o.order_status,
       COUNT(DISTINCT o.order_id)                 AS orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_status
ORDER BY revenue DESC;
