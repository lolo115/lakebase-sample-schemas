-- HR - EMP_DETAILS_VIEW (Oracle WITH READ ONLY -> plain view; views are read-only in PostgreSQL).
SET search_path TO hr, public;

CREATE OR REPLACE VIEW emp_details_view AS
SELECT e.employee_id, e.job_id, e.manager_id, e.department_id,
       d.location_id, l.country_id, e.first_name, e.last_name,
       e.salary, e.commission_pct, d.department_name, j.job_title,
       l.city, l.state_province, c.country_name, r.region_name
FROM   employees e
JOIN   departments d ON e.department_id = d.department_id
JOIN   jobs j        ON j.job_id = e.job_id
JOIN   locations l   ON d.location_id = l.location_id
JOIN   countries c   ON l.country_id = c.country_id
JOIN   regions r     ON c.region_id = r.region_id;
