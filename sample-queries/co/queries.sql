-- CO (Customer Orders) sample queries
-- Run against a database that has the `co` schema loaded:
--   psql -f queries.sql
SET search_path TO co, public;

-- 1. Revenue and order count by order status
SELECT o.order_status,
       COUNT(DISTINCT o.order_id)                 AS orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_status
ORDER BY revenue DESC;

-- 2. Top 10 customers by lifetime spend
SELECT c.customer_id, c.full_name, c.email_address,
       COUNT(DISTINCT o.order_id)                 AS orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS lifetime_spend
FROM customers c
JOIN orders o       ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY c.customer_id, c.full_name, c.email_address
ORDER BY lifetime_spend DESC
LIMIT 10;

-- 3. Best-selling products by revenue and units
SELECT p.product_id, p.product_name,
       SUM(oi.quantity)                           AS units_sold,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC
LIMIT 10;

-- 4. Monthly revenue trend
SELECT date_trunc('month', o.order_tms)::date     AS month,
       COUNT(DISTINCT o.order_id)                 AS orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY month
ORDER BY month;

-- 5. Store performance: orders, revenue and average order value
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

-- 6. Highest-rated products (reviews stored as JSON in products.product_details)
SELECT product_name,
       ROUND(AVG(rating), 2) AS avg_rating,
       COUNT(*)              AS reviews
FROM product_reviews
GROUP BY product_name
ORDER BY avg_rating DESC, reviews DESC
LIMIT 10;

-- 7. Product attributes read straight out of the JSON column
SELECT product_id, product_name,
       product_details->>'brand'  AS brand,
       product_details->>'gender' AS gender,
       jsonb_array_length(COALESCE(product_details->'reviews', '[]'::jsonb)) AS num_reviews,
       jsonb_array_length(COALESCE(product_details->'sizes',   '[]'::jsonb)) AS num_sizes
FROM products
WHERE product_details IS NOT NULL
ORDER BY num_reviews DESC
LIMIT 10;

-- 8. Repeat customers (more than one order)
SELECT c.customer_id, c.full_name, COUNT(DISTINCT o.order_id) AS orders
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY orders DESC
LIMIT 10;

-- 9. Stock on hand vs units sold (aggregated separately to avoid fan-out)
SELECT p.product_name,
       COALESCE(inv.on_hand, 0)    AS on_hand,
       COALESCE(sold.units_sold, 0) AS units_sold
FROM products p
LEFT JOIN (SELECT product_id, SUM(product_inventory) AS on_hand
           FROM inventory GROUP BY product_id) inv  ON inv.product_id = p.product_id
LEFT JOIN (SELECT product_id, SUM(quantity) AS units_sold
           FROM order_items GROUP BY product_id) sold ON sold.product_id = p.product_id
ORDER BY (COALESCE(sold.units_sold, 0) - COALESCE(inv.on_hand, 0)) DESC
LIMIT 10;

-- 10. Order fulfilment: value by shipment status
SELECT sh.shipment_status,
       COUNT(DISTINCT oi.order_id)                AS orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS value
FROM shipments sh
JOIN order_items oi ON oi.shipment_id = sh.shipment_id
GROUP BY sh.shipment_status
ORDER BY value DESC;
