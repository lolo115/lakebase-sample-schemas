-- CO - after loading rows with explicit IDENTITY values, advance each identity
-- sequence past the highest loaded id so future inserts don't collide.
SET search_path TO co, public;

SELECT setval(pg_get_serial_sequence('co.customers','customer_id'), COALESCE((SELECT max(customer_id) FROM customers), 1));
SELECT setval(pg_get_serial_sequence('co.stores','store_id'),       COALESCE((SELECT max(store_id)    FROM stores), 1));
SELECT setval(pg_get_serial_sequence('co.products','product_id'),   COALESCE((SELECT max(product_id)  FROM products), 1));
SELECT setval(pg_get_serial_sequence('co.orders','order_id'),       COALESCE((SELECT max(order_id)    FROM orders), 1));
SELECT setval(pg_get_serial_sequence('co.shipments','shipment_id'), COALESCE((SELECT max(shipment_id) FROM shipments), 1));
SELECT setval(pg_get_serial_sequence('co.inventory','inventory_id'),COALESCE((SELECT max(inventory_id) FROM inventory), 1));
