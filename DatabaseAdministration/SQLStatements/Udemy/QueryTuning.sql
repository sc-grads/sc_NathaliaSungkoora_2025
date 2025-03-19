/*Udemy Course_ Microsoft SQL Server Database Administration Course
Practicing different Queries and Statements Query Tuning */


USE [AdventureWorks2022]
GO

-- Understand the schema and design: Joins data from [Person] and [PersonCreditCard] on BusinessEntityID.
SELECT LastName, FirstName,[CreditCardID]
FROM [Person].[Person]
INNER JOIN [Sales].[PersonCreditCard]
ON [Person].[Person].[BusinessEntityID] = [Sales].[PersonCreditCard].[BusinessEntityID];

-- Indexing: Retrieves sales order details for a specific CarrierTrackingNumber.
select * from [Sales].[SalesOrderDetail] where [CarrierTrackingNumber] = '4911-403C-98'
 
 ---------------------------------------------------------------------------------------------------------------
--Creating an INDEX
-- Switch to the AdventureWorks2022 database
USE [AdventureWorks2022]
GO

-- Create a non-clustered index on the CarrierTrackingNumber column of the SalesOrderDetail table
-- This index will improve query performance for searches involving the CarrierTrackingNumber column
CREATE NONCLUSTERED INDEX IDX_SalesOrderDetail_CarrierTrackingNumber
ON [Sales].[SalesOrderDetail] ([CarrierTrackingNumber])

GO
------------------------------------------------------------------------------------------------------------------------
-- Avoid SELECT *: Fetch only the required columns.
SELECT LastName, FirstName FROM [Person].[Person]

-- Use Joins instead of Subqueries: A more efficient join versus using an IN subquery.
SELECT LastName
FROM [Person].[Person] p
JOIN [Sales].[SalesPerson] s
ON p.BusinessEntityID = s.BusinessEntityID
AND s.[SalesQuota] = 300000.00



-- Use stored procedures: Inserts employee data into `NewEmployees` table.
Create Table NewEmployees (FirstName nvarchar(50), LastName nvarchar(50))

CREATE PROCEDURE AddNewEmployee
@FirstName nvarchar(50), @LastName nvarchar(50)
AS
BEGIN
    INSERT INTO NewEmployees (FirstName, LastName)
    VALUES (@FirstName, @LastName);
END;

-- Select * from new table created
SELECT * 
FROM NewEmployees 


-- Insert a new employee (Executing stored Procedure makes query run faster)
exec AddNewEmployee 'John','Doe'

-- Avoid functions in WHERE clause: Direct date range instead of using YEAR() function for better performance.
SELECT * FROM [Sales].[SalesOrderDetail] WHERE [ModifiedDate] BETWEEN '2011-01-01' AND '2011-12-31'; 

-- Use Pagination: Fetch a limited number of records starting after the first 50.
SELECT * FROM [Sales].[SalesOrderDetail] 
ORDER BY SalesOrderID
OFFSET 50 ROWS 
FETCH NEXT 10 ROWS ONLY;



-- Declare variables for LastName and FirstName, then set their values
DECLARE @LastName nvarchar(50), @FirstName nvarchar(50);
SET @LastName = 'Abbas';
SET @FirstName = 'Syed';

-- Execute a parameterized query to fetch records matching LastName and FirstName
SELECT LastName, FirstName 
FROM [Person].[Person] 
WHERE LastName = @LastName AND FirstName = @FirstName;

-- (Incomplete query): Another example for a hardcoded query.
-- This query directly uses the values 'abbas' for LastName, without using parameters.
-- Hardcoding values in the query can make it less flexible and potentially insecure, 
-- as it doesn't allow for dynamic input and is vulnerable to SQL injection attacks.
-- It is generally not recommended for scenarios where user input is involved.
SELECT LastName, FirstName 
FROM [Person].[Person] 
WHERE LastName = 'abbas';
