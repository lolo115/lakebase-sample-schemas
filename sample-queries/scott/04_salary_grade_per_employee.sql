-- salary grade per employee
SET search_path TO scott, public;

SELECT e.ename, e.job, e.sal, g.grade
FROM emp e
JOIN salgrade g ON e.sal BETWEEN g.losal AND g.hisal
ORDER BY g.grade, e.sal DESC;
