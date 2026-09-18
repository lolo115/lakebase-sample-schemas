-- HR sample queries
-- Run against a database that has the `hr` schema loaded:
--   psql -f queries.sql
SET search_path TO hr, public;

-- 1. Headcount and average salary by department
SELECT d.department_name,
       COUNT(*)                 AS headcount,
       ROUND(AVG(e.salary), 2)  AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY headcount DESC, avg_salary DESC;

-- 2. Top 10 highest-paid employees, with job title and department
SELECT e.first_name || ' ' || e.last_name AS employee,
       j.job_title, d.department_name, e.salary
FROM employees e
JOIN jobs j            ON e.job_id = j.job_id
LEFT JOIN departments d ON e.department_id = d.department_id
ORDER BY e.salary DESC
LIMIT 10;

-- 3. Employees paid outside their job's defined salary range
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS employee,
       j.job_title, e.salary, j.min_salary, j.max_salary,
       CASE WHEN e.salary < j.min_salary THEN 'below range'
            WHEN e.salary > j.max_salary THEN 'above range' END AS flag
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
WHERE e.salary < j.min_salary OR e.salary > j.max_salary
ORDER BY e.salary DESC;

-- 4. Organization hierarchy, top-down (recursive CTE)
WITH RECURSIVE org AS (
    SELECT employee_id, first_name, last_name, manager_id, 1 AS level
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.first_name, e.last_name, e.manager_id, o.level + 1
    FROM employees e
    JOIN org o ON e.manager_id = o.employee_id
)
SELECT level,
       repeat('  ', level - 1) || first_name || ' ' || last_name AS employee
FROM org
ORDER BY level, employee_id;

-- 5. Managers ranked by number of direct reports
SELECT m.employee_id,
       m.first_name || ' ' || m.last_name AS manager,
       COUNT(e.employee_id)               AS direct_reports
FROM employees m
JOIN employees e ON e.manager_id = m.employee_id
GROUP BY m.employee_id, manager
ORDER BY direct_reports DESC
LIMIT 10;

-- 6. Commissioned employees and their estimated total compensation
SELECT e.first_name || ' ' || e.last_name AS employee,
       d.department_name, e.salary, e.commission_pct,
       ROUND(e.salary * (1 + e.commission_pct), 2) AS est_total_comp
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE e.commission_pct IS NOT NULL
ORDER BY est_total_comp DESC;

-- 7. Headcount by region and country
SELECT r.region_name, c.country_name, COUNT(e.employee_id) AS headcount
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l   ON d.location_id = l.location_id
JOIN countries c   ON l.country_id = c.country_id
JOIN regions r     ON c.region_id = r.region_id
GROUP BY r.region_name, c.country_name
ORDER BY headcount DESC;

-- 8. Hiring trend by year
SELECT EXTRACT(YEAR FROM hire_date)::int AS hire_year, COUNT(*) AS hires
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

-- 9. Past role changes with time spent in each (from job_history)
SELECT jh.employee_id,
       e.first_name || ' ' || e.last_name AS employee,
       j.job_title AS previous_role,
       jh.start_date, jh.end_date,
       (jh.end_date - jh.start_date) AS days_in_role
FROM job_history jh
JOIN employees e ON e.employee_id = jh.employee_id
JOIN jobs j      ON j.job_id = jh.job_id
ORDER BY days_in_role DESC;

-- 10. Salary distribution by job title
SELECT j.job_title,
       COUNT(*)                AS employees,
       MIN(e.salary)           AS min_salary,
       ROUND(AVG(e.salary), 2) AS avg_salary,
       MAX(e.salary)           AS max_salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY avg_salary DESC;
