-- Order fulfilment: value by shipment status
SET search_path TO co, public;

SELECT sh.shipment_status,
       COUNT(DISTINCT oi.order_id)                AS orders,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS value
FROM shipments sh
JOIN order_items oi ON oi.shipment_id = sh.shipment_id
GROUP BY sh.shipment_status
ORDER BY value DESC;
