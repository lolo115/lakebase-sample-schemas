-- Revenue by promotion type (includes the "no promotion" bucket)
SET search_path TO sh, public;

SELECT pr.promo_subcategory,
       COUNT(*)                     AS line_items,
       ROUND(SUM(s.amount_sold), 2) AS revenue
FROM sales s
JOIN promotions pr ON s.promo_id = pr.promo_id
GROUP BY pr.promo_subcategory
ORDER BY revenue DESC
LIMIT 15;
