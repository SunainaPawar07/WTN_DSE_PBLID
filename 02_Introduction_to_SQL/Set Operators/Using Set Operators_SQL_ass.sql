/*Question 01.
Create a matrix query to display the job, the salary for that job based on department number, and the total salary for that job, for departments 10, 20, and 30, giving each column an appropriate heading.

Query:-
*/
SELECT JOB,
       SUM(DECODE(DEPTNO,10,SAL)) AS "Dept 10",
       SUM(DECODE(DEPTNO,20,SAL)) AS "Dept 20",
       SUM(DECODE(DEPTNO,30,SAL)) AS "Dept 30",
       SUM(SAL) AS "Total Salary"
FROM EMP
GROUP BY JOB;

/*Question 02.
Using set operator display the DEPTNO,SUM(SAL) for each dept, JOB,SUM(SAL) for each Job and Total Salary.

Query:-
*/
SELECT TO_CHAR(DEPTNO) AS CATEGORY,
       SUM(SAL) AS TOTAL_SALARY
FROM EMP
GROUP BY DEPTNO

UNION ALL

SELECT JOB,
       SUM(SAL)
FROM EMP
GROUP BY JOB

UNION ALL

SELECT 'TOTAL',
       SUM(SAL)
FROM EMP;

/*Question 04.
Using Set Operator display the JOB and Deptno in employees working in deptno 20,10,30 in that order.

Query:-
*/
SELECT JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 20

UNION ALL

SELECT JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 10

UNION ALL

SELECT JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 30;