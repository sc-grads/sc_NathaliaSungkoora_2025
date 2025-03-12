/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses and statements Using AdventureWorks2022 Database*/

--DELETE Statements in Detail
USE [AdventureWorks2022]
GO
-- Create a new table named 'salesstaff' with specific columns and data types
CREATE TABLE salesstaff
(
    staffid INT NOT NULL PRIMARY KEY,  -- Primary key for the staff ID
    firstname NVARCHAR(50) NOT NULL,   -- First name of the sales staff
    lastname NVARCHAR(50) NOT NULL,    -- Last name of the sales staff
    countryregion NVARCHAR(50) NOT NULL -- Country or region of the sales staff
);

-- Drop the 'salesstaff' table because it already exists
DROP TABLE salesstaff;

--Select table to see if it is created.
SELECT *
FROM salesstaff
--Select VIEW to see column names
SELECT *
FROM Sales.vSalesPerson

-- Insert data into 'salesstaff' table by selecting from another table (VIEW: Sales.vSalesPerson)
INSERT INTO salesstaff
SELECT BusinessEntityID,
		FirstName,
		LastName, 
		CountryRegionName 
FROM Sales.vSalesPerson;

-- Delete all rows from 'salesstaff' table
DELETE salesstaff;

--Using FROM: Delete all rows from 'salesstaff' table, using 'DELETE FROM' syntax
DELETE FROM salesstaff;--Both options delete the table in the same way

-- Using WHERE: Delete rows from 'salesstaff' where the country region is 'United States'
DELETE FROM salesstaff WHERE countryregion = 'UNITED STATES';


-- Start a transaction and delete rows with a rollback, undoing the delete operation
BEGIN TRAN; --Can recover data becasue it has not been committed yet.
DELETE FROM salesstaff WHERE countryregion = 'UNITED STATES';
ROLLBACK TRAN; --Go back to how it was before delete statement was made


-- Start a transaction, delete rows, and then commit the changes
BEGIN TRAN;		
DELETE FROM salesstaff WHERE countryregion = 'UNITED STATES';
COMMIT;		--Once comitted changes have been permanently made


-- Using SUBQUERY: Delete rows from 'salesstaff' where the StaffID matches BusinessEntityID from another table (Sales.vSalesPerson)
DELETE FROM salesstaff WHERE staffid IN 
(SELECT BusinessEntityID FROM Sales.vSalesPerson WHERE SalesLastYear = 0); 
--Output: 4 rows affected and have been deleted

--Using JOIN: Delete rows from 'salesstaff' by joining it with another table (Sales.vSalesPerson) based on matching StaffID and BusinessEntityID
DELETE salesstaff 
FROM Sales.vSalesPerson AS sp --using an alias
INNER JOIN salesstaff AS ss 
ON sp.BusinessEntityID = ss.staffid
WHERE sp.SalesLastYear = 0;
--Output: 4 rows affected and have been deleted (same result as using a subquery)