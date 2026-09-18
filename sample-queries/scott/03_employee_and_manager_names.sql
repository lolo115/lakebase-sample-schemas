-- employee and manager names
SET search_path TO scott, public;

SELECT e.ename AS employee, e.job,
       COALESCE(m.ename, '(top of org)') AS manager
FROM emp e
LEFT JOIN emp m ON e.mgr = m.empno
ORDER BY e.ename;
