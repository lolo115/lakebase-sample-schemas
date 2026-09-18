-- employees with department and location
SET search_path TO scott, public;

SELECT e.empno, e.ename, e.job, d.dname, d.loc
FROM emp e
JOIN dept d ON e.deptno = d.deptno
ORDER BY d.dname, e.ename;
