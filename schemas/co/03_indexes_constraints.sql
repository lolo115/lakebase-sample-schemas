-- CO - secondary indexes and foreign keys (after data load).
SET search_path TO co, public;

CREATE INDEX customers_name_i          ON customers   (full_name);
CREATE INDEX orders_customer_id_i      ON orders      (customer_id);
CREATE INDEX orders_store_id_i         ON orders      (store_id);
CREATE INDEX shipments_store_id_i      ON shipments   (store_id);
CREATE INDEX shipments_customer_id_i   ON shipments   (customer_id);
CREATE INDEX order_items_shipment_id_i ON order_items (shipment_id);
CREATE INDEX inventory_product_id_i    ON inventory   (product_id);

ALTER TABLE orders      ADD CONSTRAINT orders_customer_id_fk     FOREIGN KEY (customer_id) REFERENCES customers (customer_id);
ALTER TABLE orders      ADD CONSTRAINT orders_store_id_fk        FOREIGN KEY (store_id)    REFERENCES stores (store_id);
ALTER TABLE shipments   ADD CONSTRAINT shipments_store_id_fk     FOREIGN KEY (store_id)    REFERENCES stores (store_id);
ALTER TABLE shipments   ADD CONSTRAINT shipments_customer_id_fk  FOREIGN KEY (customer_id) REFERENCES customers (customer_id);
ALTER TABLE order_items ADD CONSTRAINT order_items_order_id_fk   FOREIGN KEY (order_id)    REFERENCES orders (order_id);
ALTER TABLE order_items ADD CONSTRAINT order_items_shipment_id_fk FOREIGN KEY (shipment_id) REFERENCES shipments (shipment_id);
ALTER TABLE order_items ADD CONSTRAINT order_items_product_id_fk FOREIGN KEY (product_id)  REFERENCES products (product_id);
ALTER TABLE inventory   ADD CONSTRAINT inventory_store_id_fk     FOREIGN KEY (store_id)    REFERENCES stores (store_id);
ALTER TABLE inventory   ADD CONSTRAINT inventory_product_id_fk   FOREIGN KEY (product_id)  REFERENCES products (product_id);
