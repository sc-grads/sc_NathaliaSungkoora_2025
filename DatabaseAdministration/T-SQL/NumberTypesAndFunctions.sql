/* Number Types and Functions*/

USE [70-461];


--Creating an Employee table
--CREATE TABLE tblEmployee
--(EmployeeNumber int, EmployeeName int);

------------------------------------------------------------------------------------------------------------

--Declaring a variable
--Variable: Something thata contains a value

SELECT 1 + 1 AS Result;

DECLARE @myvar INT = 2; --2.01=2 (gets rid of decimal)


--Retrive the value
SELECT @myvar AS myVariable;


--Increase the value by 1
DECLARE @myvar = @myvar AS INT = 2 +1

------------------------------------------------------------------------------------------------------------

-- INTEGER NUMBERS
--TINYINT
DECLARE @myvar AS tinyint = 2;

SET @myvar = @myvar -0.5; --Output: 1 (truncates 0.5)

-- Displaying the value of the variable
SELECT @myvar AS myVariable;

--SMALINT
DECLARE @myvar AS smallint = 2;

SET @myvar = @myvar -3; --Output: -1 (truncates 0.5)

DECLARE @myvar AS smallint = 2000;

SET @myvar = @myvar *10; --Output: -1 (truncates 0.5)


-- Displaying the value of the variable
SELECT @myvar AS myVariable;

--SUMMARY OF INTEGERS

--Bigint
--Int: up to 2,000,000,000
--Tinyint:  0-255
--Smallint: -32767 to 32768












