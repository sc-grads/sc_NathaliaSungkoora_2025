/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements on Database Check and Repair Operations*/


-- Database Integrity Check and Repair Operations for AdventureWorks2022

-- Perform database consistency check on the AdventureWorks2022 database
DBCC CHECKDB ('ADVENTUREWORKS2022');  

-- Perform database consistency check on the AdventureWorks2022 database with no informational messages
DBCC CHECKDB ('ADVENTUREWORKS2022') WITH NO_INFOMSGS;

-- Set the AdventureWorks2022 database to single-user mode and roll back any uncommitted transactions immediately
ALTER DATABASE ADVENTUREWORKS2022 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- Perform a repair operation on the AdventureWorks2022 database allowing data loss
DBCC CHECKDB ('ADVENTUREWORKS2022', REPAIR_ALLOW_DATA_LOSS);
GO

-- Set the AdventureWorks2022 database back to multi-user mode and roll back any uncommitted transactions immediately
ALTER DATABASE ADVENTUREWORKS2022 SET MULTI_USER WITH ROLLBACK IMMEDIATE;
GO
