-- organization hierarchy
SET search_path TO scott, public;

WITH RECURSIVE org AS (
    SELECT empno, ename, job, mgr, 1 AS level
    FROM emp WHERE mgr IS NULL
    UNION ALL
    SELECT e.empno, e.ename, e.job, e.mgr, o.level + 1
    FROM emp e JOIN org o ON e.mgr = o.empno
)
SELECT level, repeat('  ', level - 1) || ename AS employee, job
FROM org
ORDER BY level, ename;
