-- PARTITION BY Clause

SELECT *
FROM [SQL tutorial]..EmployeeDemographics;

SELECT*
FROM [SQL tutorial]..EmployeeSalary;

--Join the two tables together using EmployeeID

SELECT *
FROM [SQL tutorial]..EmployeeDemographics AS emp
JOIN [SQL tutorial]..EmployeeSalary AS sal
ON emp.EmployeeID = sal.EmployeeID;


-- Identifying how many male and female employees you have in the comapny
SELECT FirstName, LastName, Gender, Salary, --Specifying column names
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender --Able to isolate just one column that you want to perfom aggregate function on
FROM [SQL tutorial]..EmployeeDemographics AS emp
JOIN [SQL tutorial]..EmployeeSalary AS sal
ON emp.EmployeeID = sal.EmployeeID;


--Transforming query into GROUP BY to see the difference
SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) 
FROM [SQL tutorial]..EmployeeDemographics AS emp
JOIN [SQL tutorial]..EmployeeSalary AS sal
ON emp.EmployeeID = sal.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary; --Have to use all columns mentioned in SELECT statement to Group by
-- Output is not what we're looking for (can't show total amounts)



--To achieve the same Output result as PARTITION BY Clause:
SELECT COUNT(Gender) 
FROM [SQL tutorial]..EmployeeDemographics AS emp
JOIN [SQL tutorial]..EmployeeSalary AS sal
ON emp.EmployeeID = sal.EmployeeID
GROUP BY Gender;			--PARTITION by is taking this query and sticking it on one line in the SELECT statement

