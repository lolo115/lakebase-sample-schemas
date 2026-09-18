-- Employees paid outside their job's defined salary range
SET search_path TO hr, public;

SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee,
       j.job_title, e.salary, j.min_salary, j.max_salary,
       CASE WHEN e.salary < j.min_salary THEN 'below range'
            WHEN e.salary > j.max_salary THEN 'above range' END AS flag
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary < j.min_salary OR e.salary > j.max_salary
ORDER BY e.salary DESC;
