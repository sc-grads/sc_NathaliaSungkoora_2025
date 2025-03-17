/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements to Explore MSSQL */

--FILEGROUPS

USE [FileGroupsDemoDatabase]
GO

-- Create a new table named "Orders_2019" in the "dho" schema
CREATE TABLE [dbo].[Orders_2019]
   ( 
     -- Define a column "OrderId" of type int, and set it as the Primary Key
     [OrderId] int PRIMARY KEY,

     -- Define a column "ProductName" of type nchar(10), which can store a fixed-length string up to 10 characters
     [ProductName] nchar(10)
   )
-- Specify that the table should be stored on the filegroup "FG_2019"
ON [FG_2019];


-- Create a new table named "Orders_2020" in the "dho" schema
CREATE TABLE [dbo].[Orders_2020]
   ( 
     -- Define a column "OrderId" of type int, and set it as the Primary Key
     [OrderId] int PRIMARY KEY,

     -- Define a column "ProductName" of type nchar(10), which can store a fixed-length string up to 10 characters
     [ProductName] nchar(10)
   )
-- Specify that the table should be stored on the filegroup "FG_2020"
ON [FG_2020];



-- Create a new table named "Orders_2021" in the "dho" schema
CREATE TABLE [dbo].[Orders_2021]
   ( 
     -- Define a column "OrderId" of type int, and set it as the Primary Key
     [OrderId] int PRIMARY KEY,

     -- Define a column "ProductName" of type nchar(10), which can store a fixed-length string up to 10 characters
     [ProductName] nchar(10)
   )
-- Specify that the table should be stored on the filegroup "FG_2021"
ON [FG_2021];