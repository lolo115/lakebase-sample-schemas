-- hires per year
SET search_path TO scott, public;

SELECT EXTRACT(YEAR FROM hiredate)::int AS hire_year, COUNT(*) AS hires
FROM emp
GROUP BY hire_year
ORDER BY hire_year;
