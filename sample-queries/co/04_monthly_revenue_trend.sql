-- Monthly revenue trend
SET search_path TO co, public;

SELECT date_trunc('month', o.order_tms)::date     AS month,
       COUNT(DISTINCT o.order_id)                 AS orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY month
ORDER BY month;
