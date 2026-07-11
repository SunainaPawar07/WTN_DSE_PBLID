/*Question 01.
Find the highest, lowest, sum, and average salary of all employees. Label the columns

Query:-
*/
SELECT MAX(SAL) AS Maximum,
       MIN(SAL) AS Minimum,
       SUM(SAL) AS Sum,
       AVG(SAL) AS Average
FROM EMP;

/*Question 02.
Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.

Query:-
*/
SELECT ROUND(MAX(SAL)) AS Maximum,
       ROUND(MIN(SAL)) AS Minimum,
       ROUND(SUM(SAL)) AS Sum,
       ROUND(AVG(SAL)) AS Average
FROM EMP;

/*Question 03.
Modify the above query to display the minimum, maximum, sum, and average salary for each job type.

Query:-
*/
SELECT JOB,
       ROUND(MIN(SAL)) AS Minimum,
       ROUND(MAX(SAL)) AS Maximum,
       ROUND(SUM(SAL)) AS Sum,
       ROUND(AVG(SAL)) AS Average
FROM EMP
GROUP BY JOB;

/*Question 04.
Write a query to display the number of people with the same job

Query:-
*/
SELECT JOB,
       COUNT(*) AS Number_of_Employees
FROM EMP
GROUP BY JOB;

/*Question 05.
Determine the number of managers without listing them. Label the column Number of Managers

Query:-
*/
SELECT COUNT(DISTINCT MGR) AS "Number of Managers"
FROM EMP;

/*Question 06.
Find the difference between the highest and lowest salaries. Label the column DIFFERENCE.

Query:-
*/
SELECT MAX(SAL) - MIN(SAL) AS DIFFERENCE
FROM EMP;

/*Question 07.
Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $2000 or less. Sort the output in descending order of salary.

Query:-
*/
SELECT MGR,
       MIN(SAL) AS Lowest_Salary
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
HAVING MIN(SAL) > 2000
ORDER BY Lowest_Salary DESC;

/*Question 08.
Create a query to display the total number of employees and, of that total, the number of employees hired in 1980, 1981, and 1982. Create appropriate column headings.

Query:-
*/
SELECT COUNT(*) AS Total_Employees,
       SUM(CASE WHEN TO_CHAR(HIREDATE,'YYYY')='1980' THEN 1 ELSE 0 END) AS "Hired in 1980",
       SUM(CASE WHEN TO_CHAR(HIREDATE,'YYYY')='1981' THEN 1 ELSE 0 END) AS "Hired in 1981",
       SUM(CASE WHEN TO_CHAR(HIREDATE,'YYYY')='1982' THEN 1 ELSE 0 END) AS "Hired in 1982"
FROM EMP;
       