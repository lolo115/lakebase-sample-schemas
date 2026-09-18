-- Headcount and average salary by department
SET search_path TO hr, public;

SELECT d.department_name,
       COUNT(*)                 AS headcount,
       ROUND(AVG(e.salary), 2)  AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY headcount DESC, avg_salary DESC;
