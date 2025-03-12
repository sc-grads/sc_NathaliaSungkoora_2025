/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses and statements Using AdventureWorks2022 Database*/

--Triggers
USE [AdventureWorks2022]
GO

-- Selecting the top 1000 records from the Employee table in the AdventureWorks2022 database.
SELECT TOP (1000) [EmpID]
      ,[EmpName]
      ,[EmpTitle]
  FROM [AdventureWorks2022].[dbo].[Employee]
--Used in video example:
  SELECT TOP (1000) [EmpName]
      ,[EmpTitle]
      ,[EmpID]
  FROM [AdventureWorks2022].[dbo].[Employee2]




-- Selecting all records from the newly created EmployeeTriggerHistory table to confirm it is empty.
SELECT * FROM dbo.EmployeeTriggerHistory


CREATE TRIGGER dbo.EmployeeInsert 
ON dbo.Employee2 
AFTER INSERT 
AS 
BEGIN
    SET NOCOUNT ON;
    -- Insert statements for trigger 
    INSERT INTO EmployeeTriggerHistory 
    VALUES ((SELECT TOP (1) EmpID FROM dbo.Employee2), 'Insert')
    -- The trigger is fired after an INSERT operation on the Employee table. It adds the inserted EmpID and 'Insert' into the EmployeeTriggerHistory table.
END

GO


-- Second Attempt and testing
CREATE TRIGGER dbo.EmployeeInsert2 
ON dbo.Employee2 
AFTER INSERT 
AS 
BEGIN
    SET NOCOUNT ON;
    -- Insert statements for trigger here
    INSERT INTO EmployeeTriggerHistory 
    VALUES ((SELECT MAX(EmpID) FROM dbo.Employee2), 'Insert')
    -- The trigger is fired after an INSERT operation on the Employee table. It adds the inserted EmpID and 'Insert' into the EmployeeTriggerHistory table.
END

GO

-- Insert the specified data into the Employee table
INSERT INTO [dbo].[Employee2] (EmpName, EmpTitle)
VALUES 
('Matthew', 'Area Manager'),
('Karen', 'Sales Manager')

INSERT INTO [dbo].[Employee2] (EmpName, EmpTitle)
VALUES 
('George', 'Se Sales Associate')

INSERT INTO [dbo].[Employee2] (EmpName, EmpTitle)
VALUES 
('Thabo', 'Area Manager')

-- Selecting all records from EmployeeTriggerHistory to view the log of the insert operation that triggered the action.
SELECT * FROM dbo.EmployeeTriggerHistory


SELECT * FROM Employee
-------------------------------------------------------------------------
--Step 1: Creating new table to practice trigger
CREATE TABLE [dbo].[Employee2] (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    EmpName NVARCHAR(100),
    EmpTitle NVARCHAR(100)
);
-- Step 2: Insert the specified data into the Employee table
INSERT INTO [dbo].[Employee2] (EmpName, EmpTitle)
VALUES 
('Dino', 'Sales Associate'),
('Dino', 'Sr Sales Associate'),
('James', 'Sales Manager');

SELECT * FROM [dbo].[Employee2]

------------------------------------------------------------------------

