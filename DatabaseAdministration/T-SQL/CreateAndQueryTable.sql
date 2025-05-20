/* CREATING AND QUERYING A TABLE */

USE [70-461];

--CREATE employee table

CREATE TABLE tblEmployee
(
EmployeeNumber INT NOT NULL, --NOT NULL means column is compulsory
EmployeeFirstName VARCHAR(50) NOT NULL,
EmployeeMiddleName VARCHAR(50) NULL, --NULL means can have blank here
EmployeeLastName VARCHAR(50) NOT NULL,
EmployeeGovernmentID CHAR(10) NULL,
DateOfBirth DATE NOT NULL --Don't need seconds of birth date so just DATE
);

--ALTERNATIVELY YOU can use SCRIPT TO by right clicking on GUI:
USE [70-461]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 2025/05/19 22:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblEmployee](
	[EmployeeNumber] [int] NOT NULL,
	[EmployeeFirstName] [varchar](50) NOT NULL,
	[EmployeeMiddleName] [varchar](50) NULL,
	[EmployeeLastName] [varchar](50) NOT NULL,
	[EmployeeGovernmentID] [char](10) NULL,
	[DateOfBirth] [date] NOT NULL
) ON [PRIMARY]
GO


-------------------------------------------------------------------------------------
--ADDING ADDITIONAL COLUMNS

--ALtering Tabel to ADD column
ALTER TABLE tblEmployee
ADD Department VARCHAR(10);

--Checking to see if new column was created
SELECT * FROM tblEmployee

--INSERT values into columns as a row of infromation 
INSERT INTO tblEmployee
VALUES (132, 'Dylan', 'A', 'Word', 'HN513777D', '19920914', 'Customer Relations')
----------------------
--Need to alter beacause character type is too small
ALTER TABLE tblEmployee
DROP COLUMN Department --DROP

ALTER TABLE tblEmployee
ADD Department VARCHAR(15) --ADD
--------------------------------------------------
--ALTER COlumn type instead of dropping it and losing all data within it
ALTER TABLE tblEmployee
ALTER COLUMN Department VARCHAR(20)

ALTER TABLE tblEmployee
ALTER COLUMN Department VARCHAR(19)
SELECT LEN( 'Customer Relations')--Can reduce column to 18 chatracters and no less
-----------------------------------------------------
--INSERTING NEW ROW
INSERT INTO tblEmployee([EmployeeFirstName],[EmployeeMiddleName],
[EmployeeLastName],[EmployeeGovernmentID],[DateOfBirth],[Department],[EmployeeNumber])
VALUES ('Jossef', 'H', 'Wright', 'TX593671R', '19711224', 'Litigation',131)

--Checking to see if new column was inserted
SELECT * FROM tblEmployee

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--SELECTING DATA AS PART OF TABLE

--USING WHERE AND LIKE

-- Get all employees whose last name is NOT 'Word'
SELECT * FROM tblEmployee
WHERE [EmployeeLastName] = 'Word';

-- Get all employees whose last name is NOT 'Word'
SELECT * FROM tblEmployee
WHERE [EmployeeLastName] <> 'Word';

-- Get all employees whose last name is GREATER or EQUAL to 'Word'
SELECT * FROM tblEmployee
WHERE [EmployeeLastName] >= 'Word'; --alphabet after WORD

--------------------------------------------------------
--NOTE: % meand 0 to as many characters as you like
--------------------------------------------------
-- Get all employees whose last name has 1 letter, then 'W', then anything
SELECT * FROM tblEmployee
WHERE [EmployeeLastName] LIKE '_W%';

-- Get all employees whose last name ends with a 'W'
SELECT * FROM tblEmployee
WHERE [EmployeeLastName] LIKE '%W';

-- Get all employees whose last name has 'W' in the middle
SELECT * FROM tblEmployee
WHERE [EmployeeLastName] LIKE '%W%';

-- LAST NAME STARTS WITH ANY LETTER FROM R TO T-RANGE: (R, S, T)
SELECT * FROM tblEmployee
WHERE [EmployeeLastName] LIKE '[r-t]%';

-- last name does NOT start with r, s, or t
SELECT * FROM tblEmployee
WHERE [EmployeeLastName] LIKE '[^rst]%';

-- EXPLAINING WILDCARDS:
-- %  = 0 TO MANY CHARACTERS
-- _  = EXACTLY ONE CHARACTER
-- [A-G] = ANY ONE LETTER FROM A TO G
-- [AGQ] = A, G, OR Q
-- [^AGQ] = NOT A, G, OR Q

-- find last names that contain the % symbol (literally)
SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE '[%]%';

-- ESCAPE % CHARACTER USING A BACKTICK (`) AS ESCAPE CHARACTER
SELECT * FROM tblEmployee
WHERE EmployeeLastName LIKE '`%%' ESCAPE '`';

----------------------------------------------------------------
--SELECTING DATA AS PART OF TABLE-NUMBERS

-- Get employees with EmployeeNumber 200 
SELECT * FROM tblEmployee
WHERE EmployeeNumber > 200;

-- OPPOSITE: USE NOT: Get employees with EmployeeNumber that are NOT greater than 200 
SELECT * FROM tblEmployee
WHERE NOT EmployeeNumber > 200;

-- Get employees with EmployeeNumber  is EQUAL to 200 
SELECT * FROM tblEmployee
WHERE  EmployeeNumber = 200; --ONE output

-- Get employees whose EmployeeNumber is NOT 200 (rarely used)
SELECT * FROM tblEmployee
WHERE EmployeeNumber != 200;

-- EMPLOYEES WITH NUMBER BETWEEN 200 AND 209 (INCLUSIVE)
SELECT * FROM tblEmployee
WHERE EmployeeNumber >= 200 AND EmployeeNumber <= 209;
		--AND means both conditions have to be True at the same time

-- OPPOSITE: get employees whose number is NOT between 200 and 209
SELECT * FROM tblEmployee
WHERE NOT (EmployeeNumber >= 200 AND EmployeeNumber <= 209);--USE brackets

-- EMPLOYEES WHOSE NUMBER IS LESS THAN 200 OR MORE THAN 209
SELECT * FROM tblEmployee
WHERE EmployeeNumber < 200 OR EmployeeNumber > 209;
--OR means at least one needs to be true, if both are not-=fails test

-- same as using BETWEEN keyword (INCLUSIVE RANGE)
SELECT * FROM tblEmployee
WHERE EmployeeNumber BETWEEN 200 AND 209; --DONT USE IS BETWEEN

-- EXCLUDE EMPLOYEES WITH NUMBER BETWEEN 200 AND 209
SELECT * FROM tblEmployee
WHERE EmployeeNumber NOT BETWEEN 200 AND 209;

-- EMPLOYEES WITH SPECIFIC NUMBERS ONLY IN A FOLLOWING LIST
SELECT * FROM tblEmployee
WHERE EmployeeNumber IN (200, 204, 208);

---------------------------------------------------------------------------------------------------------------------------