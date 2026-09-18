-- Past role changes with time spent in each (from job_history)
SET search_path TO hr, public;

SELECT jh.employee_id,
       e.first_name || ' ' || e.last_name AS employee,
       j.job_title AS previous_role,
       jh.start_date, jh.end_date,
       (jh.end_date - jh.start_date) AS days_in_role
FROM job_history jh
JOIN employees e ON e.employee_id = jh.employee_id
JOIN jobs j      ON j.job_id = jh.job_id
ORDER BY days_in_role DESC;
