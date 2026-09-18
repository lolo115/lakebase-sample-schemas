-- Commissioned employees and their estimated total compensation
SET search_path TO hr, public;

SELECT e.first_name || ' ' || e.last_name AS employee,
       d.department_name, e.salary, e.commission_pct,
       ROUND(e.salary * (1 + e.commission_pct), 2) AS est_total_comp
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE e.commission_pct IS NOT NULL
ORDER BY est_total_comp DESC;
