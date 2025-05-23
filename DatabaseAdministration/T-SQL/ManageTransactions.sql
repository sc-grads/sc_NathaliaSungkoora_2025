/*MANAGE TRANSACTIONS*/


--Examples of IMPLICIT TRANSACTIONS
--TRANSACTION START AND TRANASACTION END
SELECT * 
FROM [dbo].[tblEmployee]


UPDATE [dbo].[tblEmployee]
SET EmployeeNumber = 122
WHERE EmployeeNumber = 123

--------------------------------------------------------------------------------------------------------------------------
--EXPLICIT TRANSACTIONS

BEGIN TRANSACTION
SELECT * 
FROM [dbo].[tblEmployee]


UPDATE [dbo].[tblEmployee]
SET EmployeeNumber = 122
WHERE EmployeeNumber = 123

COMMIT TRANSACTION --Want it to succeed and be committed (SAVES CHANGES)

--WANT TRANSACTION TO BE ROLLED BACK
BEGIN TRANSACTION
SELECT * 
FROM [dbo].[tblEmployee]


UPDATE [dbo].[tblEmployee]
SET EmployeeNumber = 122
WHERE EmployeeNumber = 123

ROLLBACK TRANSACTION --IF FAILS want it to be rolled back (CANCELS CHANGES)


--------------------------------------------------------------------------------------------------------------------------
--MARK TRANSACTIONS

BEGIN TRANSACTION MyTransaction WITH MARK 'MyTransaction'
SELECT * 
FROM [dbo].[tblEmployee]


UPDATE [dbo].[tblEmployee]
SET EmployeeNumber = 122
WHERE EmployeeNumber = 123

ROLLBACK TRANSACTION


--------------------------------------------------------------------------------------------------------------------------
--TRANCOUNT

-- Update the EmployeeNumber from 122 to 123
UPDATE [dbo].[tblEmployee] 
SET EmployeeNumber = 123 
WHERE EmployeeNumber = 122;


SELECT * FROM [dbo].[tblEmployee];

--USE TRANCOUNT
-- Check current transaction count (should be 0)
SELECT @@TRANCOUNT; -- 0

-- Start outer transaction
BEGIN TRAN;
    SELECT @@TRANCOUNT; -- 1 (outer transaction started)

    -- Start INNER transaction (nested)
    BEGIN TRAN;
   
        UPDATE [dbo].[tblEmployee] 
        SET EmployeeNumber = 122 
        WHERE EmployeeNumber = 123;
        
        SELECT @@TRANCOUNT; -- 2 (nested transaction started)
    COMMIT TRAN; 

    SELECT @@TRANCOUNT; -- 1 (outer transaction still open)

-- If there's still an open transaction, commit it
IF @@TRANCOUNT > 0 
    COMMIT TRAN;

-- Final check to ensure all transactions are closed
SELECT @@TRANCOUNT; -- 0

SELECT * FROM  [dbo].[tblEmployee]
ROLLBACK TRAN

--------------------------------------------------------------------------------------------------------------------------
--WAIR FOR STATEMENT

BEGIN TRANSACTION 


UPDATE [dbo].[tblEmployee]
SET EmployeeNumber = 122
WHERE EmployeeNumber = 123

WAITFOR DELAY '00:00:10'

ROLLBACK TRANSACTION

--------------------------------------------------------------------------------------------------------------------------
--ISOLATION LEVELS IN PRACTICE
-- Transaction 1: Modifies data without delays
BEGIN TRANSACTION

UPDATE [dbo].[tblEmployee] 
SET EmployeeNumber = 122 
WHERE EmployeeNumber = 123;

COMMIT TRANSACTION

UPDATE [dbo].[tblEmployee] 
SET EmployeeNumber = 123 
WHERE EmployeeNumber = 122;

INSERT INTO [dbo].[tblEmployee]
    ([EmployeeNumber], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], 
     [EmployeeGovernmentID], [DateOfBirth], [Department])
VALUES 
    (122, 'H', 'I', 'T', 'H', '2010-01-01', 'H');


DELETE FROM [dbo].[tblEmployee] 
WHERE EmployeeNumber = 122;


-- Transaction 2: Reads data with a delay to simulate concurrency
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION

-- Read all employees (this will wait 20 seconds before the next read)
SELECT * FROM [dbo].[tblEmployee];
WAITFOR DELAY '00:00:20';

SELECT * FROM [dbo].[tblEmployee];
COMMIT TRANSACTION;
