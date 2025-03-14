/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements to Different Databases*/
	
	
USE AdventureWorks2022
GO  
	--TempDB
-- Create a temporary table named #myTempTableCREATE TABLE #myTempTable 
CREATE TABLE #myTempTable 
(ID INT IDENTITY (1,1),     -- Create a column named ID of type INT (integer)
						 -- IDENTITY(1,1) means the ID will start at 1 and increase by 1 for each new row automatically
Stuffing VARCHAR (100));  -- Create a column named Stuffing of type VARCHAR (text) that can hold up to 100 characters
GO

-- Drop (delete) the temporary table named #myTempTable
DROP TABLE #myTempTable


--Moving TempDB
-- SELECT statement to retrieve information about Tempdb database files
SELECT NAME, PHYSICAL_NAME AS CurrentLocation		-- Selects the name of the file and its current location
FROM SYS.MASTER_FILES								-- From the system view that contains details about all database files
WHERE DATABASE_ID = DB_ID(N'Tempdb');				-- Filter to only show files for the Tempdb database
GO 


USE MASTER;  -- Use the 'master' database for the operation
GO

-- Modify the file location for tempdb data file 'tempdev'
ALTER DATABASE tempdb 
MODIFY FILE (NAME = tempdev, FILENAME = 'C:\SQL_TEMPDBNew\tempdb.ndf');
GO

--EXAMPLE of SYNTAX for moving TempDB files to new folder named TEMPDBNEW
-- Modify the file location for tempdb secondary data file 'temp2'
ALTER DATABASE tempdb 
MODIFY FILE (NAME = temp2, FILENAME = 'C:\SQL_TEMPDBNew\tempdb_mssql_2.ndf');
GO

-- Modify the file location for tempdb secondary data file 'tempd3'
ALTER DATABASE tempdb 
MODIFY FILE (NAME = tempd3, FILENAME = 'C:\SQL_TEMPDBNew\tempdb3.ndf');
GO

-- Modify the file location for tempdb secondary data file 'temp4'
ALTER DATABASE tempdb 
MODIFY FILE (NAME = temp4, FILENAME = 'C:\SQL_TEMPDBNew\tempdb4.ndf');
GO

-- Modify the file location for tempdb log file 'templog'
ALTER DATABASE tempdb 
MODIFY FILE (NAME = templog, FILENAME = 'C:\SQL_TEMPDBNew\templog.ldf');
GO
