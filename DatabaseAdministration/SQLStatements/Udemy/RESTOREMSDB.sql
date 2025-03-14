/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements to Explore SSMS and Different Databases*/

--RESTORE BACKUP OF DATABASE

-- SELECT the version of the SQL Server
SELECT @@VERSION 

-- RESTORE the header of the backup file (this doesn't restore the full database, just shows header info)
RESTORE HEADERONLY
FROM DISK = N'C:\SQL_BACKUPS\msdb_beforedelete.Bak'
GO

-- RESTORE the header of the backup file again to view header info
RESTORE HEADERONLY
FROM DISK = N'C:\SQL_BACKUPS\msdb_beforedelete.Bak'
GO
