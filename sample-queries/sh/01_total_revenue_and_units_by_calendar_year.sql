-- Total revenue and units by calendar year
SET search_path TO sh, public;

SELECT t.calendar_year,
       ROUND(SUM(s.amount_sold), 2) AS revenue,
       SUM(s.quantity_sold)         AS units
FROM sales s
JOIN times t ON s.time_id = t.time_id
GROUP BY t.calendar_year
ORDER BY t.calendar_year;
