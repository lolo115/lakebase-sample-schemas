-- employees earning more than their manager
SET search_path TO scott, public;

SELECT e.ename AS employee, e.sal AS emp_sal,
       m.ename AS manager,  m.sal AS mgr_sal
FROM emp e
JOIN emp m ON e.mgr = m.empno
WHERE e.sal > m.sal
ORDER BY e.sal DESC;
