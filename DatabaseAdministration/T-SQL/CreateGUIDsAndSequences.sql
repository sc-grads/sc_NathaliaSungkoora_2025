/*GUIDs AND SEQUENCES*/
USE [70-461(2)];



--PROBLEMS with IDENTITY

BEGIN TRAN

INSERT INTO tblEmployee2 -- Insert a row into tblEmployee2
VALUES ('New Name')
SELECT * FROM tblEmployee2 -- Show current contents

ROLLBACK TRAN

-- Reset identity counter
TRUNCATE TABLE tblEmployee2

-------------------------------------------------------------------------------------------
--GUIDs (Globally Unique Identifier)

-- Create a GUID using NEWID
DECLARE @newvalue AS UNIQUEIDENTIFIER
SET @newvalue = NEWID()
SELECT @newvalue AS TheNewID
GO --Output example: A6FGOK96-85A3-583E-6R25-6908F3LLF6L9 
	--Gives random number each time it is run

-- Generate a repeatable random number using a seed
DECLARE @randomnumbergenerator INT = DATEPART(MILLISECOND, SYSDATETIME()) 
                                    + 1000 * (DATEPART(SECOND, SYSDATETIME()) 
                                    + 60 * (DATEPART(MINUTE, SYSDATETIME()) 
                                    + 60 * DATEPART(HOUR, SYSDATETIME())))
SELECT RAND(@randomnumbergenerator) AS RandomNumber
--Output example: Random Number generated each time: 0.0372054912977566

-- Create table with NEWID default and insert data
BEGIN TRAN
CREATE TABLE tblEmployee4
(
    UniqueID UNIQUEIDENTIFIER CONSTRAINT df_tblEmployee4_UniqueID DEFAULT NEWID(),
    EmployeeNumber INT CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE
)

INSERT INTO tblEmployee4 (EmployeeNumber)
VALUES (1), (2), (3)

SELECT * FROM tblEmployee4
ROLLBACK TRAN
GO --Output: Random and changes each time it is RUN

-- Create a sequential GUID using NEWSEQUENTIALID
DECLARE @newvalue AS UNIQUEIDENTIFIER
SET @newvalue = NEWSEQUENTIALID()
SELECT @newvalue AS TheNewID
GO

-- Create table with NEWSEQUENTIALID default and insert data
BEGIN TRAN
CREATE TABLE tblEmployee4
(
    UniqueID UNIQUEIDENTIFIER CONSTRAINT df_tblEmployee4_UniqueID DEFAULT NEWSEQUENTIALID(),
    EmployeeNumber INT CONSTRAINT uq_tblEmployee4_EmployeeNumber UNIQUE
)

INSERT INTO tblEmployee4 (EmployeeNumber)
VALUES (1), (2), (3)

SELECT * FROM tblEmployee4
ROLLBACK TRAN --Output: IN ORDER

-------------------------------------------------------------------------------------------
--SEQUENCES

BEGIN TRAN

-- Create a sequence named newSeq starting at 1, incrementing by 1, caching 50 values
CREATE SEQUENCE newSeq AS BIGINT
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 999999
CYCLE --GO BACK 
CACHE 50

-- Create a second sequence named secondSeq of type INT
CREATE SEQUENCE secondSeq AS INT

-- List all sequences in the database
SELECT * FROM sys.sequences

ROLLBACK TRAN


-------------------------------------------------------------------------------------------
--USING SEQUENCES

BEGIN TRAN

-- Create sequence newSeq starting at 1, increment by 1, cache 50 values
CREATE SEQUENCE newSeq AS BIGINT
START WITH 1
INCREMENT BY 1
MINVALUE 1
CACHE 50

-- Get next value from sequence
SELECT NEXT VALUE FOR newSeq AS NextValue;

-- Example of using sequence in a SELECT (commented out)
-- SELECT *, NEXT VALUE FOR newSeq OVER (ORDER BY DateOfTransaction) AS NextNumber FROM tblTransaction

ROLLBACK TRAN

-- Create sequence again
CREATE SEQUENCE newSeq AS BIGINT
START WITH 1
INCREMENT BY 1
MINVALUE 1
--MAXVALUE 999999
--CYCLE
CACHE 50

-- Add column NextNumber with default value from sequence
ALTER TABLE tblTransaction
ADD NextNumber INT CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq

-- Drop default constraint and column NextNumber
ALTER TABLE tblTransaction
DROP CONSTRAINT DF_Transaction

ALTER TABLE tblTransaction
DROP COLUMN NextNumber

-- Add NextNumber column and default constraint again
ALTER TABLE tblTransaction
ADD NextNumber INT

ALTER TABLE tblTransaction
ADD CONSTRAINT DF_Transaction DEFAULT NEXT VALUE FOR newSeq FOR NextNumber

BEGIN TRAN
-- Show all records
SELECT * FROM tblTransaction

-- Insert new record (NextNumber gets default value from sequence)
INSERT INTO tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES (1, '2017-01-01', 123)

-- Show records for employee 123
SELECT * FROM tblTransaction WHERE EmployeeNumber = 123;



-- Update null NextNumber values with next sequence values
UPDATE tblTransaction
SET NextNumber = NEXT VALUE FOR newSeq
WHERE NextNumber IS NULL

-- Show all records again
SELECT * FROM tblTransaction

ROLLBACK TRAN

-- Reset sequence to start at 1 again
ALTER SEQUENCE newSeq
RESTART WITH 1

-- Clean up: drop default, column, and sequence
ALTER TABLE tblTransaction
DROP CONSTRAINT DF_Transaction

ALTER TABLE tblTransaction
DROP COLUMN NextNumber

DROP SEQUENCE newSeq
