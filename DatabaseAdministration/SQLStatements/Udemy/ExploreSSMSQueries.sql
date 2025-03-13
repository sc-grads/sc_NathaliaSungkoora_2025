/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements to Explore SSMS and Different Databases*/

--Running Queries as part of Exploring SSMS EXECUTION PLAN, Activity Monitor

-- SWITCH TO THE DATABASE NAMED 'OurFirstDatabase'
USE OurFirstDatabase  
GO  

USE  a
GO

-- Retrieve all data from the 'Employee' table in the 'dbo' schema
SELECT * FROM [dbo].[Student]


-- Retrieve all data from the 'Employee' table in the 'dbo' schema
SELECT * FROM [dbo].[Student] where RollNo = 1

-- Activity Monitor Query that I can run to identify bottlenecks
sp_who2 active