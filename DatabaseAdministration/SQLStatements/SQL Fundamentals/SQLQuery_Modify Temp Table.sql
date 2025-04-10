USE [SQL tutorial]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 2025/02/27 10:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Temp_Employee]		--Adding parameter to stored procedure
@JobTitle NVARCHAR(100)		--INPUT			--Allows you to specify an input to get a specifc result
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
WHERE JobTitle = @JobTitle		--Helps during exec phase 
GROUP BY JobTitle;

SELECT *
FROM #temp_employee