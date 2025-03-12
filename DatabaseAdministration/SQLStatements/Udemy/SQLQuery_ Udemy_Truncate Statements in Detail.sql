/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses and statements Using AdventureWorks2022 Database*/

--TRUNCATE Statements in Detail

USE [AdventureWorks2022]
GO

-- Select all records from the 'salesstaff' table
SELECT * FROM salesstaff;

-- Remove all rows from the 'salesstaff' table without logging each row
TRUNCATE TABLE salesstaff;

-- Create a new table 'employeenew' with an auto-incrementing ID and employee name
CREATE TABLE employeenew (
    id INT IDENTITY(1,1) NOT NULL,  -- 'id' is an auto-incrementing column IDENTITY
    employeename NVARCHAR(50) NOT NULL  -- 'employeename' column to store employee names
);

--Selecting table to see table columns created
SELECT *
FROM employeenew

-- Insert multiple rows into the 'employeenew' table
INSERT INTO employeenew
(employeename)
VALUES ('Abbas'),('Imran'),('Dino'),('James');  -- Inserting multiple employee names


-- Delete all rows from the 'employeenew' table
DELETE FROM employeenew;


--Inserting a value to see how IDENTITY works in Delete statement
INSERT INTO employeenew
(employeename)
VALUES ('Maria') --using delete, the ID will continue and now be 5

-- Remove all rows from the 'employeenew' table without logging each row
TRUNCATE TABLE employeenew;

--Inserting a value to see how IDENTITY works in Delete statement
INSERT INTO employeenew
(employeename)
VALUES ('Sarah') --using TRUNCATE, the ID will start again at 1