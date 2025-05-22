/* GENERATE LIST OF NUMBERS */
USE [70-461(2)];


--EXERCISE 1:
-- Employees with no transactions
SELECT E.EmployeeNumber 
FROM tblEmployee AS E 
LEFT JOIN tblTransaction AS T
  ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY E.EmployeeNumber;

-- Max EmployeeNumber in transactions
SELECT MAX(EmployeeNumber) FROM tblTransaction;

-- Numbers 1 to max EmployeeNumber, find missing ones
WITH Numbers AS ( --Makes data dynamic
    SELECT TOP (SELECT MAX(EmployeeNumber) FROM tblTransaction) 
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNumber
    FROM tblTransaction AS U
)
SELECT U.RowNumber 
FROM Numbers AS U
LEFT JOIN tblTransaction AS T
  ON U.RowNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL
ORDER BY U.RowNumber;

-- Generate many row numbers (example)
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) 
FROM sys.objects O 
CROSS JOIN sys.objects P;


----------------------------------------------------------------------------------------------
----EXERCISE 2:
--GROUPING NUMBERS

--Want to find put Employees who did not make a transaction in 2014

WITH Numbers AS (
    -- Generate numbers from 1 to max EmployeeNumber in tblTransaction
    SELECT TOP (SELECT MAX(EmployeeNumber) FROM tblTransaction) 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNumber
    FROM tblTransaction AS U
),
Transactions2014 AS (
    -- Transactions in year 2014 only
    SELECT * FROM tblTransaction 
    WHERE DateOfTransaction >= '2014-01-01' 
      AND DateOfTransaction < '2015-01-01'--not inclusive
),
tblGap AS (
    -- Find GAPS where EmployeeNumbers are missing in 2014 transactions
    SELECT U.RowNumber,
           RowNumber - LAG(RowNumber) OVER (ORDER BY RowNumber) AS PreviousRowNumber,
           LEAD(RowNumber) OVER (ORDER BY RowNumber) - RowNumber AS NextRowNumber,
           CASE WHEN RowNumber - LAG(RowNumber) OVER (ORDER BY RowNumber) = 1 THEN 0 ELSE 1 END AS GroupGap
    FROM Numbers AS U
    LEFT JOIN Transactions2014 AS T ON U.RowNumber = T.EmployeeNumber
    WHERE T.EmployeeNumber IS NULL
),
tblGroup AS (
    -- Group consecutive missing EmployeeNumbers together
	--Make use of GAPS
    SELECT *, SUM(GroupGap) OVER (ORDER BY RowNumber) AS TheGroup
    FROM tblGap
)
-- Show start, end, and count of each gap group
SELECT MIN(RowNumber) AS StartingEmployeeNumber,
       MAX(RowNumber) AS EndingEmployeeNumber,
       MAX(RowNumber) - MIN(RowNumber) + 1 AS NumberEmployees --No. of Employees in Group
FROM tblGroup
GROUP BY TheGroup
ORDER BY TheGroup;
