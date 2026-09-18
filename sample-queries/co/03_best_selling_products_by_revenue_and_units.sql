-- Best-selling products by revenue and units
SET search_path TO co, public;

SELECT p.product_id, p.product_name,
       SUM(oi.quantity)                           AS units_sold,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC
LIMIT 10;
