/* Stored Procedures */

--CREATE a Tempt Table and using it in a stored procedure

CREATE PROCEDURE TEST
AS
SELECT *			-- Adding Select statement to stored procedure
FROM EmployeeDemographics;


EXEC TEST; --EXEC means Execute (Here we are executing the stored procedure)
			--Select Statement is shown in the Output


-- Creating a STORED PROCEDURE using a temp table.
CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #temp_employee (
JobTitle VARCHAR(100),
EmployeePerJob INT,
AvgAge INT,
AvgSalary INT
);

INSERT INTO #temp_employee
SELECT  JobTitle,
		COUNT(JobTitle),
		AVG(Age),
		AVG(Salary)
FROM  [SQL tutorial]..EmployeeDemographics AS emp
JOIN [SQL tutorial]..EmployeeSalary AS sal
ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle;


SELECT *		--Data will be inserted but need to write select statement to return data
FROM #temp_employee;

--EXECUTING STORED PROCEDURE (showing output)
EXEC Temp_Employee;

--EXECUTING STORED PROCEDURE (adding parameter)
EXEC Temp_Employee @JobTitle  = 'Salesman';