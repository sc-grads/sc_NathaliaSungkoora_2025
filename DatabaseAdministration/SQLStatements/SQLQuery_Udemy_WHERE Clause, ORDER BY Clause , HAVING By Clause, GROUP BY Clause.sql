/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses Using AdventureWorks2022 Database*/

USE AdventureWorks2022
GO 
--------------------------------------------------------------------------------------------------------------------------------------------
-- Using Person Adress Table
SELECT * FROM PERSON.ADDRESS

--Where Clauses
--How many have postal code 98011
SELECT *
FROM PERSON.ADDRESS
WHERE PostalCode = '98011'

--How many do not have postal code 98011
SELECT *
FROM PERSON.ADDRESS
WHERE PostalCode != '98011' --19588 rows output

-- Alternative way of question above
SELECT *
FROM PERSON.ADDRESS
WHERE PostalCode <>'98011' -- 19588 rows output


--Just getting count of rows
SELECT COUNT(*)
FROM PERSON.ADDRESS
WHERE PostalCode <> '98011'

--Getting data where dates where modified after a specific date
SELECT *
FROM PERSON.ADDRESS
WHERE ModifiedDate >= '2013-11-08 00:00:00.000' --greater than or equal to a specific date

SELECT *
FROM PERSON.ADDRESS
WHERE ModifiedDate <= '2013-11-08 00:00:00.000' --less than or equal to a specific date

--Finding all the people whose first Name starts with MAT using LIKE operator
SELECT *
FROM PERSON.PERSON
WHERE FirstName LIKE 'MAT%' --LIKE operator (NOT CASE SENSITIVE)

--Finding all the people whose first Name ending with ew using LIKE operator
SELECT *
FROM PERSON.PERSON
WHERE FirstName LIKE '%ew' --LIKE operator (NOT CASE SENSITIVE)

--Using EmployeePayHistory table
SELECT *
FROM [HumanResources].[EmployeePayHistory]


--Finding maximum rate of pay
SELECT MAX(Rate) AS PayRate --using an alias 
FROM [HumanResources].[EmployeePayHistory]

--Finding minimum rate of pay
SELECT MIN(Rate) AS [Min Pay Rate] -- if you add aspace between words, then add square brackets
FROM [HumanResources].[EmployeePayHistory]

-- Using ProductionCostHistory table

SELECT *
FROM [Production].[ProductCostHistory]
WHERE StartDate = '2013-05-30 00:00:00.000' -- 195 rows output


SELECT *								-- Adding a condition (AND)
FROM [Production].[ProductCostHistory]
WHERE StartDate = '2013-05-30 00:00:00.000' AND StandardCost >= 200.00 --greater than or equal to
																		-- 94 rows output	

SELECT *
FROM [Production].[ProductCostHistory]		--Ouput will show one condition OR the other
WHERE (StartDate = '2013-05-30 00:00:00.000' AND StandardCost >= 200.00) OR ProductID > 800


SELECT *
FROM [Production].[ProductCostHistory]		--Ouput will show BOTH conditions
WHERE (StartDate = '2013-05-30 00:00:00.000' AND StandardCost >= 200.00) AND ProductID > 800

-- Listing only specific values in a list
SELECT *
FROM [Production].[ProductCostHistory]
WHERE ProductID IN (802, 803, 820, 900)

--Checking where EndDate is Null
SELECT *
FROM [Production].[ProductCostHistory]
WHERE EndDate IS NULL		--NULL is not an empty value

--Checking where EndDate is  NOT Null
SELECT *
FROM [Production].[ProductCostHistory]
WHERE EndDate IS NOT NULL

--------------------------------------------------------------------------------------------------------------------------------------------
-- ORDER BY CLAUSES

SELECT * 
FROM [HumanResources].[EmployeePayHistory] 
ORDER BY  Rate 


SELECT * 
FROM [HumanResources].[EmployeePayHistory] 
ORDER BY Rate  ASC --Ascending order

SELECT * 
FROM [HumanResources].[EmployeePayHistory] 
ORDER BY Rate  DESC --Descending order


SELECT * 
FROM [HumanResources].[EmployeePayHistory] 
WHERE  ModifiedDate >= '2010-06-30 00:00:00' -- Adding a condition in where statement
ORDER BY ModifiedDate DESC					-- descending order



SELECT * 
FROM [HumanResources].[EmployeePayHistory] 
WHERE  YEAR(ModifiedDate) >= '2014' --Picking Year column to look for 2014
ORDER BY ModifiedDate DESC


SELECT * 
FROM [HumanResources].[EmployeePayHistory] 
WHERE  MONTH(ModifiedDate) = '06' --Picking Month column to look for 06 (June)
ORDER BY ModifiedDate DESC

--------------------------------------------------------------------------------------------------------------------------------------------
--GROUP BY CLAUSES

SELECT* 
FROM PERSON.ADDRESS 
WHERE postalcode = '98011' -- 26 rows output


SELECT COUNT(*) 
FROM PERSON.ADDRESS 
WHERE postalcode = '98011' -- 26 rows output

SELECT COUNT(*) 
FROM PERSON.ADDRESS 
WHERE postalcode = '98225' -- 213 rows output

SELECT COUNT(*),postalcode 
FROM PERSON.ADDRESS 
GROUP BY PostalCode	--Doing a count for each postal code


SELECT COUNT(*) AS NoOfAddresses,postalcode -- Using an alias to make it more readable
FROM PERSON.ADDRESS 
GROUP BY PostalCode

SELECT COUNT(*) AS NoOfAddresses,postalcode 
FROM PERSON.ADDRESS 
GROUP BY PostalCode 
ORDER BY PostalCode DESC

SELECT COUNT(*),City 
FROM PERSON.ADDRESS 
GROUP BY City

SELECT COUNT(*),City,PostalCode 
FROM PERSON.ADDRESS 
GROUP BY City,PostalCode

--------------------------------------------------------------------------------------------------------------------------------------
--GROUP BY, ORDER BY, and HAVING Clause

--Using product table
SELECT* 
FROM [Production].[Product]

SELECT COUNT(*) Countofproduct,Color 
FROM [Production].[Product] 
WHERE color = 'yellow' 
GROUP BY Color

SELECT COUNT(*) Countofproduct,Color 
FROM [Production].[Product]
GROUP BY Color 
HAVING Color = 'yellow'


SELECT COUNT(*) countofproduct,Color,Size 
FROM [Production].[Product] 
GROUP BY Color,size 
HAVING Size >= '44'