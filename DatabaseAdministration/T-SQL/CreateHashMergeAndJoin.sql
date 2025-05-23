/*HASH MERGE AND JOIN TYPES*/

USE [70-461S7];


----------------------------------------------------------------------------------------------------
--(1) HASH

-- LEFT JOIN with HASH MATCH on Department column
SELECT * 
FROM [dbo].[tblDepartment] AS D
LEFT JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department;  -- HASH MATCH JOIN

-- Select specific columns with LEFT JOIN using HASH MATCH
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
FROM [dbo].[tblDepartment] AS D
LEFT JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department;  -- HASH MATCH JOIN

----------------------------------------------------------------------------------------------------
--(2) NESTED LOOP

-- NESTED LOOP likely due to filtered small result (HR department)
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
FROM [dbo].[tblDepartment] AS D
LEFT JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department
WHERE D.Department = 'HR';  -- NESTED LOOP JOIN

-- LEFT JOIN between Employee and Transaction (may use NESTED LOOP if small table/index exists)
SELECT * 
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber;  


-- SELECT only EmployeeNumber and Amount with LEFT JOIN,
SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber; 

----------------------------------------------------------------------------------------------------
--(3) MERGE JOIN
-- CREATE CLUSTERED INDEXES TO ENABLE MERGE JOIN
CREATE UNIQUE CLUSTERED INDEX [idx_tblEmployee] ON [dbo].[tblEmployee]([EmployeeNumber]);
GO

CREATE UNIQUE CLUSTERED INDEX [idx_tblTransaction] ON [dbo].[tblTransaction]
([EmployeeNumber], [DateOfTransaction], [Amount]);
GO

--DELETE DUPLICATE
DELETE FROM [dbo].[tblEmployee]
WHERE [EmployeeNumber] = 131 AND [DateOfBirth] = '1971-12-24'

-- MERGE JOIN POSSIBLE DUE TO INDEXES ON JOIN COLUMNS
SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber;

-- COPY TABLES WITHOUT INDEXES (USED FOR COMPARISON)
SELECT * INTO dbo.tblEmployeeNoIndex FROM dbo.tblEmployee;
SELECT * INTO dbo.tblTransactionNoIndex FROM dbo.tblTransaction;

-- MERGE JOIN EXPECTED HERE (INDEXED TABLES)
SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber;

-- LIKELY HASH JOIN HERE (NO INDEXES)
SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployeeNoIndex] AS E
LEFT JOIN [dbo].[tblTransactionNoIndex] AS T
ON E.EmployeeNumber = T.EmployeeNumber;


