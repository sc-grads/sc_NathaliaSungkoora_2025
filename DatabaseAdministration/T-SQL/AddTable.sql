/* ADDING A SECOND TABLE */

USE [70-461];


--Creating new TRANSACTION TABLE

CREATE TABLE tblTransaction (
Amount SMALLMONEY  NOT NULL,
DateOfTransaction SMALLDATETIME NULL,
EmployeeNumber INT NOT NULL

);



----------------------------------------------------------------------------------------------
--IMPORTING DATA AND SHOWING TABLES GRAPHICALLY 

INSERT INTO tblTransaction
VALUES
(-964.05, '20150526', 658), 
(-105.23, '20150914', 987)

--CHECHKING TO SEE IF ROWS WERE ADDED
SELECT * FROM tblTransaction;

--DELETE ROWS that were ADDED (only CONTENT not the TABLE
TRUNCATE TABLE tblTransaction;


----------------------------------------------------------------------------------------------
--WRITING A JOIN QUERY


SELECT e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, SUM( t.Amount) AS SumOfAmount
FROM tblEmployee AS e
JOIN tblTransaction AS t
ON e.EmployeeNumber=t.EmployeeNumber
GROUP BY e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
ORDER BY e.EmployeeNumber;


--Checking to see where EmployeeNumber 1046 is:

SELECT *
FROM tblEmployee
WHERE EmployeeNumber=1046;


----------------------------------------------------------------------------------------------
--DIFFERENT TYPES OF JOINS

--USe LEFT JOIN to ensure EmployeeNumber 1046 appears in the joined table and is no longer missing.
SELECT e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, SUM( t.Amount) AS SumOfAmount
FROM tblEmployee AS e
LEFT JOIN tblTransaction AS t
ON e.EmployeeNumber=t.EmployeeNumber
GROUP BY e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
ORDER BY e.EmployeeNumber;

--Output 1046 appears but SumOfAmount is NULL (no transactions)


----------------------------------------------------------------------------------------------
--DIFFERENT TYPES OF JOINS
--CREATING a THIRD TABLE

SELECT Department, COUNT(*) AS NumberOfDepartment
FROM tblEmployee
GROUP BY Department;
-- Output:Litigation(222), Customer Relations(261), HR(272), Commercial (250)

--DERIVED TABLE (part of SELECT):
--Checks how mny Departments there are
SELECT Department
FROM (			--Always starts with FROM when executing 
SELECT Department, COUNT(*) AS NumberOfDepartment
FROM tblEmployee
GROUP BY Department) AS newTable; -- Output:(1)Litigation, (2)Customer Relations, (3)HR, (4)Commercial

--COUNTS how mny Departments there are
SELECT COUNT(Department) as NumberOfDepartments
FROM (			--Always starts with FROM when executing 
SELECT Department, COUNT(*) AS NumberOfDepartment
FROM tblEmployee
GROUP BY Department) AS newTable; -- Output:4


--ALTERNATIVE WAY of GETTING Departments that are DISTINCT from each other

SELECT DISTINCT Department --Simpler
FROM tblEmployee;

--Creating third table now using INTO to create a new table
SELECT DISTINCT Department, '' AS DepartmentHead
INTO tblDepartment
FROM tblEmployee;

--Checking to see if all information is there:
SELECT * 
FROM tblDepartment;

--COVERT data type of column into an NVARCHAR
SELECT DISTINCT Department, CONVERT(VARCHAR(20),N'') AS DepartmentHead
INTO tblDepartment
FROM tblEmployee;

DROP TABLE tblDepartment --first frop then execute convert

--OR just use ALTER:
ALTER TABLE tblDepartment
ALTER COLUMN DepartmentHead VARCHAR(30) NULL
----------------------------------------------------------------------------------------------
--JOINING THREE TABLES

-- Get total transaction amount grouped by DepartmentHead
SELECT  D.Department,  SUM(Amount) AS SumOfAmount
FROM tblDepartment AS D
LEFT JOIN tblEmployee AS E
ON D.Department = E.Department
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY D.Department;


-- Insert a department and head into tblDepartment
INSERT INTO tblDepartment(Department, DepartmentHead)
VALUES ('Accounts', 'James') --Output: Accounts=NULL

-- ORDER BY: Get total amount per department head
SELECT D.DepartmentHead, SUM(T.Amount) AS SumOfAmount
FROM tblDepartment AS D
LEFT JOIN tblEmployee AS E
ON D.Department = E.Department
LEFT JOIN tblTransaction T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY D.DepartmentHead
ORDER BY D.DepartmentHead;





