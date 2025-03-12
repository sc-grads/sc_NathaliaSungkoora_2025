/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Clauses Using AdventureWorks2022 Database*/

--Select statements
USE AdventureWorks2022
GO 

--Select all columns from a table
SELECT * FROM PERSON.ADDRESS

--Select specific columns from a table
SELECT AddressID, City, ModifiedDate
FROM PERSON.ADDRESS

--Select specific columns from a table Example where Order does not matter
SELECT AddressID, ModifiedDate, City
FROM PERSON.ADDRESS


--Selecting Top  rows from table
SELECT TOP 10 *
FROM PERSON.ADDRESS