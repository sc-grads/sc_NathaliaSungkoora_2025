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



----------------------------------------------------------------------------------------------
--MISSING DATA

--ALL rows that do not have acorresponding transaction (=NULL)
-- Select employees with no transactions and sum of amounts (will be NULL)
SELECT E.EmployeeNumber AS ENumber, E.EmployeeFirstName,
       E.EmployeeLastName, T.EmployeeNumber AS TNumber, 
       SUM(T.Amount) AS TotalAmount
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL  -- Employees with no matching transactions
GROUP BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,
         E.EmployeeLastName
ORDER BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,
         E.EmployeeLastName;

--DERIVED TABLE: Wom't work because you can't use an ORDER BY
SELECT *
FROM (
SELECT E.EmployeeNumber AS ENumber, E.EmployeeFirstName,
       E.EmployeeLastName, T.EmployeeNumber AS TNumber, 
       SUM(T.Amount) AS TotalAmount
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber IS NULL  -- Employees with no matching transactions
GROUP BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,
         E.EmployeeLastName
ORDER BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,
         E.EmployeeLastName) AS newTable; --Output: ERROR
--LEFT JOIN: 
--Solution change ORDER BY to outside of () and change names:
SELECT *
FROM (
SELECT E.EmployeeNumber AS ENumber, E.EmployeeFirstName,
       E.EmployeeLastName, T.EmployeeNumber AS TNumber, 
       SUM(T.Amount) AS TotalAmount
FROM tblEmployee AS E
LEFT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
GROUP BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,
         E.EmployeeLastName) AS newTable
WHERE TNumber IS NULL  -- Employees with no matching transactions (outside of query)
ORDER BY ENumber, TNumber, EmployeeFirstName,
         EmployeeLastName; --Output: 7 rows All employees who have no transactions

-- RIGHT JOIN to find transactions without matching employees
SELECT *
FROM (
    SELECT E.EmployeeNumber AS ENumber, E.EmployeeFirstName,
           E.EmployeeLastName, T.EmployeeNumber AS TNumber, 
           SUM(T.Amount) AS TotalAmount
    FROM tblEmployee AS E
    RIGHT JOIN tblTransaction AS T
    ON E.EmployeeNumber = T.EmployeeNumber
    GROUP BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,
             E.EmployeeLastName
) AS newTable
WHERE ENumber IS NULL  -- Transactions with no matching employee
ORDER BY ENumber, TNumber, EmployeeFirstName,
         EmployeeLastName;

----------------------------------------------------------------------------------------------
--DELETING DATA

SELECT COUNT(*)
FROM tblTransaction;

--USING DELETE COMMAND:

BEGIN TRANSACTION

SELECT COUNT(*)
FROM tblTransaction

DELETE tblTransaction
FROM tblEmployee AS E
RIGHT JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber IS NULL --Transaction with no matching employee

SELECT COUNT(*)
FROM tblTransaction

ROLLBACK TRANSACTION 

--Building  DELETE Statement USING IN CLAUSE:
BEGIN TRANSACTION
SELECT COUNT(*)
FROM tblTransaction

DELETE tblTransaction
FROM tblTransaction
WHERE EmployeeNumber IN(
SELECT TNumber
FROM (
    SELECT E.EmployeeNumber AS ENumber, E.EmployeeFirstName,
           E.EmployeeLastName, T.EmployeeNumber AS TNumber, 
           SUM(T.Amount) AS TotalAmount
    FROM tblEmployee AS E
    RIGHT JOIN tblTransaction AS T
    ON E.EmployeeNumber = T.EmployeeNumber
    GROUP BY E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName,
             E.EmployeeLastName
) AS newTable
WHERE ENumber IS NULL  -- Transactions with no matching employee
);

SELECT COUNT(*)
FROM tblTransaction
ROLLBACK TRAN 

----------------------------------------------------------------------------------------------
--UPDATING DATA
 
SELECT * FROM tblEmployee WHERE EmployeeNumber = 194 --employee 194 details
SELECT * FROM tblTransaction WHERE EmployeeNumber = 3  -- employee 3 (shows transactions)
SELECT * FROM tblTransaction WHERE EmployeeNumber = 194  --employee 194  (shows transactions)



BEGIN TRAN  
SELECT * FROM tblTransaction 
WHERE EmployeeNumber = 194  

UPDATE tblTransaction  
SET EmployeeNumber = 194   
WHERE EmployeeNumber = 3 --change from 3 to 194
				--BETWEEN 3 and 10 
				--IN IN (3, 5, 7, 9) 

SELECT * FROM tblTransaction 
WHERE EmployeeNumber = 194  

ROLLBACK TRAN  
------------------------------------------------------

--Another example Using IN:

BEGIN TRAN  
SELECT * FROM tblTransaction 
WHERE EmployeeNumber = 194  

UPDATE tblTransaction  
SET EmployeeNumber = 194   
WHERE EmployeeNumber IN (3, 5, 7, 9)  --FROM 0 to ten as output

SELECT * FROM tblTransaction 
WHERE EmployeeNumber = 194  

ROLLBACK TRAN  




--USING OUTPUT and INSERTED
-- Show old and new values of TRANSACTIONS

BEGIN TRAN --REMOVE SELECT BELOW THIS

UPDATE tblTransaction  
SET EmployeeNumber = 194  
OUTPUT INSERTED.EmployeeNumber, DELETED.EmployeeNumber --old rows go into deleted; new rows go into inserted
FROM tblTransaction  
WHERE EmployeeNumber IN (3, 5, 7, 9)  

ROLLBACK TRAN  
------------------------------------------------------------------------------------------------------------------------

-- Delete TRANSACTIONS by employee 3  
DELETE tblTransaction  
FROM tblTransaction  
WHERE EmployeeNumber = 3  

-- (Commented out) Check TRANSACTIONS again by 194  
-- SELECT * FROM tblTransaction WHERE EmployeeNumber = 194  

-- Cancel all changes made in this TRANSACTION  
ROLLBACK TRAN  







