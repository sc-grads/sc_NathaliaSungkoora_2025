--Exploring CTEs

WITH CTE_Employee AS			--Shown as a select statement within "WITH CTE_Employee AS	"
(SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender,
AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM [SQL tutorial]..EmployeeDemographics AS emp
JOIN [SQL tutorial]..EmployeeSalary AS sal
ON emp.EmployeeID = sal.EmployeeID
WHERE Salary> '45000'
)

--Putting it somewhere temporary where you can now grab it and query off of this data.
--Acts a lot like a subquery

--NB: NEED TO ADD SELECT STATEMENT ALWAYS DIRECTLY AFTER CTE
SELECT * --Can ask for specific columns (E.g. SELECT FirstName, AvgSalary)
FROM CTE_Employee;

-- CTE is not stored anywhere. Each time it is run, you need to run it with the entire CTE