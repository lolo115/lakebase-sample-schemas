-- employees above their department average salary
SET search_path TO scott, public;

WITH ranked AS (
    SELECT ename, deptno, sal,
           AVG(sal) OVER (PARTITION BY deptno) AS dept_avg
    FROM emp
)
SELECT ename, deptno, sal, ROUND(dept_avg, 2) AS dept_avg
FROM ranked
WHERE sal > dept_avg
ORDER BY deptno, sal DESC;
