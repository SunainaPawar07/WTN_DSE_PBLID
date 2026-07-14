/*Question 01.
Write a query for the HR department to produce the addresses of all the departments. Use the EMP and DEPT tables. Show the EMPNO, ENAME,SAL, DNAME and LOC in the output. Use a NATURAL JOIN to produce the results.

Query:-
*/
SELECT EMPNO, ENAME, SAL, DNAME, LOC
FROM EMP
NATURAL JOIN DEPT;

/*Question 02.
The HR department needs a report of all employees. Write a query to display the JOB,MGR,SAL,COMM,DNAME of employees whose JOB is SALESMAN.

Query:-
*/
SELECT E.JOB,
       E.MGR,
       E.SAL,
       E.COMM,
       D.DNAME
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'SALESMAN';

/*Question 03.
The HR department needs a report of employees in LOC DALLAS. Display the ENAME, job, DEPTNO, and DNAME for all employees who work in DALLAS.

Query:-
*/
SELECT E.ENAME,
       E.JOB,
       E.DEPTNO,
       D.DNAME
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = 'DALLAS';

/*Question 04.
Create a report to display employees’ ename and employee number along with their manager’s name and manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.

Query:-
*/
SELECT E.ENAME AS "Employee",
       E.EMPNO AS "Emp#",
       M.ENAME AS "Manager",
       M.EMPNO AS "Mgr#"
FROM EMP E
JOIN EMP M
ON E.MGR = M.EMPNO;

/*Question 05.
Modify the previous Query to display all employees including King, who has no manager. Order the results by the employee number.

Query:-
*/
SELECT E.ENAME AS "Employee",
       E.EMPNO AS "Emp#",
       M.ENAME AS "Manager",
       M.EMPNO AS "Mgr#"
FROM EMP E
LEFT OUTER JOIN EMP M
ON E.MGR = M.EMPNO
ORDER BY E.EMPNO;

/*Question 06.
The HR department needs a report on job grades and salaries. To familiarize yourself with the SALGRADE table, first show the structure of the SALGRADE table. Then create a query that displays the name, job, department name, salary, and grade for all employees

Query:-
*/
SELECT E.ENAME,
       E.JOB,
       D.DNAME,
       E.SAL,
       S.GRADE
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

/*Question 07.
Display the ENAME,DNAME of all the employees. Also display those department name which do not have any employees working.

Query:-
*/
SELECT E.ENAME,
       D.DNAME
FROM EMP E
RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

/*Question 08.
The HR department needs to find the names and hire dates for all employees who were hired before their managers, along with their managers’ names and hire dates.

Query:-
*/
SELECT E.ENAME,
       E.HIREDATE,
       M.ENAME,
       M.HIREDATE
FROM EMP E
JOIN EMP M
ON E.MGR = M.EMPNO
WHERE E.HIREDATE < M.HIREDATE;

/*Question 09.
Display the EMPNO,ENAME,DNAME,LOC of those employees who are working as CLERK. Use the USING clause.

Query:-
*/
SELECT EMPNO,
       ENAME,
       DNAME,
       LOC
FROM EMP
JOIN DEPT
USING (DEPTNO)
WHERE JOB = 'CLERK';

/*Question 10.
Display the ENAME,SAL,MGR,DNAME of employees whose salary is more than 2000. Use the ON clause.

Query:-
*/
SELECT E.ENAME,
       E.SAL,
       E.MGR,
       D.DNAME
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.SAL > 2000;

/*Question 11.
Display the EMPNO,ENAME,JOB,DEPTNO,DNAME,LOC of employees. Use LEFT OUTER JOIN.

Query:-
*/
SELECT E.EMPNO,
       E.ENAME,
       E.JOB,
       D.DEPTNO,
       D.DNAME,
       D.LOC
FROM EMP E
LEFT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

/*Question 12.
Display the ENAME,DNAME of employees. Use RIGHT OUTER JOIN.

Query:-
*/
SELECT E.ENAME,
       D.DNAME
FROM EMP E
RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

/*Question 13.
Display the EMPNO,DNAME,LOC of employees. Use FULL OUTER JOIN.

Query:-
*/
SELECT E.EMPNO,
       D.DNAME,
       D.LOC
FROM EMP E
FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
 
