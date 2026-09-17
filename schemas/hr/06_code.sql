-- HR - PL/SQL -> PL/pgSQL port of the JOB_HISTORY maintenance trigger.
-- Oracle's hr_code.sql also defines SECURE_DML (a business-hours DML guard) and a
-- statement trigger SECURE_EMPLOYEES; those are demo-only access controls and are
-- intentionally omitted here. The row trigger below mirrors UPDATE_JOB_HISTORY:
-- whenever an employee's job or department changes, the previous assignment is
-- archived into JOB_HISTORY.
SET search_path TO hr, public;

CREATE OR REPLACE FUNCTION update_job_history() RETURNS trigger
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO hr.job_history (employee_id, start_date, end_date, job_id, department_id)
    VALUES (OLD.employee_id, OLD.hire_date, CURRENT_DATE, OLD.job_id, OLD.department_id);
    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS update_job_history ON employees;
CREATE TRIGGER update_job_history
    BEFORE UPDATE OF job_id, department_id ON employees
    FOR EACH ROW EXECUTE FUNCTION update_job_history();
