-- Profit and margin by product category (uses the profits view)
SET search_path TO sh, public;

SELECT p.prod_category,
       ROUND(SUM(pr.amount_sold), 2)                  AS revenue,
       ROUND(SUM(pr.total_cost), 2)                   AS cost,
       ROUND(SUM(pr.amount_sold - pr.total_cost), 2)  AS profit,
       ROUND(100.0 * SUM(pr.amount_sold - pr.total_cost)
             / NULLIF(SUM(pr.amount_sold), 0), 1)     AS margin_pct
FROM profits pr
JOIN products p ON pr.prod_id = p.prod_id
GROUP BY p.prod_category
ORDER BY profit DESC;
