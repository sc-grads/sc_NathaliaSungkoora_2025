/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses Using AdventureWorks2022 Database*/

USE [AdventureWorks2022]
GO

--SUBQUERIES

-- Tables being used to query
SELECT * 
FROM [HumanResources].[EmployeePayHistory]

SELECT * 
FROM [Production].[Product]

SELECT * 
FROM [Production].[ProductInventory]

-- ALL TABLES GET CREATED IN DBO SCHEMA UNLESS WE CREATE A NEW SCHEMA
--Example from DBO SCHEMA
SELECT * FROM dbo.EMPLOYEE

--FORMAT: [DATABASE].[SCHEMA].[TABLE NAME]
--SCHEMA is like a container of storage where we are saving different related tables
--This imporves efficiency and time management when finding data in a DATABASE. 




--Selecting BusinessEntityID where Rate is greater than 60 usign subquery
SELECT *
FROM [HumanResources].[EmployeePayHistory]
WHERE [BusinessEntityID] IN (SELECT BusinessEntityID FROM [HumanResources].[EmployeePayHistory] WHERE Rate > 60)
--IN returns multiple rows
--IF you use an = sign then the return must be one row
SELECT *
FROM [HumanResources].[EmployeePayHistory]
WHERE [BusinessEntityID] = (SELECT BusinessEntityID FROM [HumanResources].[EmployeePayHistory] WHERE Rate = 39.06)

SELECT *
  FROM [HumanResources].[EmployeePayHistory]
  WHERE [BusinessEntityID] IN (SELECT BusinessEntityID FROM [HumanResources].[EmployeePayHistory] WHERE Rate = 39.06)


 --Finding all products where we know that the Product inventory quantity is greater than 300
SELECT * FROM [Production].[Product]
WHERE ProductID IN (SELECT ProductID FROM [Production].[ProductInventory] WHERE Quantity > 300)
