-- Revenue by customer education level (customer demographics)
SET search_path TO sh, public;

SELECT d.education,
       COUNT(DISTINCT s.cust_id)    AS customers,
       ROUND(SUM(s.amount_sold), 2) AS revenue
FROM sales s
JOIN supplementary_demographics d ON s.cust_id = d.cust_id
WHERE d.education IS NOT NULL
GROUP BY d.education
ORDER BY revenue DESC;
