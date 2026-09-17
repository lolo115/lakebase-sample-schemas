-- CO - views. Oracle-specific constructs mapped to PostgreSQL:
--   LISTAGG(... ON OVERFLOW ...)      -> string_agg(... ORDER BY ...)
--   GROUPING_ID(a,b) + GROUP BY GROUPING SETS -> GROUPING(a,b) + GROUP BY GROUPING SETS
--   JSON_TABLE( ... NESTED PATH ... ) -> LATERAL jsonb_array_elements(...)
SET search_path TO co, public;

CREATE OR REPLACE VIEW customer_order_products AS
  SELECT o.order_id, o.order_tms, o.order_status,
         c.customer_id, c.email_address, c.full_name,
         SUM(oi.quantity * oi.unit_price) AS order_total,
         string_agg(p.product_name, ', ' ORDER BY oi.line_item_id) AS items
  FROM   orders o
  JOIN   order_items oi ON o.order_id = oi.order_id
  JOIN   customers c    ON o.customer_id = c.customer_id
  JOIN   products p     ON oi.product_id = p.product_id
  GROUP  BY o.order_id, o.order_tms, o.order_status,
            c.customer_id, c.email_address, c.full_name;

CREATE OR REPLACE VIEW store_orders AS
  SELECT CASE GROUPING(s.store_name, o.order_status)
             WHEN 1 THEN 'STORE TOTAL'
             WHEN 2 THEN 'STATUS TOTAL'
             WHEN 3 THEN 'GRAND TOTAL'
         END AS total,
         s.store_name,
         COALESCE(s.web_address, s.physical_address) AS address,
         s.latitude, s.longitude,
         o.order_status,
         COUNT(DISTINCT o.order_id)          AS order_count,
         SUM(oi.quantity * oi.unit_price)    AS total_sales
  FROM   stores s
  JOIN   orders o       ON s.store_id = o.store_id
  JOIN   order_items oi ON o.order_id = oi.order_id
  GROUP  BY GROUPING SETS (
    (s.store_name, COALESCE(s.web_address, s.physical_address), s.latitude, s.longitude),
    (s.store_name, COALESCE(s.web_address, s.physical_address), s.latitude, s.longitude, o.order_status),
    (o.order_status),
    ()
  );

CREATE OR REPLACE VIEW product_reviews AS
  SELECT p.product_name,
         (r->>'rating')::int AS rating,
         ROUND(AVG((r->>'rating')::int) OVER (PARTITION BY p.product_name), 2) AS avg_rating,
         r->>'review' AS review
  FROM   products p
  CROSS JOIN LATERAL jsonb_array_elements(p.product_details->'reviews') AS r
  WHERE  jsonb_typeof(p.product_details->'reviews') = 'array';

CREATE OR REPLACE VIEW product_orders AS
  SELECT p.product_name, o.order_status,
         SUM(oi.quantity * oi.unit_price) AS total_sales,
         COUNT(*) AS order_count
  FROM   orders o
  JOIN   order_items oi ON o.order_id = oi.order_id
  JOIN   customers c    ON o.customer_id = c.customer_id
  JOIN   products p     ON oi.product_id = p.product_id
  GROUP  BY p.product_name, o.order_status;
