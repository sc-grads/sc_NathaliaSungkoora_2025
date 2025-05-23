/*EVALUATE OPERATIONS*/


--HOW TO WRITE A CURSOR

-- CURSOR EXAMPLE: USED TO LOOP THROUGH EMPLOYEES
DECLARE @EmployeeID INT --(1)

DECLARE csr CURSOR FOR 
SELECT EmployeeNumber
FROM [dbo].[tblEmployee]
WHERE EmployeeNumber BETWEEN 120 AND 299

OPEN csr --(2)
FETCH NEXT FROM csr INTO @EmployeeID --(3)

WHILE @@FETCH_STATUS = 0 --WHILE LOOP
BEGIN
    -- RUN A QUERY FOR EACH EMPLOYEE
    SELECT * 
    FROM [dbo].[tblTransaction] 
    WHERE EmployeeNumber = @EmployeeID

    FETCH NEXT FROM csr INTO @EmployeeID
END

CLOSE csr --(4)
DEALLOCATE csr


-----------------------------------------------------------------------------
--ALTERNATIVES

--USE A JOIN (QUICKER)
-- SHOW TRANSACTIONS FOR EMPLOYEES BETWEEN 120 AND 299
SELECT T.*
FROM tblTransaction AS T
RIGHT JOIN tblEmployee AS E
    ON T.EmployeeNumber = E.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 120 AND 299 
  AND T.EmployeeNumber IS NOT NULL

-----------------------------------------------------------------------------
--IMPACT OF SCALAR UDFS

-- Enable statistics to see time and IO info
SET STATISTICS TIME ON;
GO

-- Create scalar UDF: sums Amount per EmployeeNumber (slow)
CREATE OR ALTER FUNCTION dbo.fnc_TransactionTotal (@intEmployee INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @TotalAmount MONEY;
    SELECT @TotalAmount = SUM(Amount)
    FROM dbo.tblTransaction
    WHERE EmployeeNumber = @intEmployee;
    RETURN @TotalAmount;
END;
GO

-- Query using scalar UDF (slow)
SELECT
    E.EmployeeNumber,
    dbo.fnc_TransactionTotal(E.EmployeeNumber) AS TotalAmount
FROM dbo.tblEmployee AS E;
GO

-- Query using set-based JOIN (fast)
SELECT
    E.EmployeeNumber,
    SUM(T.Amount) AS TotalAmount
FROM dbo.tblEmployee AS E
LEFT JOIN dbo.tblTransaction AS T
    ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber;
GO

-- Create table-valued function returning amounts per EmployeeNumber
CREATE OR ALTER FUNCTION dbo.fnc_TransactionAll (@intEmployee INT)
RETURNS @returntable TABLE (Amount SMALLMONEY)
AS
BEGIN
    INSERT INTO @returntable
    SELECT Amount
    FROM dbo.tblTransaction
    WHERE EmployeeNumber = @intEmployee;
    RETURN;
END;
GO

-- Query using OUTER APPLY with table-valued function
SELECT
    E.EmployeeNumber,
    SUM(T.Amount) AS TotalAmount
FROM dbo.tblEmployee AS E
OUTER APPLY dbo.fnc_TransactionAll(E.EmployeeNumber) AS T
GROUP BY E.EmployeeNumber;
GO

-- Turn off statistics
SET STATISTICS TIME OFF;
GO
