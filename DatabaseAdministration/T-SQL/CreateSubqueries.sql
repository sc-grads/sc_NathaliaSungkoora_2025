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
--ANY, SOME and ALL

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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--THE FROM CLAUSE

-- Subquery in FROM clause, filter employees first, then join
--REPLACING employee table with subquery (that filters specific values)
--Joining this output as a 'table' and Aliasing it AS E
SELECT * 
FROM tblTransaction AS T
LEFT JOIN (	--Subquery limits rows to 4
    SELECT * FROM tblEmployee
    WHERE EmployeeLastName LIKE 'y%') AS E --ALIAS NB!
ON E.EmployeeNumber = T.EmployeeNumber
ORDER BY T.EmployeeNumber;


-- Join all, then filter in WHERE (acts like INNER JOIN)
SELECT * 
FROM tblTransaction AS T
LEFT JOIN tblEmployee AS E
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeLastName LIKE 'y%'
ORDER BY T.EmployeeNumber;


-- Join with filter in ON clause (keeps LEFT JOIN behavior)
SELECT * 
FROM tblTransaction AS T
LEFT JOIN tblEmployee AS E
ON E.EmployeeNumber = T.EmployeeNumber
AND E.EmployeeLastName LIKE 'y%'
ORDER BY T.EmployeeNumber;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--THE SELECT CLAUSE

-- COUNT transactions per employee
--EXAMPLE of a CORRELATED QUERY:
SELECT *, 
    (SELECT COUNT(EmployeeNumber)
     FROM tblTransaction AS T
     WHERE T.EmployeeNumber = E.EmployeeNumber) AS NumTransactions 
FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'y%'  




--Adding another subquery and SEPERATE using a COMMA
SELECT *, 
    (SELECT COUNT(EmployeeNumber)
     FROM tblTransaction AS T
     WHERE T.EmployeeNumber = E.EmployeeNumber) AS NumTransactions, -- COUNT transactions per employee

    (SELECT SUM(Amount)
     FROM tblTransaction AS T
     WHERE T.EmployeeNumber = E.EmployeeNumber) AS TotalAmount       -- TOTAL AMOUNT per employee

FROM tblEmployee AS E
WHERE E.EmployeeLastName LIKE 'y%'  -- only employees with last names starting with 'y'

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CORRELATED SUBQUERY -WHERE

-- Returns transactions where a matching employee EXISTS and last name starts with 'y'
SELECT * 
FROM tblTransaction AS T
WHERE EXISTS ( --runs for every row in outer query checks name then number
    SELECT EmployeeNumber 
    FROM tblEmployee AS E 
    WHERE EmployeeLastName LIKE 'y%' AND T.EmployeeNumber = E.EmployeeNumber
)									--Don't need JOIN, using AND
ORDER BY EmployeeNumber

-- NOT EXISTS (OPPOSITE): Returns transactions where no matching employee has a last name starting with 'y'
SELECT * 
FROM tblTransaction AS T
WHERE NOT EXISTS (
    SELECT EmployeeNumber 
    FROM tblEmployee AS E 
    WHERE EmployeeLastName LIKE 'y%' AND T.EmployeeNumber = E.EmployeeNumber
)
ORDER BY EmployeeNumber


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TOP 5 FROM VARIOUS CATEGORIES

--USING RANK:
-- Get top 5 employees (by EmployeeNumber) from each department
SELECT * 
FROM (
    SELECT D.Department, EmployeeNumber, EmployeeFirstName, EmployeeLastName,
           RANK() OVER(PARTITION BY D.Department ORDER BY E.EmployeeNumber) AS TheRank
    FROM tblDepartment AS D 
    JOIN tblEmployee AS E ON D.Department = E.Department
) AS MyTable --SUBQUERY THAT HAS BEEN ALIASED
WHERE TheRank <= 5
ORDER BY Department, EmployeeNumber

