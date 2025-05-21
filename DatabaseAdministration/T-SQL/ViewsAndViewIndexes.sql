/*VIEWS AND INDEXES */


--CREATING VIEWS
  

-- Create view showing transactions by department and employee  
CREATE VIEW ViewByDepartment AS  
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount  
FROM tblDepartment AS D  
LEFT JOIN tblEmployee AS E  
ON D.Department = E.Department  
LEFT JOIN tblTransaction AS T  
ON E.EmployeeNumber = T.EmployeeNumber  
WHERE T.EmployeeNumber BETWEEN 120 AND 139  --Restrict user to specific rows
-- ORDER BY not allowed in views  
GO  --GO DEFINES THE END OF THE BATCH

-- Show all data from ViewByDepartment After creating VIEW
SELECT * FROM ViewByDepartment  

-- Create view summarizing total transaction amount by department and employee  
CREATE VIEW ViewSummary AS  
SELECT D.Department, T.EmployeeNumber AS EmpNum, SUM(T.Amount) AS TotalAmount  
FROM tblDepartment AS D  
LEFT JOIN tblEmployee AS E  
ON D.Department = E.Department  
LEFT JOIN tblTransaction AS T  
ON E.EmployeeNumber = T.EmployeeNumber  
GROUP BY D.Department, T.EmployeeNumber  
-- ORDER BY not allowed in views  
GO  

-- Show summary data from ViewSummary  after creating view
SELECT * FROM ViewSummary  

-----------------------------------------------------------------------------------------------------------------------------------------------
--ALTERING AND DROPPING VIEWS

-------------------------------------------------------------
--ALTERING VIEWS :

USE [70-461]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[ViewByDepartment] AS  
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount  
FROM tblDepartment AS D  
LEFT JOIN tblEmployee AS E  
ON D.Department = E.Department  
LEFT JOIN tblTransaction AS T  
ON E.EmployeeNumber = T.EmployeeNumber  
WHERE T.EmployeeNumber BETWEEN 120 AND 139  --Restrict user to specific rows
-- ORDER BY not allowed in views  
GO

--------------------------------------------------------------------------
--DROPPING VIEW

DROP VIEW [dbo].[ViewByDepartment]


--LOOKING AT THE VIEWS
SELECT * FROM sys.views

---- If the view named 'ViewByDepartment' exists, then delete it
IF EXISTS (SELECT * FROM sys.views WHERE NAME ='ViewByDepartment')
DROP VIEW [dbo].[ViewByDepartment]
GO
--------------------------------------------------------------------------
--OR YOU CAN SAY INSTEAD: (USe one or the other
-- If the view 'ViewByDepartment' exists in the 'dbo' schema, then delete it
IF EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.VIEWS
    WHERE [TABLE_NAME] = 'ViewByDepartment' AND [TABLE_SCHEMA] = 'dbo'
)
DROP VIEW [dbo].[ViewByDepartment]
GO
-----------------------------------------------------------------------------------
--Then CREATE the new VIEW
CREATE VIEW [dbo].[ViewByDepartment] AS  
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount  
FROM tblDepartment AS D  
LEFT JOIN tblEmployee AS E  
ON D.Department = E.Department  
LEFT JOIN tblTransaction AS T  
ON E.EmployeeNumber = T.EmployeeNumber  
WHERE T.EmployeeNumber BETWEEN 120 AND 139  --Restrict user to specific rows
-- ORDER BY not allowed in views  
GO


-----------------------------------------------------------------------------------------------------------------------------------------------
--SECURING VIEWS

SELECT V.NAME, S.TEXT FROM sys.syscomments AS S
INNER JOIN sys.views AS V
ON S.id = V.object_id

--Other examples of seeing view:
SELECT OBJECT_DEFINITION(object_id('dbo.ViewByDepartment'));

SELECT * FROM sys.sys_modules

----------
--ADDING ENCRYPTION TO VIEW:
IF EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.VIEWS
    WHERE [TABLE_NAME] = 'ViewByDepartment' AND [TABLE_SCHEMA] = 'dbo'
)
DROP VIEW [dbo].[ViewByDepartment]
GO
-----------------------------------------------------------------------------------
--Then CREATE the new VIEW
CREATE VIEW [dbo].[ViewByDepartment] WITH ENCRYPTION AS
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount  
FROM tblDepartment AS D  
LEFT JOIN tblEmployee AS E  
ON D.Department = E.Department  
LEFT JOIN tblTransaction AS T  
ON E.EmployeeNumber = T.EmployeeNumber  
WHERE T.EmployeeNumber BETWEEN 120 AND 139  --Restrict user to specific rows
-- ORDER BY not allowed in views  
GO

------------------------------------------------------------------------------------------------------------------------------------------------
--ADDING MORE ROWS TO VIEWS

--ADD to VIEW not TABLE:
-----------
BEGIN TRAN  

INSERT INTO ViewByDepartment(EmployeeNumber, DateOfTransaction, TotalAmount)  
VALUES (132, '2015-07-07', 999.99)  

-- Check inserted data through the VIEW  
SELECT * FROM ViewByDepartment  
ORDER BY Department, EmployeeNumber  

ROLLBACK TRAN  
-----------


-- Update a row in the VIEW (changes EmployeeNumber in TRANSACTIONS)
BEGIN TRAN  

--SELECT * FROM ViewByDepartment 
--ORDER BY EmployeeNumber, DateOfTransaction 

-- Change EmployeeNumber from 132 to 142  
UPDATE ViewByDepartment  
SET EmployeeNumber = 142  
WHERE EmployeeNumber = 132  --Output: Changed all 132 (5 rows) to 142

-- Check updated data through the VIEW  
SELECT * FROM ViewByDepartment  
ORDER BY EmployeeNumber, DateOfTransaction  

ROLLBACK TRAN  
-------------------------------------------------------
-- Drop the VIEW if it already exists  
USE [70-461]  
GO  

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS  
           WHERE TABLE_NAME = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo')  
    DROP VIEW dbo.ViewByDepartment  
GO  

-- Recreate the VIEW with CHECK OPTION to prevent invalid inserts/updates  
CREATE VIEW [dbo].[ViewByDepartment] AS  
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount  
FROM tblDepartment AS D  
LEFT JOIN tblEmployee AS E  
ON D.Department = E.Department  
LEFT JOIN tblTransaction AS T  
ON E.EmployeeNumber = T.EmployeeNumber  
WHERE T.EmployeeNumber BETWEEN 120 AND 139  
WITH CHECK OPTION			--ADD WITH CHECK OPTION
-- ORDER BY not allowed in views  
GO  

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--DELETING ROWS IN VIEWS

-- View existing data before deletion  
SELECT * FROM ViewByDepartment  

-- Delete a row from the VIEW (affects TRANSACTIONS table)  
DELETE FROM ViewByDepartment  
WHERE TotalAmount = 999.99 AND EmployeeNumber = 132  
GO  

-- Create a simple VIEW for the TRANSACTIONS table  
CREATE VIEW ViewSimple  
AS  
SELECT * FROM tblTransaction  
GO  

 -------------------------------
BEGIN TRAN  
-- Delete rows where EmployeeNumber = 132 through the VIEW  
DELETE FROM ViewSimple  
WHERE EmployeeNumber = 132  

SELECT * FROM ViewSimple  

ROLLBACK TRAN  
--------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CREATING AN INDEX VIEW
--WHAT IS ADDED:
CREATE UNIQUE CLUSTERED INDEX inx_ViewByDepartment 
ON dbo.ViewByDepartment (EmployeeNumber, Department)



--------------------------------
USE [70-461]  
GO  

-- Drop existing VIEW if it exists  
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS  
           WHERE TABLE_NAME = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo')  
    DROP VIEW dbo.ViewByDepartment  
GO  

-- Create a  VIEW (needed for indexed views) that includes reference to SCHEMA
CREATE VIEW [dbo].[ViewByDepartment] WITH SCHEMABINDING AS  
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotalAmount  
FROM dbo.tblDepartment AS D  
INNER JOIN dbo.tblEmployee AS E  
  ON D.Department = E.Department  
INNER JOIN dbo.tblTransaction AS T  
  ON E.EmployeeNumber = T.EmployeeNumber  
WHERE T.EmployeeNumber BETWEEN 120 AND 139  
GO  

-- Create UNIQUE CLUSTERED INDEX on the VIEW (required for indexed views)  
CREATE UNIQUE CLUSTERED INDEX inx_ViewByDepartment  
ON dbo.ViewByDepartment(EmployeeNumber, Department, DateOfTransaction)
			--Added DateOfTransaction to make it UNIQUE and it was SUCCESSFUL!

--Can't drop beacause it is being referenced in Index
BEGIN TRAN  
DROP TABLE tblEmployee  
ROLLBACK TRAN  




