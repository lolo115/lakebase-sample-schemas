-- Organization hierarchy, top-down (recursive CTE)
SET search_path TO hr, public;

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
