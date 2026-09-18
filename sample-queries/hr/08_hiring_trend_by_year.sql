-- Hiring trend by year
SET search_path TO hr, public;

SELECT EXTRACT(YEAR FROM hire_date)::int AS hire_year, COUNT(*) AS hires
FROM employees
GROUP BY hire_year
ORDER BY hire_year;
