-- total earnings including commission
SET search_path TO scott, public;

SELECT ename, job, sal, COALESCE(comm, 0) AS comm,
       sal + COALESCE(comm, 0) AS total_earnings
FROM emp
ORDER BY total_earnings DESC;
