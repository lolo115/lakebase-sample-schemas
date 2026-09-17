-- Generated from Oracle sample schemas (MIT). Do not edit by hand.
SET search_path TO co, public;

COMMENT ON TABLE customers
  IS 'Details of the people placing orders';
COMMENT ON COLUMN customers.customer_id
  IS 'Auto-incrementing primary key';
COMMENT ON COLUMN customers.email_address
  IS 'The email address the person uses to access the account';
COMMENT ON COLUMN customers.full_name
  IS 'What this customer is called';
COMMENT ON TABLE stores
  IS 'Physical and virtual locations where people can purchase products';
COMMENT ON COLUMN stores.store_id
  IS 'Auto-incrementing primary key';
COMMENT ON COLUMN stores.store_name
  IS 'What the store is called';
COMMENT ON COLUMN stores.web_address
  IS 'The URL of a virtual store';
COMMENT ON COLUMN stores.physical_address
  IS 'The postal address of this location';
COMMENT ON COLUMN stores.latitude
  IS 'The north-south position of a physical store';
COMMENT ON COLUMN stores.longitude
  IS 'The east-west position of a physical store';
COMMENT ON COLUMN stores.logo
  IS 'An image used by this store';
COMMENT ON COLUMN stores.logo_mime_type
  IS 'The mime-type of the store logo';
COMMENT ON COLUMN stores.logo_last_updated
  IS 'The date the image was last changed';
COMMENT ON COLUMN stores.logo_filename
  IS 'The name of the file loaded in the image column';
COMMENT ON COLUMN stores.logo_charset
  IS 'The character set used to encode the image';
COMMENT ON TABLE products
  IS 'Details of goods that customers can purchase';
COMMENT ON COLUMN products.product_id
  IS 'Auto-incrementing primary key';
COMMENT ON COLUMN products.unit_price
  IS 'The monetary value of one item of this product';
COMMENT ON COLUMN products.product_details
  IS 'Further details of the product stored in JSON format';
COMMENT ON COLUMN products.product_image
  IS 'A picture of the product';
COMMENT ON COLUMN products.image_mime_type
  IS 'The mime-type of the product image';
COMMENT ON COLUMN products.image_last_updated
  IS 'The date the image was last changed';
COMMENT ON COLUMN products.image_filename
  IS 'The name of the file loaded in the image column';
COMMENT ON COLUMN products.image_charset
  IS 'The character set used to encode the image';
COMMENT ON COLUMN products.product_name
  IS 'What a product is called';
COMMENT ON TABLE orders
  IS 'Details of who made purchases where';
COMMENT ON COLUMN orders.order_id
  IS 'Auto-incrementing primary key';
COMMENT ON COLUMN orders.order_tms
  IS 'When the order was placed';
COMMENT ON COLUMN orders.customer_id
  IS 'Who placed this order';
COMMENT ON COLUMN orders.store_id
  IS 'Where this order was placed';
COMMENT ON COLUMN orders.order_status
  IS 'What state the order is in. Valid values are:
OPEN - the order is in progress
PAID - money has been received from the customer for this order
SHIPPED - the products have been dispatched to the customer
COMPLETE - the customer has received the order
CANCELLED - the customer has stopped the order
REFUNDED - there has been an issue with the order and the money has been returned to the customer';
COMMENT ON TABLE order_items
  IS 'Details of which products the customer has purchased in an order';
COMMENT ON COLUMN order_items.order_id
  IS 'The order these products belong to';
COMMENT ON COLUMN order_items.line_item_id
  IS 'An incrementing number, starting at one for each order';
COMMENT ON COLUMN order_items.product_id
  IS 'Which item was purchased';
COMMENT ON COLUMN order_items.unit_price
  IS 'How much the customer paid for one item of the product';
COMMENT ON COLUMN order_items.quantity
  IS 'How many items of this product the customer purchased';
COMMENT ON COLUMN order_items.shipment_id
  IS 'Where this product will be delivered';
COMMENT ON VIEW customer_order_products
  IS 'A summary of who placed each order and what they bought';
COMMENT ON COLUMN customer_order_products.order_id
  IS 'The primary key of the order';
COMMENT ON COLUMN customer_order_products.order_tms
  IS 'The date and time the order was placed';
COMMENT ON COLUMN customer_order_products.order_status
  IS 'The current state of this order';
COMMENT ON COLUMN customer_order_products.customer_id
  IS 'The primary key of the customer';
COMMENT ON COLUMN customer_order_products.email_address
  IS 'The email address the person uses to access the account';
COMMENT ON COLUMN customer_order_products.full_name
  IS 'What this customer is called';
COMMENT ON COLUMN customer_order_products.order_total
  IS 'The total amount the customer paid for the order';
COMMENT ON COLUMN customer_order_products.items
  IS 'A comma-separated list naming the products in this order';
COMMENT ON VIEW store_orders
  IS 'A summary of what was purchased at each location, including summaries each store, order status and overall total';
COMMENT ON COLUMN store_orders.order_status
  IS 'The current state of this order';
COMMENT ON COLUMN store_orders.total
  IS 'Indicates what type of total is displayed, including Store, Status, or Grand Totals';
COMMENT ON COLUMN store_orders.store_name
  IS 'What the store is called';
COMMENT ON COLUMN store_orders.latitude
  IS 'The north-south position of a physical store';
COMMENT ON COLUMN store_orders.longitude
  IS 'The east-west position of a physical store';
COMMENT ON COLUMN store_orders.address
  IS 'The physical or virtual location of this store';
COMMENT ON COLUMN store_orders.total_sales
  IS 'The total value of orders placed';
COMMENT ON COLUMN store_orders.order_count
  IS 'The total number of orders placed';
COMMENT ON VIEW product_reviews
  IS 'A relational view of the reviews stored in the JSON for each product';
COMMENT ON COLUMN product_reviews.product_name
  IS 'What this product is called';
COMMENT ON COLUMN product_reviews.rating
  IS 'The review score the customer has placed. Range is 1-10';
COMMENT ON COLUMN product_reviews.avg_rating
  IS 'The mean of the review scores for this product';
COMMENT ON COLUMN product_reviews.review
  IS 'The text of the review';
COMMENT ON VIEW product_orders
  IS 'A summary of the state of the orders placed for each product';
COMMENT ON COLUMN product_orders.product_name
  IS 'What this product is called';
COMMENT ON COLUMN product_orders.order_status
  IS 'The current state of these order';
COMMENT ON COLUMN product_orders.total_sales
  IS 'The total value of orders placed';
COMMENT ON COLUMN product_orders.order_count
  IS 'The total number of orders placed';
COMMENT ON TABLE shipments
  IS 'Details of where ordered goods will be delivered';
COMMENT ON COLUMN shipments.shipment_id
  IS 'Auto-incrementing primary key';
COMMENT ON COLUMN shipments.store_id
  IS 'Which location the goods will be transported from';
COMMENT ON COLUMN shipments.customer_id
  IS 'Who this shipment is for';
COMMENT ON COLUMN shipments.delivery_address
  IS 'Where the goods will be transported to';
COMMENT ON COLUMN shipments.shipment_status
  IS 'The current status of the shipment. Valid values are:
CREATED - the shipment is ready for order assignment
SHIPPED - the goods have been dispatched
IN-TRANSIT - the goods are en-route to their destination
DELIVERED - the good have arrived at their destination';
COMMENT ON TABLE inventory
  IS 'Details of the quantity of stock available for products at each location';
COMMENT ON COLUMN inventory.inventory_id
  IS 'Auto-incrementing primary key';
COMMENT ON COLUMN inventory.store_id
  IS 'Which location the goods are located at';
COMMENT ON COLUMN inventory.product_id
  IS 'Which item this stock is for';
COMMENT ON COLUMN inventory.product_inventory
  IS 'The current quantity in stock';
