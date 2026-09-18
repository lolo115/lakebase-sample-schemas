-- Managers ranked by number of direct reports
SET search_path TO hr, public;

SELECT m.employee_id,
       m.first_name || ' ' || m.last_name AS manager,
       COUNT(e.employee_id)               AS direct_reports
FROM employees m
JOIN employees e ON e.manager_id = m.employee_id
GROUP BY m.employee_id, manager
ORDER BY direct_reports DESC
LIMIT 10;
