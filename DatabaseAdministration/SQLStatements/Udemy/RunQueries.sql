/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements to Explore SSMS and Different Databases*/

--Running Queries as part of Exploring SSMS
--Examples

USE [AdventureWorks2022]; --Can use semi-colon to execute query
GO						--Can also use the Keyword "GO" to execute query

-- SWITCH TO THE DATABASE NAMED 'OurFirstDatabase'
USE OurFirstDatabase  
GO  



-- Retrieve all data from the 'Employee' table in the 'dbo' schema
SELECT * FROM [dbo].[Student]


-- Retrieve all data from the 'Employee' table again
SELECT * FROM  [dbo].[Student]

-- Repeat the same query 3 more times (to display data multiple times)
SELECT * FROM [dbo].[Student] 
SELECT * FROM [dbo].[Student]  
SELECT * FROM [dbo].[Student] 
SELECT * FROM [dbo].[Student] 

