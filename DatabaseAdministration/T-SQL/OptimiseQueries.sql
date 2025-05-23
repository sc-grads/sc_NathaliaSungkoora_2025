/*OPTIMISE QUERIES*/


--DROP OTHER INDEXES EXCEPT idx_EmployeeNumber
--INCLUDE CLIENT STATISTICS
-- Scan entire table (no WHERE clause)
SELECT * 
FROM [dbo].[tblEmployee] AS E;  -- TABLE SCAN

-- Use index to find specific EmployeeNumber (faster)
SELECT * 
FROM [dbo].[tblEmployee] AS E
WHERE E.EmployeeNumber = 134;   -- INDEX SEEK


--Create a JOIN
SELECT * 
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblDepartment] AS D
ON E.Department =D.Department;

----------------------------------------------------------------------------------------------------
--SARG

-- SARG: USES INDEX, FAST
SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber = 134;

-- NO INDEX: SLOWER EVEN WITH SARG
SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployeeNoIndex] AS E
LEFT JOIN [dbo].[tblTransactionNoIndex] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber = 134;

-- NOT SARG: CAN'T USE INDEX, SLOW
SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber / 10 = 34;

-- SARG: RANGE QUERY, USES INDEX
SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 340 AND 349;


----------------------------------------------------------------------------------------------------
--ORDER SORTING

--INCLUDING AN ORDER BY TO SEE HOW MUCH LONGER IT TAKES:
-- NOT SARG: CAN'T USE INDEX, SLOW
SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber / 10 = 34
ORDER BY Amount;

-- SARG: RANGE QUERY, USES INDEX
SELECT E.EmployeeNumber, T.Amount
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 340 AND 349
ORDER BY Amount;



------------------------------------------------------------------------------------------------------
--MORE ADVANCED QUERY PLAN

SELECT EmployeeNumber, DateOfTransaction, Amount,
SUM(Amount) OVER(PARTITION BY EmployeeNumber ORDER BY DateOfTransaction) AS TotalAmount
FROM dbo.tblTransaction;

------------------------------------------------------------------------------------------------------
--PLAN GUIDES

-- COPY DATA TO NEW BIG TABLE
SELECT *
INTO dbo.tblTransactionBig
FROM [dbo].[tblTransaction];

-- INSERT LARGE AMOUNT OF DATA USING CROSS JOIN
INSERT INTO dbo.tblTransactionBig ([Amount], [DateOfTransaction], [EmployeeNumber])
SELECT T1.Amount, T2.DateOfTransaction, 1 AS EmployeeNumber
FROM [dbo].[tblTransaction] AS T1
CROSS JOIN (SELECT * FROM [dbo].[tblTransaction] WHERE EmployeeNumber < 200) AS T2;

-- CREATE NONCLUSTERED INDEX FOR FILTERING
CREATE NONCLUSTERED INDEX idx_tbltblTransactionBig ON dbo.tblTransactionBig(EmployeeNumber);

-- CREATE STORED PROC TO SELECT BASED ON EMPLOYEENUMBER
CREATE PROC procTransactionBig(@EmployeeNumber AS INT) WITH RECOMPILE
AS
SELECT *
FROM tblTransactionBig AS T
LEFT JOIN tblEmployee AS E
ON T.EmployeeNumber = E.EmployeeNumber
WHERE T.EmployeeNumber = @EmployeeNumber;

-- EXECUTE PROC WITH DIFFERENT PARAMETERS
EXEC procTransactionBig 1;
EXEC procTransactionBig 132;

------------------------------------------------------------------------------------------------------
--HINTS

-- USE NOLOCK TO AVOID LOCKS
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
FROM [dbo].[tblDepartment] AS D WITH (NOLOCK)
LEFT JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department
WHERE D.Department = 'HR';

-- USE REPEATABLEREAD TO PREVENT CHANGES DURING TRANSACTION
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
FROM [dbo].[tblDepartment] AS D WITH (REPEATABLEREAD)
LEFT JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department
WHERE D.Department = 'HR';


------------------------------------------------------------------------------------------------------
--STATISTICS IO

SET STATISTICS IO OFF --(KEEP OFF) --ON
GO


-- RUN SELECT QUERY
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
FROM [dbo].[tblDepartment] AS D WITH (NOLOCK)
LEFT JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department
WHERE D.Department = 'HR';

------------------------------------------------------------------------------------------------------
--SHOWPLAN_ALL

SET SHOWPLAN_ALL OFF --ON
GO

-- RUN SELECT QUERY
SELECT D.Department, D.DepartmentHead, E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName 
FROM [dbo].[tblDepartment] AS D WITH (NOLOCK)
LEFT JOIN [dbo].[tblEmployee] AS E
ON D.Department = E.Department
WHERE D.Department = 'HR';

------------------------------------------------------------------------------------------------------
--DYNAMIC VS PARAMITISED

-- DYNAMIC SQL - CONCAT STRING (RISKY, SQL INJECTION)
DECLARE @param VARCHAR(1000) = '127';
DECLARE @sql NVARCHAR(MAX) =
    N'
    SELECT *
    FROM [dbo].[tblTransaction] AS T
    WHERE T.EmployeeNumber = ' + @param;

EXECUTE (@sql);

-- DYNAMIC SQL WITH MALICIOUS INPUT EXAMPLE
DECLARE @parameter VARCHAR(1000) = '127' + CHAR(10) + 'SELECT * FROM dbo.tblTransaction';

DECLARE @sql NVARCHAR(MAX) =
    N'
    SELECT *
    FROM [dbo].[tblTransaction] AS T
    WHERE T.EmployeeNumber = ' + @parameter;

EXECUTE (@sql);

-- PARAMETERIZED QUERY - SAFE AND REUSABLE PLAN
DECLARE @param VARCHAR(1000) = '127';

EXECUTE sys.sp_executesql
    @statement = 
        N'
        SELECT *
        FROM [dbo].[tblTransaction] AS T
        WHERE T.EmployeeNumber = @EmployeeNumber;',
    @params = N'@EmployeeNumber VARCHAR(1000)',
    @EmployeeNumber = @param;