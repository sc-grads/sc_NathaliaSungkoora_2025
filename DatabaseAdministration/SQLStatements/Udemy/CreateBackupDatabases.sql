/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements Backups*/


--BackUp Databases

BACKUP DATABASE [AdventureWorks2022] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_17032025' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--Filegroup BackUp
BACKUP DATABASE [FileGroupsDemoDatabase] FILEGROUP = N'FG_2019',
FILEGROUP = N'FG_2020' 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\FileGroupsDemoDatabase.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'FileGroupsDemoDatabase-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--Diffrential Backup
BACKUP DATABASE [AdventureWorks2022] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_17032025_DifferentialBackup' 
WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--Transaction log Backup
BACKUP LOG [AdventureWorks2022] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_17032025_01TransactionsLogBackup' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', 
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
