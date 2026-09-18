-- Revenue by customer region and country
SET search_path TO sh, public;

SELECT co.country_region AS region, co.country_name AS country,
       ROUND(SUM(s.amount_sold), 2) AS revenue
FROM sales s
JOIN customers cu ON s.cust_id = cu.cust_id
JOIN countries co ON cu.country_id = co.country_id
GROUP BY co.country_region, co.country_name
ORDER BY revenue DESC
LIMIT 15;
