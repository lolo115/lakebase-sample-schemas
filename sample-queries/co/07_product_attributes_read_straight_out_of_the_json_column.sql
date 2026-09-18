-- Product attributes read straight out of the JSON column
SET search_path TO co, public;

SELECT product_id, product_name,
       product_details->>'brand'  AS brand,
       product_details->>'gender' AS gender,
       jsonb_array_length(COALESCE(product_details->'reviews', '[]'::jsonb)) AS num_reviews,
       jsonb_array_length(COALESCE(product_details->'sizes',   '[]'::jsonb)) AS num_sizes
FROM products
WHERE product_details IS NOT NULL
ORDER BY num_reviews DESC
LIMIT 10;
