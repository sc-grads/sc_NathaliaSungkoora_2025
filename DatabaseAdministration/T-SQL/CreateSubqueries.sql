/* SUBQUERIES */
USE [70-461(2)];

--TABLE STRUCTURE
--LOOKING AT THE TABLES IN DATABASE
SELECT * FROM tblDepartment 
SELECT * FROM tblEmployee
SELECT * FROM tblTransaction

--LOOKING AT RANGE OF TABLE
SELECT	MIN(EmployeeNumber) AS MinNumber, 
		MAX(EmployeeNumber) AS MaxNumber
FROM tblTransaction

SELECT	MIN(EmployeeNumber) AS MinNumber, 
		MAX(EmployeeNumber) AS MaxNumber
FROM tblEmployee

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--THE WHERE CLAUSE

-- TRANSACTIONS for employees whose last name starts with 'y' using INNER JOIN
SELECT T.* 
FROM tblTransaction AS T
INNER JOIN tblEmployee AS E
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastName LIKE 'y%'
ORDER BY T.EmployeeNumber;

-- SAME TRANSACTIONS using a SUBQUERY with IN
SELECT * 
FROM tblTransaction AS T
WHERE EmployeeNumber IN
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'y%')
ORDER BY EmployeeNumber;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- WHERE and NOT
--EXPANDING on previous query

--INCLUDES only employees whose last name DOESN'T start with 'y'
SELECT * 
FROM tblTransaction AS T
WHERE EmployeeNumber IN
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName NOT LIKE 'y%')
ORDER BY EmployeeNumber; -- must be in tblEmployee AND tblTransaction, and not 126-129
                         -- INNER JOIN
                       
 -- EXCLUDES employees whose last name STARTS with 'y'
SELECT * 
FROM tblTransaction AS T
WHERE EmployeeNumber NOT IN
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'y%')
ORDER BY EmployeeNumber; -- must be in tblTransaction, and not 126-129
                         -- LEFT JOIN
                        
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---ANY, SOME and ALL

SELECT * 
FROM tblTransaction AS T
WHERE EmployeeNumber = SOME -- synonym (= ANY) -- same as IN
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName  LIKE 'y%')
ORDER BY EmployeeNumber; --Exist in tblEMployee and tblTransaction

SELECT * 
FROM tblTransaction AS T
WHERE EmployeeNumber <> ANY  -- NOT EQUAL ( doesn't work properly for exclusion)
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'y%')
ORDER BY EmployeeNumber; --Output: 126-129 stil there (not working properly)


--Solution to above query: USE ALL
SELECT * 
FROM tblTransaction AS T
WHERE EmployeeNumber <> ALL  -- works like NOT IN 
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'y%')
ORDER BY EmployeeNumber; --Output: 126-129 not there
--LOGIC: 126/7/8/9... is not equal to all of the individual following (126, 127, 128, 129)
--Output here: false for all (excluded in query)


SELECT * 
FROM tblTransaction AS T
WHERE EmployeeNumber <= ALL  -- returns rows with EmployeeNumber less than or equal to all values
    (SELECT EmployeeNumber FROM tblEmployee WHERE EmployeeLastName LIKE 'y%')
ORDER BY EmployeeNumber;


/* NOTE
-> ANY/SOME = OR
-> ALL = AND 

-> ANY = anything up to 129
-> ALL = anything up to 126
							*/
