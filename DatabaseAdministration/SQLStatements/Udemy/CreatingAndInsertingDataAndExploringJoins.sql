/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses Using AdventureWorks2022 Database*/

--Practicing Different kinds of Joins
USE [OurFirstDatabase]
GO
-- Inserting Values into Student Table
INSERT INTO [dbo].[Student]
           ([RollNo]
           ,[StudentName]
           ,[StudentCity]
           ,[StudentPhoneNo]
           ,[StudentAge])
     VALUES
           (<RollNo, nvarchar(50),>
           ,<StudentName, nvarchar(50),>
           ,<StudentCity, nvarchar(50),>
           ,<StudentPhoneNo, nvarchar(50),>
           ,<StudentAge, int,>)
GO

--Selecting table to see values inserted
SELECT *
FROM [dbo].[Student]

SELECT * 
FROM [dbo].[Course]

--Joining two tables together using INNER JOIN
SELECT * FROM [dbo].[Student] AS s-- Using an alias for better readability
INNER JOIN [dbo].[Course] AS c 
ON s.RollNo = c.RollNO

--Specifying column names you want to have
SELECT s.RollNo, s.StudentName, c.CourseID 
FROM [dbo].[Student] AS s
INNER JOIN [dbo].[Course] AS c 
ON s.RollNo = c.RollNO

--WIll give you the same results ( as JOIN is a default for INNER JOIN)
SELECT s.RollNo, s.StudentName, c.CourseID 
FROM [dbo].[Student] AS s
JOIN [dbo].[Course] AS c 
ON s.RollNo = c.RollNO

--Using LEFT JOIN (all matching rows from right-side will show and rows that do not match will show as NULL)
SELECT s.RollNo, s.StudentName, c.CourseID 
FROM [dbo].[Student] s
LEFT JOIN [dbo].[Course] c 
ON s.RollNo = c.RollNO


--Using RIGHT JOIN (all matching rows from left-side will show and rows that do not match will show as NULL)
SELECT s.RollNo, s.StudentName, c.CourseID 
FROM [dbo].[Student] s
RIGHT JOIN [dbo].[Course] c 
ON s.RollNo = c.RollNO

--Using FULL JOIN
SELECT s.RollNo, s.StudentName, c.CourseID 
FROM [dbo].[Student] s
FULL JOIN [dbo].[Course] c 
ON s.RollNo = c.RollNO
