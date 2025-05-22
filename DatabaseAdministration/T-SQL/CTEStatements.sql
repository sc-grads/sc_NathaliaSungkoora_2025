/* CTE STATEMENT*/
USE [70-461(2)];

--SELF-JOIN

BEGIN TRAN

ALTER TABLE tblEmployee
ADD Manager INT -- ADD new column for manager
GO				--USE SAME DATA TYPE as EmployeeNumber

-- SET manager value based on EmployeeNumber
UPDATE tblEmployee
SET Manager = ((EmployeeNumber - 123) / 10) + 123
WHERE EmployeeNumber > 123

-- SHOW employees and their managers
SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName,
       M.EmployeeNumber AS ManagerNumber, 
       M.EmployeeFirstName AS ManagerFirstName, 
       M.EmployeeLastName AS ManagerLastName
FROM tblEmployee AS E
LEFT JOIN tblEmployee AS M --LINK IN SAME TABLE (use different alias)
ON E.Manager = M.EmployeeNumber

ROLLBACK TRAN


-------------------------------------------------------------------------------------------------------------------
--RECURSIVE CTE


BEGIN TRAN


ALTER TABLE tblEmployee
ADD Manager INT -- ADD Manager column
GO

-- UPDATE Manager values
UPDATE tblEmployee
SET Manager = ((EmployeeNumber - 123) / 10) + 123
WHERE EmployeeNumber > 123; --NEED SEMI-COLON

-- RECURSIVE CTE to get employee HIERARCHY
WITH myTable AS (
    -- ANCHOR: Top-level employees (no manager)
    SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName, 0 AS BossLevel
    FROM tblEmployee
    WHERE Manager IS NULL

    UNION ALL -- MUST BE UNION ALL

    -- RECURSIVE: Find employees under each manager
    SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName, myTable.BossLevel + 1 --LEVELS
    FROM tblEmployee AS E
    JOIN myTable ON E.Manager = myTable.EmployeeNumber
)

SELECT * FROM myTable

ROLLBACK TRAN
