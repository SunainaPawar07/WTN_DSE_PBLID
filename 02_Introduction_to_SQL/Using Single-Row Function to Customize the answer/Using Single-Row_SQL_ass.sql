/*Question 01.
Write a query to display the current date. Label the column Date.

Query:-
*/
SELECT SYSDATE AS "Date"
FROM DUAL;

/*Question 02.
The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary.

Query:-
*/
SELECT EMPNO,
       ENAME,
       SAL,
       ROUND(SAL * 1.155) AS "New Salary"
FROM EMP;

/*Question 03.
Modify the previous query to add a column alias that subtracts the old salary from the new salary. Label the column Increase.

Query:-
*/
SELECT EMPNO,
       ENAME,
       SAL,
       ROUND(SAL * 1.155) AS "New Salary",
       ROUND(SAL * 1.155) - SAL AS "Increase"
FROM EMP;

/*Question 04.
Write a query that displays the ename (with the first letter uppercase and all other letters lowercase) and the length of the ename for all employees whose name starts with the letters J, A, or M. Give each column an appropriate label. Sort the results by the employees’ enames.

Query:-
*/
SELECT INITCAP(ENAME) AS "Employee Name",
       LENGTH(ENAME) AS "Length"
FROM EMP
WHERE ENAME LIKE 'J%'
   OR ENAME LIKE 'A%'
   OR ENAME LIKE 'M%'
ORDER BY ENAME;

/*Question 05.
Rewrite the query so that the user is prompted to enter a letter that starts the last name. For example, if the user enters H when prompted for a letter, then the output should show all employees whose last name starts with the letter H.

Query:-
*/
SELECT INITCAP(ENAME) AS "Employee Name",
       LENGTH(ENAME) AS "Length"
FROM EMP
WHERE ENAME LIKE 'A%'
ORDER BY ENAME;

/*Question 06.
The HR department wants to find the length of employment for each employee. For each employee, display the ename and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order the results by the number of months employed. Round the number of months up to the closest whole number.

Query:-
*/
SELECT ENAME,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS_WORKED
FROM EMP
ORDER BY MONTHS_WORKED;

/*Question 07.
Create a report that produces the following for each employee: earns monthly but wants <3 times salary>. Label the column Dream Salaries.

Query:-
*/

SELECT ENAME || ' earns monthly but wants ' ||
       TO_CHAR(SAL * 3) AS "Dream Salaries"
FROM EMP;

/*Question 08.
Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with the $ symbol. Label the column SALARY.

Query:-
*/
SELECT ENAME,
       LPAD(SAL, 15, '$') AS "SALARY"
FROM EMP;

/*Question 09.
Display each employee’s last name, hire date, and salary review date, which is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in the format similar to “Monday, the Thirty-First of July, 2000.”

Query:-
*/
SELECT ENAME,
       HIREDATE,
       TO_CHAR(
           NEXT_DAY(ADD_MONTHS(HIREDATE,6),'MONDAY'),
           'Day, "the" DD "of" Month, YYYY'
       ) AS REVIEW
FROM EMP;

/*Question 10.
Display the last name, hire date, and day of the week on which the employee started. Label the column DAY. Order the results by the day of the week, starting with Monday.

Query:-
*/
SELECT ENAME,
       HIREDATE,
       TO_CHAR(HIREDATE,'DAY') AS DAY
FROM EMP
ORDER BY TO_CHAR(HIREDATE,'D');

/*Question 11.
Create a query that displays the employees’ last names and commission amounts. If an employee does not earn commission, show “No Commission.” Label the column COMM.
   
Query:-
*/
SELECT ENAME,
       NVL(TO_CHAR(COMM),'No Commission') AS COMM
FROM EMP;

/*Question 12.
Create a query that displays the first eight characters of the employees’ last names and indicates the amounts of their salaries with asterisks. Each asterisk signifies a thousand dollars. Sort the data in descending order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES.

Query:-
*/
SELECT SUBSTR(ENAME,1,8) || ' ' ||
       RPAD('*', ROUND(SAL/1000), '*')
       AS EMPLOYEES_AND_THEIR_SALARIES
FROM EMP
ORDER BY SAL DESC;

/*Question 13.
Using the DECODE function, write a query that displays the grade of all employees based on the value of the column JOB_ID, using the following data: PRESIDENT-A,MANAGER-B,SALESMAN-C,CLERK-D

Query:-
*/
SELECT ENAME,
       JOB,
       DECODE(JOB,
              'PRESIDENT','A',
              'MANAGER','B',
              'SALESMAN','C',
              'CLERK','D',
              'Not Assigned') AS GRADE
FROM EMP;

/*Question 14.
Rewrite the statement in the preceding exercise using the CASE syntax.

Query:-
*/
SELECT ENAME,
       JOB,
       CASE
           WHEN JOB='PRESIDENT' THEN 'A'
           WHEN JOB='MANAGER' THEN 'B'
           WHEN JOB='SALESMAN' THEN 'C'
           WHEN JOB='CLERK' THEN 'D'
           ELSE 'Not Assigned'
       END AS GRADE
FROM EMP;