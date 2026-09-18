-- Highest-rated products (reviews stored as JSON in products.product_details)
SET search_path TO co, public;

SELECT product_name,
       ROUND(AVG(rating), 2) AS avg_rating,
       COUNT(*)              AS reviews
FROM product_reviews
GROUP BY product_name
ORDER BY avg_rating DESC, reviews DESC
LIMIT 10;
