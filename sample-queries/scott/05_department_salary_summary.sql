-- department salary summary
SET search_path TO scott, public;

SELECT d.dname,
       COUNT(e.empno)          AS employees,
       COALESCE(SUM(e.sal), 0) AS total_sal,
       ROUND(AVG(e.sal), 2)    AS avg_sal,
       MIN(e.sal)              AS min_sal,
       MAX(e.sal)              AS max_sal
FROM dept d
LEFT JOIN emp e ON e.deptno = d.deptno
GROUP BY d.dname
ORDER BY total_sal DESC;
