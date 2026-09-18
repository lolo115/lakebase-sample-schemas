-- Salary distribution by job title
SET search_path TO hr, public;

SELECT j.job_title,
       COUNT(*)                AS employees,
       MIN(e.salary)           AS min_salary,
       ROUND(AVG(e.salary), 2) AS avg_salary,
       MAX(e.salary)           AS max_salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY avg_salary DESC;
