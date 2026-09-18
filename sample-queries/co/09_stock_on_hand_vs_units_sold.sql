-- Stock on hand vs units sold (aggregated separately to avoid fan-out)
SET search_path TO co, public;

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
