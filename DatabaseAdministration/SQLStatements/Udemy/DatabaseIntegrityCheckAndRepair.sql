/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements Creating And Managing Database Users And Roles*/

-- Simulating Data Corruption and Performing Integrity Checks in the CorruptionTest Database
-- Use the master database to execute the following commands
USE master;
GO

-- Drop the CorruptionTest database if it already exists
DROP DATABASE IF EXISTS [CorruptionTest];
GO

-- Create a new database named CorruptionTest
CREATE DATABASE [CorruptionTest];
GO

-- Set the recovery model of the CorruptionTest database to FULL
ALTER DATABASE [CorruptionTest] SET RECOVERY FULL;
GO

-- Set the page verification to CHECKSUM for the CorruptionTest database
ALTER DATABASE [CorruptionTest] SET PAGE_VERIFY CHECKSUM;
GO

-- Create a table called 'mssqltips_online' in the CorruptionTest database
-- with an indexed column called 'increment'
CREATE TABLE [CorruptionTest].[dbo].[mssqltips_online]
(
    increment INT, 
    randomGUID uniqueidentifier, 
    randomValue INT, 
    BigCol CHAR(2000) DEFAULT 'a',
    INDEX CIX_MSSQLTips_increment1 UNIQUE CLUSTERED (increment)
);
GO

-- Create another table called 'mssqltips_corrupt' in the CorruptionTest database
-- with a similar structure to 'mssqltips_online'
CREATE TABLE [CorruptionTest].[dbo].[mssqltips_corrupt]
(
    increment INT, 
    randomGUID uniqueidentifier, 
    randomValue INT, 
    BigCol CHAR(2000) DEFAULT 'a',
    INDEX CIX_MSSQLTips_increment1 UNIQUE CLUSTERED (increment)
);
GO
-------------------------------------------------------------------------------------------------------------------------
-- Disable message output for each statement
SET NOCOUNT ON;

-- Declare a counter variable and start a transaction
DECLARE @counter INT = 1;
BEGIN TRAN

   -- Loop to insert 250,000 rows into both tables
   WHILE @counter <= 250000
   BEGIN
      -- Insert data into mssqltips_online table
      INSERT INTO CorruptionTest.dbo.mssqltips_online (increment, randomGUID, randomValue) 
      VALUES (@counter, NEWID(), ABS(CHECKSUM(NEWID())) % 140000000);

      -- Insert data into mssqltips_corrupt table
      INSERT INTO CorruptionTest.dbo.mssqltips_corrupt (increment, randomGUID, randomValue)
      VALUES (@counter, NEWID(), ABS(CHECKSUM(NEWID())) % 140000000);

      -- Increment the counter
      SET @counter += 1;
   END;

-- Commit the transaction
COMMIT TRAN;
GO
--------------------------------------------------------------------------------------------------------------------------------------
-- Check the integrity of the CorruptionTest database
DBCC CHECKDB('CorruptionTest') WITH NO_INFOMSGS;
GO

-- Perform a full database backup with compression
BACKUP DATABASE [CorruptionTest] TO DISK = 'C:\SQL_BACKUPS\CorruptionTest_Full.BAK' WITH COMPRESSION;
GO

-- Select all data from the mssqltips table (if it exists) and the mssqltips_online table
SELECT COUNT(1) FROM CorruptionTest.[dbo].[mssqltips_corrupt];
SELECT COUNT(1) FROM CorruptionTest.[dbo].[mssqltips_online];
---------------------------------------------------

-- Retrieve physical location information for the first 10 rows in mssqltips_corrupt table
SELECT TOP 10
   sys.fn_PhysLocFormatter(%%physloc%%) AS PageId,
   *
FROM [CorruptionTest].[dbo].[mssqltips_corrupt];
GO

-- Enable trace flag 3604 to show DBCC output to the client
DBCC TRACEON (3604);
GO

-- Display the page information for a specific page (page 354, file 1, slot 3)
DBCC PAGE ('CorruptionTest', 1, 354, 3);
GO

-- Convert the value 95868367 to VARBINARY format
SELECT CONVERT(VARBINARY(8), 95868367);
GO

----------------------------------------------

-- Display the corresponding VARBINARY for the value 95868367
-- The expected output is 0x05B6D5CF
0x05B6D5CF;

-- Switch to the master database to execute administrative commands
USE master;
GO  

-- Set the CorruptionTest database to SINGLE_USER mode and immediately roll back any uncommitted transactions
ALTER DATABASE [CorruptionTest] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- Write to the specified page (file 1, page 354, slot 2151) to potentially corrupt it
DBCC WRITEPAGE ('CorruptionTest', 1, 354, 2151, 4, 0xCFD5B605, 1);
GO

-- Set the CorruptionTest database back to MULTI_USER mode
ALTER DATABASE [CorruptionTest] SET MULTI_USER;
GO

-- Retrieve the physical location of the first 10 rows from mssqltips table (after potential corruption)
SELECT TOP 10
   sys.fn_PhysLocFormatter(%%physloc%%) AS PageId,
   *
FROM [CorruptionTest].[dbo].[mssqltips];
GO

-- Display the page information for a specific page (page 354, file 1, slot 3) again
DBCC PAGE ('CorruptionTest', 1, 354, 3);
GO
