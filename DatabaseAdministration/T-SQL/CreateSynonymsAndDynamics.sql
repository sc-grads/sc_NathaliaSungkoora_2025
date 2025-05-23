/*SYNONYMS AND DYNAMICS*/
USE [70-461(2)];

--SYNONYMS

-- CREATE SYNONYM for tblEmployee
CREATE SYNONYM EmployeeTable
FOR tblEmployee
GO

-- SELECT from SYNONYM EmployeeTable
SELECT * FROM EmployeeTable

-- CREATE SYNONYM for tblDate
CREATE SYNONYM DateTable
FOR tblDate
GO

-- SELECT from SYNONYM DateTable
SELECT * FROM DateTable

-- CREATE SYNONYM for remote table
CREATE SYNONYM RemoteTable
FOR OVERTHERE.70-461remote.dbo.tblRemote
GO

-- SELECT from remote SYNONYM
SELECT * FROM RemoteTable


------------------------------------------------------------------------------------------------------------
--DYNAMIC SQL

-- Simple SELECT Query:
SELECT * FROM tblEmployee WHERE EmployeeNumber = 129;
GO

-- Declare command string and execute it
DECLARE @command AS VARCHAR(255);
SET @command = 'SELECT * FROM tblEmployee WHERE EmployeeNumber = 129;';
SET @command = 'SELECT * FROM tblTransaction';
EXECUTE (@command);
GO

-- DYNAMIC SQL with concatenation (Risk of SQL injection)
DECLARE @command AS VARCHAR(255), @param AS VARCHAR(50);
SET @command = 'SELECT * FROM tblEmployee WHERE EmployeeNumber = ';
SET @param = '129';
EXECUTE (@command + @param); -- SQL injection risk here
GO  --DO NOT DO THIS!

-- SAFER DYNAMIC SQL with sp_executesql and parameters
DECLARE @command AS NVARCHAR(255), @param AS NVARCHAR(50);
SET @command = N'SELECT * FROM tblEmployee WHERE EmployeeNumber = @ProductID';
SET @param = N'129'; --Have to be NVARCHAR
EXECUTE sys.sp_executesql @statement = @command, @params = N'@ProductID INT', @ProductID = @param;
