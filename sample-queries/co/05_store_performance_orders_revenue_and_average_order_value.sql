-- Store performance: orders, revenue and average order value
SET search_path TO co, public;

SELECT s.store_name,
       COUNT(DISTINCT o.order_id)                 AS orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue,
       ROUND(SUM(oi.quantity * oi.unit_price)
             / COUNT(DISTINCT o.order_id), 2)     AS avg_order_value
FROM stores s
JOIN orders o       ON o.store_id = s.store_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY s.store_name
ORDER BY revenue DESC;
