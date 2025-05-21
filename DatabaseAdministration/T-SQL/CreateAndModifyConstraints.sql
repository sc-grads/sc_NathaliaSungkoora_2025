/* CREATE AND MODIFY CONSTRAINTS */

-- Add a UNIQUE constraint to prevent duplicate Government IDs  
ALTER TABLE tblEmployee  
ADD CONSTRAINT unqGovernmentID UNIQUE (EmployeeGovernmentID);  
		--Give COnstraint a name and give type

-- Find duplicate Government IDs and show their count  
SELECT EmployeeGovernmentID, COUNT(EmployeeGovernmentID) AS MyCount  
FROM tblEmployee  
GROUP BY EmployeeGovernmentID  
HAVING COUNT(EmployeeGovernmentID) > 1  

-- Check records with specific duplicate Government IDs  
SELECT * FROM tblEmployee  
WHERE EmployeeGovernmentID IN ('HN513777D', 'TX593671R')  

----------------------------------------------------
BEGIN TRAN  

-- Delete employees with EmployeeNumber less than 3  
DELETE FROM tblEmployee  
WHERE EmployeeNumber < 3  
  
DELETE TOP(2) FROM tblEmployee  
WHERE EmployeeNumber IN (131, 132)  

 
SELECT * FROM tblEmployee  
WHERE EmployeeGovernmentID IN ('HN513777D', 'TX593671R')  

COMMIT TRAN  --Change ROLLBACK TO COMMIT
----------------------------------------------------------------------

---ANOTHER CONSTRAINT: 
-- Add UNIQUE constraint to prevent duplicate TRANSACTIONS by amount, date, and employee  
ALTER TABLE tblTransaction  
ADD CONSTRAINT unqTransaction UNIQUE (Amount, DateOfTransaction, EmployeeNumber)  

-- Delete TRANSACTIONS for employee 131  
DELETE FROM tblTransaction  
WHERE EmployeeNumber = 131  

-- Insert a TRANSACTION (will succeed)  
INSERT INTO tblTransaction  
VALUES (1, '2015-01-01', 131)  

-- Insert a duplicate TRANSACTION (will fail due to UNIQUE constraint)  
INSERT INTO tblTransaction  
VALUES (1, '2015-01-01', 131)  
--Error message: Violation of UNIQUE KEY constraint 'unqTransaction'. Cannot insert duplicate key in object 'dbo.tblTransaction'. The duplicate key value is (1.00, Jan  1 2015 12:00AM, 131).


-- REOMVE UNIQUE constraint on TRANSACTIONS  
ALTER TABLE tblTransaction  
DROP CONSTRAINT unqTransaction  
------------------------------------------------------------------------------

-- Create a new table with a UNIQUE constraint on TRANSACTIONS  
CREATE TABLE tblTransaction2  
(  
    Amount SMALLMONEY NOT NULL,  
    DateOfTransaction SMALLDATETIME NOT NULL,  
    EmployeeNumber INT NOT NULL,  
    CONSTRAINT unqTransaction2 UNIQUE (Amount, DateOfTransaction, EmployeeNumber)  
)			--CONSTRAINT(name, type and columns you want to constrain)


--Testing if Constarints worked:
INSERT INTO tblTransaction2 
VALUES (1, '2015-01-01', 131)  --Output: Works first time not the second!


-- Drop the new TRANSACTIONS2 table  
DROP TABLE tblTransaction2  

--HOW TO MODIFY CONSTRAINT: DROPPING IT AND RECREATING IT


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--DEFAULT CONSTRAINTS

-- Add a new column to store the entry date of TRANSACTIONS  
ALTER TABLE tblTransaction  
ADD DateOfEntry DATETIME --Add column nmae after "ADD"

--DEFAULT CONSTRAINT ADDED:
-- Add a DEFAULT constraint so new TRANSACTIONS get current date if DateOfEntry is not provided  
ALTER TABLE tblTransaction  
ADD CONSTRAINT defDateOfEntry DEFAULT GETDATE() FOR DateOfEntry;  --Getdate() dynamic data

-- Delete TRANSACTIONS by employees with EmployeeNumber is 1 and 2
DELETE FROM tblTransaction  
WHERE EmployeeNumber < 3  

-- Insert a TRANSACTION without DateOfEntry (uses default GETDATE())  
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)  
VALUES (1, '2014-01-01', 1)  

-- Insert a TRANSACTION with a custom DateOfEntry  
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)  
VALUES (2, '2014-01-02', 1, '2013-01-01')  

-- GET info after inserting:
SELECT * FROM tblTransaction  
WHERE EmployeeNumber < 3 ;


--ADD DEFAULT CONSTRAINT IN TABLE: SYNTAX WILL CHANGE SLIGHTLY:
-- Create a new table for TRANSACTIONS with default DateOfEntry  
CREATE TABLE tblTransaction2  
(  
    Amount SMALLMONEY NOT NULL,  
    DateOfTransaction SMALLDATETIME NOT NULL,  
    EmployeeNumber INT NOT NULL,  
    DateOfEntry DATETIME NULL CONSTRAINT tblTransaction2_defDateOfEntry DEFAULT GETDATE()  
)  

-- Insert a TRANSACTION using the default DateOfEntry  
INSERT INTO tblTransaction2(Amount, DateOfTransaction, EmployeeNumber)  
VALUES (1, '2014-01-01', 1)  

-- Insert a TRANSACTION with a specific DateOfEntry  
INSERT INTO tblTransaction2(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)  
VALUES (2, '2014-01-02', 1, '2013-01-01')  

-- Show TRANSACTIONS from the new table with EmployeeNumber1 and 2
SELECT * FROM tblTransaction2  
WHERE EmployeeNumber < 3  

-- Drop the new TRANSACTIONS table  
DROP TABLE tblTransaction2  


------------
-- 1. DROP CONSTRAINT FIRST BEFORE DROPPING COLUMN!
ALTER TABLE tblTransaction  
DROP CONSTRAINT defDateOfEntry

-- 2. Drop Column: Remove the DateOfEntry column from original TRANSACTIONS table  
ALTER TABLE tblTransaction  
DROP COLUMN DateOfEntry  
-----------


BEGIN TRAN  

-- Add DateOfEntry column with DEFAULT and set values for existing rows  
ALTER TABLE tblTransaction  
ADD DateOfEntry DATETIME  
DEFAULT GETDATE() WITH VALUES  
 
SELECT * FROM tblTransaction  
 
ROLLBACK TRAN  



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CHECK CONSTRAINTS


-- Add a CHECK constraint to ensure TRANSACTIONS Amount is between -1000 and 1000  
ALTER TABLE tblTransaction  
ADD CONSTRAINT chkAmount CHECK (Amount > -1000 AND Amount < 1000)  


------
-- Try to insert a TRANSACTION with an invalid Amount 
INSERT INTO tblTransaction  
VALUES (1010, '2014-01-01', 1); --Output: Error message->(will fail)  

--Insert value within values specified (between -1000 and 1000)
INSERT INTO tblTransaction  
VALUES (-110, '2014-01-01', 1) ;--Output: row succesfully inserted
----

--EXAMPLE LOOKING AT EMPLOYEE TABLE
-- Add a CHECK constraint to ensure middle names do not contain dots (constraint is not checked on existing data)  
ALTER TABLE tblEmployee WITH NOCHECK  --NOCHECK(not looking at existing rows otherwise an error message is shown)
ADD CONSTRAINT chkMiddleName CHECK  
(REPLACE(EmployeeMiddleName, '.', '') = EmployeeMiddleName OR EmployeeMiddleName IS NULL)  --Look at "." and replace with nothing

-- Remove the middle name CHECK constraint  
ALTER TABLE tblEmployee  
DROP CONSTRAINT chkMiddleName  
------------------------------------------------------------------
--Looking to see if CHECK Constraint worked:
BEGIN TRAN  
  -- Insert employee with dot in middle name (allowed due to earlier NOCHECK)  
  INSERT INTO tblEmployee  
  VALUES (2003, 'A', 'B', 'C', 'D', '2014-01-01', 'Accounts')  --Once "." is removed->Constraint works

  SELECT * FROM tblEmployee WHERE EmployeeNumber = 2003  
ROLLBACK TRAN  
-------------------------------------------------------------------

-- Add a CHECK constraint to ensure DateOfBirth is within valid range  
ALTER TABLE tblEmployee WITH NOCHECK  
ADD CONSTRAINT chkDateOfBirth CHECK (DateOfBirth BETWEEN '1900-01-01' AND GETDATE())  

-----------
BEGIN TRAN  
  -- Try to insert future birthdate (invalid, will fail if constraint is enforced)  
  INSERT INTO tblEmployee  
  VALUES (2003, 'A', 'B', 'C', 'D', '2115-01-01', 'Accounts')   
  SELECT * FROM tblEmployee WHERE EmployeeNumber = 2003  --OUTPIT: Error message (as year 2115 is not '1900-01-01' AND GETDATE()) 
ROLLBACK TRAN  
---------
--CREATE NEW TABLE WITH CHECK 
-- Create a new table with a CHECK constraint on middle name  
CREATE TABLE tblEmployee2  
(  
    EmployeeMiddleName VARCHAR(50) NULL,  
    CONSTRAINT CK_EmployeeMiddleName CHECK  --CHECK ADDED
    (REPLACE(EmployeeMiddleName, '.', '') = EmployeeMiddleName OR EmployeeMiddleName IS NULL)  
)  --NB!!! Add constraint name

-- Drop the test employee table  
DROP TABLE tblEmployee2  

-- Drop the DateOfBirth CHECK constraint  
ALTER TABLE tblEmployee  
DROP CONSTRAINT chkDateOfBirth  

-- Drop the MiddleName CHECK constraint (if still exists)  
ALTER TABLE tblEmployee  
DROP CONSTRAINT chkMiddleName  

-- Drop the Amount CHECK constraint from TRANSACTIONS  
ALTER TABLE tblTransaction  
DROP CONSTRAINT chkAmount  


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PRIMARY KEY 

-- Add a PRIMARY KEY constraint on EmployeeNumber  
ALTER TABLE tblEmployee  
ADD CONSTRAINT PK_tblEmployee PRIMARY KEY (EmployeeNumber)  

-- Insert a new employee with EmployeeNumber 2004  
INSERT INTO tblEmployee(EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName,  
EmployeeGovernmentID, DateOfBirth, Department)  
VALUES (2004, 'FirstName', 'MiddleName', 'LastName', 'AB12345FI', '2014-01-01', 'Accounts')  

-- Delete the employee with EmployeeNumber 2004  
DELETE FROM tblEmployee  
WHERE EmployeeNumber = 132/131/2004

-- Drop the PRIMARY KEY constraint  
ALTER TABLE tblEmployee  
DROP CONSTRAINT PK_tblEmployee  
-----------------------------------------------------
--CREATE NEW TABLE USING IDENTITY:
-- Create a new table with an IDENTITY column and PRIMARY KEY  
CREATE TABLE tblEmployee3 
(  
    EmployeeNumber INT CONSTRAINT PK_tblEmployee3 PRIMARY KEY IDENTITY(1,1),  
    EmployeeName NVARCHAR(20)  
)  

-- Insert duplicate names (allowed since EmployeeNumber auto-increments)  
INSERT INTO tblEmployee3 
VALUES ('My Name'),  
       ('My Name')  

-- View all rows to see if values were added:
SELECT * FROM tblEmployee3

-- Delete all rows from the table (keeps identity seed value unchanged)  
DELETE FROM tblEmployee3

-- Truncate the table (resets identity seed to 1)  
TRUNCATE TABLE tblEmployee3 

-- Insert values with explicit EmployeeNumber (will fail without IDENTITY_INSERT ON)  
INSERT INTO tblEmployee3(EmployeeNumber, EmployeeName)  
VALUES (3, 'My Name'), (4, 'My Name')  --Output: ERROR Identity needs to be set to ON

-- Allow inserting explicit values into IDENTITY column  
SET IDENTITY_INSERT tblEmployee3  ON  

-- Insert rows with custom EmployeeNumber values  
INSERT INTO tblEmployee3(EmployeeNumber, EmployeeName)  
VALUES (38, 'My Name'), (39, 'My Name')  

-- Turn off IDENTITY_INSERT again  
SET IDENTITY_INSERT tblEmployee3  OFF

-- Drop the test table  
DROP TABLE tblEmployee3

-- Get the last identity value generated on the current session and any table  
SELECT @@IDENTITY  --Output: 39 (last)

-- Get the last identity value generated in the current scope  
SELECT SCOPE_IDENTITY()  --Output: 39 (last)

-- Get the current identity value for a specific table  
SELECT IDENT_CURRENT('dbo.tblEmployee3') 

-- Create a new table with IDENTITY and PRIMARY KEY  
CREATE TABLE tblEmployee4
(  
    EmployeeNumber INT CONSTRAINT PK_tblEmployee4  PRIMARY KEY IDENTITY(1,1),  
    EmployeeName NVARCHAR(20)  
)  

-- Insert two rows into the new table  
INSERT INTO tblEmployee4
VALUES ('My Name'),  
       ('My Name')  




----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FOREIGN

BEGIN TRAN  

-- Make EmployeeNumber null in  TRANSACTIONS  
ALTER TABLE tblTransaction  
ALTER COLUMN EmployeeNumber INT NULL  

-- Set default EmployeeNumber to 124 in TRANSACTIONS  
ALTER TABLE tblTransaction  
ADD CONSTRAINT DF_tblTransaction DEFAULT 124 FOR EmployeeNumber  

-- Add FOREIGN KEY to TRANSACTIONS (no check, update cascade, delete set default)  
ALTER TABLE tblTransaction WITH NOCHECK  
ADD CONSTRAINT FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber)  
REFERENCES tblEmployee(EmployeeNumber)  
ON UPDATE CASCADE  
ON DELETE SET DEFAULT  

-- DELETE employee 123; related TRANSACTIONS will use default (124)  
DELETE tblEmployee WHERE EmployeeNumber = 123  

-- View TRANSACTIONS with specific amounts  
SELECT E.EmployeeNumber, T.*  
FROM tblEmployee AS E  
RIGHT JOIN tblTransaction AS T  
ON E.EmployeeNumber = T.EmployeeNumber  
WHERE T.Amount IN (-179.47, 786.22, -967.36, 957.03)  

ROLLBACK TRAN  
