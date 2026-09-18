-- Headcount by region and country
SET search_path TO hr, public;

SELECT r.region_name, c.country_name, COUNT(e.employee_id) AS headcount
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l   ON d.location_id = l.location_id
JOIN countries c   ON l.country_id = c.country_id
JOIN regions r     ON c.region_id = r.region_id
GROUP BY r.region_name, c.country_name
ORDER BY headcount DESC;
