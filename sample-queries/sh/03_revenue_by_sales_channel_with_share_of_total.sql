-- Revenue by sales channel, with share of total
SET search_path TO sh, public;

SELECT c.channel_desc,
       ROUND(SUM(s.amount_sold), 2) AS revenue,
       ROUND(100.0 * SUM(s.amount_sold) / SUM(SUM(s.amount_sold)) OVER (), 1) AS pct_of_total
FROM sales s
JOIN channels c ON s.channel_id = c.channel_id
GROUP BY c.channel_desc
ORDER BY revenue DESC;
