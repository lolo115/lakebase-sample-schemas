-- headcount and payroll by job
SET search_path TO scott, public;

SELECT job, COUNT(*) AS employees,
       SUM(sal) AS total_sal, ROUND(AVG(sal), 2) AS avg_sal
FROM emp
GROUP BY job
ORDER BY total_sal DESC;
