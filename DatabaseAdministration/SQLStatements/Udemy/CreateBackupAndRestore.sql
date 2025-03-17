/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements Backups and Restore*/


USE [AdventureWorks2022]
GO



-- CREATE TABLE statement to create a new table called SQLBackupRestoreTest with columns: ID, loginname, and logindate
CREATE TABLE SQLBackupRestoreTest (
    ID INT NOT NULL PRIMARY KEY,    -- ID is an INT and serves as the PRIMARY KEY
    loginname VARCHAR(100) NOT NULL, -- loginname is a VARCHAR field with a maximum length of 100
    logindate DATETIME NOT NULL DEFAULT getdate() -- logindate is a DATETIME field with the default value as the current date and time
)
GO

-- Select all rows from the SQLBackupRestoreTest table to verify initial data
SELECT * FROM SQLBackupRestoreTest 


-- Insert new rows into SQLBackupRestoreTest table
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (1, 'test1')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (2, 'test2')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (3, 'test3')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (4, 'test4')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (5, 'test5')

--Output=Five rows
--Create FULL BACKUP:
BACKUP DATABASE [AdventureWorks2022] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_FULLBackup.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


-- FULL BACKUP: Insert 5 rows as a baseline for backup
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (6, 'test6')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (7, 'test7')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (8, 'test8')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (9, 'test9')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (10, 'test10')
--Output= 10 rows

--Create DIFF BACKUP
BACKUP DATABASE [AdventureWorks2022] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_diff_1.diff' 
WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


-- DIFF BACKUP: Insert additional 5 rows for differential backup
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (11, 'test11')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (12, 'test12')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (13, 'test13')

--Output=13 rows

--Create TRANSACTION LOG BACKUP
BACKUP LOG [AdventureWorks2022] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_tran_1.tm' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


-- TRANSACTION LOG BACKUP: Insert rows for transaction log backup (up to 13 rows)
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (14, 'test14')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (15, 'test15')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (16, 'test16')
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (17, 'test17')
--Output=17 rows

-- Create Transaction Log Backup 2
BACKUP LOG [AdventureWorks2022] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_tran_2.tm' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO



-- FULL AND DIFF BACKUP (previous rows) 
-- TRANSACTION LOG BACKUP: Insert rows for second transaction log backup (up to 17 rows)

-- Insert rows to simulate specific timestamps for transaction logs

INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (114, 'test14')	--Mar 17 2025 10:43AM
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (115, 'test15')	-- Mar 17 2025 10:44AM
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (116, 'test16')	-- Mar 17 2025 10:45AM
INSERT INTO SQLBackupRestoreTest (ID, loginname) VALUES (117, 'test17')	-- Mar 17 2025 10:46AM



-- Record current date and time (for context)  
PRINT GETDATE() -- Expected date/time
-- Mar 17 2025 10:40AM

--Create Transaction log 3
BACKUP LOG [AdventureWorks2022] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_tran_3.tm' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO




-- FULL RESTORE: RESTORE the AdventureWorks2016 database from a full backup with NORECOVERY for future backups
USE [master]
RESTORE DATABASE [AdventureWorks2022] 
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_FULLBackup.bak' 
WITH FILE = 1, NORECOVERY, NOUNLOAD, STATS = 5
GO

-- RESTORE a DIFF backup from a differential backup file (restores changes since full backup)
USE [master]
RESTORE DATABASE [AdventureWorks2022] 
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_diff_1.diff' 
WITH FILE = 1, NORECOVERY, NOUNLOAD, STATS = 5
GO

-- RESTORE TRANSACTION LOG: Restore changes from the transaction log backup file
RESTORE LOG [AdventureWorks2022] 
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_tran_3.tm' 
WITH FILE = 1, NORECOVERY, NOUNLOAD, STATS = 10
GO

-- FINAL RESTORE: Commit the database recovery process (restores the database fully)
RESTORE DATABASE [AdventureWorks2022_RestoreTest] WITH RECOVERY
GO

-- RESTORE DATABASE for AdventureWorks2022_RestoreTest from full backup with file move operations 
USE [master]
RESTORE DATABASE [AdventureWorks2022_RestoreTest] 
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_FULLBackup.bak'  
WITH FILE = 3,  
MOVE N'AdventureWorks2022_Data' TO N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_RestoreTest_Data.mdf',  
MOVE N'AdventureWorks2022_Log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_RestoreTest_Log.ldf',  
NORECOVERY, NOUNLOAD, STATS = 5

-- RESTORE a DIFF backup for the new restored database
RESTORE DATABASE [AdventureWorks2022_RestoreTest] 
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_diff_1.diff' 
WITH FILE = 3, NORECOVERY, NOUNLOAD, STATS = 5
GO

-- RESTORE LOG to a specific point in time (Stopat condition)
RESTORE LOG [AdventureWorks2016_RestoreTest] 
FROM DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_tran_final.tm' 
WITH FILE = 1, NOUNLOAD, STATS = 10, STOPAT = N'2025-03-17T13:26:11'
GO
