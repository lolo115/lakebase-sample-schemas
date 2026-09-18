-- Top 10 highest-paid employees, with job title and department
SET search_path TO hr, public;

SELECT e.first_name || ' ' || e.last_name AS employee,
       j.job_title, d.department_name, e.salary
FROM employees e
JOIN jobs j            ON e.job_id = j.job_id
LEFT JOIN departments d ON e.department_id = d.department_id
ORDER BY e.salary DESC
LIMIT 10;
