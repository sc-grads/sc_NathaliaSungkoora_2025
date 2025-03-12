/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses and statements Using AdventureWorks2022 Database*/

--Functions

USE [AdventureWorks2022]
GO

-- Select the top 1000 rows from EmployeePayHistory table
SELECT TOP (1000) [BusinessEntityID]
      ,[RateChangeDate]
      ,[Rate]
      ,[PayFrequency]
      ,[ModifiedDate]
  FROM [AdventureWorks2022].[HumanResources].[EmployeePayHistory]

-- Get the maximum rate from EmployeePayHistory table
SELECT MAX(rate) 
FROM [AdventureWorks2022].[HumanResources].[EmployeePayHistory];

-- Get the minimum rate from EmployeePayHistory table
SELECT MIN(rate) 
FROM [AdventureWorks2022].[HumanResources].[EmployeePayHistory];

-- Get the count of rates from EmployeePayHistory table
SELECT COUNT(rate) 
FROM [AdventureWorks2022].[HumanResources].[EmployeePayHistory];

-- Get the count of rates from EmployeePayHistory table
SELECT SUM(rate) 
FROM [AdventureWorks2022].[HumanResources].[EmployeePayHistory];


-- Print the upper case of the given string
PRINT UPPER('dovnet');

-- Print the lower case of the given string
PRINT LOWER('doVVVnet');

-- Print the conversion of the float value to integer
PRINT CONVERT(int, 15.56);

-- Print the current date and time
PRINT GETDATE();

-- Print the day part of the current date
PRINT DAY(GETDATE());

-- Print the month part of the current date
PRINT MONTH(GETDATE());

-- Print the YEAR part of the current date
PRINT YEAR(GETDATE());



--Creating a table FunctionEmployee and Inserting Data
CREATE TABLE FunctionEmployee
(
	EmpID INT PRIMARY KEY,
	FirstName VARCHAR(50) NULL,
	LastName VARCHAR(50) NULL,
	Salary INT NULL,
	Address VARCHAR(100) NULL,
	)

-- Insert records into the FunctionEmployee table
INSERT INTO FunctionEmployee (EmpID, FirstName, LastName, Salary, Address) 
VALUES (1, 'Abbas', 'Mehmood', 20000, 'Delhi');

INSERT INTO FunctionEmployee (EmpID, FirstName, LastName, Salary, Address) 
VALUES (2, 'Imran', 'Afzal', 50000, 'Delhi');

INSERT INTO FunctionEmployee (EmpID, FirstName, LastName, Salary, Address) 
VALUES (3, 'James', 'Dino', 90000, 'Delhi');

INSERT INTO FunctionEmployee (EmpID, FirstName, LastName, Salary, Address) 
VALUES (4, 'Jaga', 'Babu', 70000, 'Delhi');


--Selecting FunctionEmployee table
SELECT *
FROM FunctionEmployee;

-- Create a Scalar-valued function that returns full name of the employee
CREATE FUNCTION fnGetEmpFullName 
(@FirstName VARCHAR(50), @LastName VARCHAR(50)) -- Adding parameters
RETURNS VARCHAR(101)
AS
BEGIN
    RETURN (SELECT @FirstName + ' ' + @LastName);
END
GO

-- Use the function to select employee's full name and salary from FunctionEmployee table
SELECT dbo.fnGetEmpFullName(firstname, lastname) AS Fullname, salary --Add first and second parameter
FROM FunctionEmployee; -- Have to write dbo, to call function

-- Concatenate first name and last name to form full name
SELECT firstname + ' ' + lastname AS Fullname, salary 
FROM FunctionEmployee;

-- Create a inlined table-valued function to return all records from FunctionEmployee
CREATE FUNCTION dbo.fnGetEmployee()
RETURNS TABLE
AS
RETURN (SELECT * FROM FunctionEmployee) --Selecting all data fron FrunctionEmployee table
GO

-- Select all records using the fnGetEmployee function
SELECT * FROM dbo.fnGetEmployee();


-- Create a multi-statement table-valued function that returns employee data after an update

CREATE FUNCTION dbo.fnGetMulEmployee()
RETURNS @Emp TABLE --Table variable
(
    Empid INT,
    FirstName VARCHAR(50),
    Salary INT
)
AS
BEGIN
    -- Insert data into the @Emp table variable from FunctionEmployee
    INSERT INTO @Emp 
    SELECT e.EmpID, e.FirstName, e.Salary 
    FROM FunctionEmployee AS e;
    
    -- Update salary of the first employee in the @Emp table
    UPDATE @Emp 
    SET Salary = 25000 
    WHERE EmpID = 1;
    
    -- Return the modified data from @Emp table (changes are not reflected in the original FunctionEmployee table)
    RETURN;
END
GO

-- Select all records from fnGetMulEmployee function
SELECT * FROM dbo.fnGetMulEmployee();