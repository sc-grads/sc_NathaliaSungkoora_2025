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
