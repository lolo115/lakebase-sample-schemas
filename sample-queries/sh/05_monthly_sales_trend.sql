-- Monthly sales trend
SET search_path TO sh, public;

SELECT t.calendar_month_desc,
       ROUND(SUM(s.amount_sold), 2) AS revenue
FROM sales s
JOIN times t ON s.time_id = t.time_id
GROUP BY t.calendar_month_desc
ORDER BY t.calendar_month_desc;
