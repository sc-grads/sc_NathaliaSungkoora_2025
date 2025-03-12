/* Subqueries (in the SELECT, FROM and WHERE Statements)*/


SELECT *
FROM EmployeeSalary;

--Subquery in SELECT
SELECT EmployeeID, 
		Salary,
		(SELECT AVG(SALARY) FROM EmployeeSalary) AS AllAvSalary
FROM EmployeeSalary;


-- How to do it with Partiion by
SELECT EmployeeID, 
		Salary,
		AVG(Salary) OVER() AS AllAvSalary
FROM EmployeeSalary;


-- Why GROUP BY doesn't work
SELECT EmployeeID, 
		Salary,
		AVG(Salary) AS AllAvSalary
FROM EmployeeSalary
GROUP BY EmployeeID, Salary
ORDER BY 1,2;
		--Can't get the All average salary (AllAvSalary) that we can get from the partition and subquery


-- Subquery in FROM

SELECT a.EmployeeID, AllAvSalary --Can select columns created by inner query or can select all columnc(*)
FROM (SELECT EmployeeID, 
			Salary,
			AVG(Salary) OVER() AS AllAvSalary
		FROM EmployeeSalary) AS a ;-- Creating a table to query off of it (Like a Temporary Table or CTE)


-- Subquery in WHERE

--Example: Only want to return employees over the age of 30
		-- Can Join with EmployeeDemographics Table OR Can use a subquery
SELECT EmployeeID, 
		JobTitle,
		Salary
FROM EmployeeSalary
WHERE EmployeeID IN (
					SELECT EmployeeID
					FROM EmployeeDemographics
					WHERE Age>30 )


