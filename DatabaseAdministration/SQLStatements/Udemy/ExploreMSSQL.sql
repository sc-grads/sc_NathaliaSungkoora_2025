/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements to Explore MSSQL */


-- 1. CREATE DATABASE: Establishes a new database named 'dbtest'
CREATE DATABASE dbtest;

--Use the correct Database
USE [dbtest]
GO

-- 2. ALTER DATABASE: Modifies the database settings; here, enabling mixed page allocation allows SQL Server to use a mix of uniform and mixed extents for storing data
ALTER DATABASE dbtest SET MIXED_PAGE_ALLOCATION ON;

-- 3. CREATE TABLE: Defines a new table 'heaptable1' with two columns:
-- Heap table does not have any index
CREATE TABLE heaptable1 (
    c1 INT,
    c2 VARCHAR(8000)
);

-- 4. INSERT INTO: Adds a new record to 'heaptable1' with:
--    - 'c1' set to 1
--    - 'c2' containing a string of 1000 'a' characters
INSERT INTO heaptable1 VALUES (
    1,
    REPLICATE('a', 1000)
);

-- 5. SELECT: Retrieves all records from 'heaptable1' to view the data
SELECT * FROM heaptable1;

-- 6. DROP TABLE: Removes the 'heaptable1' table and its data from the database
DROP TABLE heaptable1;

-- 7. SELECT with CROSS APPLY: Retrieves detailed information about the physical storage of 'heaptable1':
--    - 'c1' and 'c2' data
--    - 'file_id' and 'page_id' indicating where the data is stored
--    - 'is_mixed_page_allocation' showing if mixed page allocation is used

---Modified Query (Success):
SELECT
    ht1.c1,  -- Select column c1 from heaptable1
    ht1.c2,  -- Select column c2 from heaptable1
    p.file_id,  -- Get file_id from PhysLocCracker (physical location of rows)
    p.page_id,  -- Get page_id from PhysLocCracker
    ips.page_count AS total_pages,  -- Get total pages for the table from index stats
    ips.avg_fragmentation_in_percent  -- Get fragmentation percentage for the index
FROM
    heaptable1 AS ht1  -- From the heaptable1 table
CROSS APPLY
    sys.fn_PhysLocCracker(ht1.%%physloc%%) AS p  -- Break down the physical location of each row
INNER JOIN
    sys.dm_db_index_physical_stats(DB_ID(), OBJECT_ID('dbo.heaptable1'), NULL, NULL, 'DETAILED') AS ips  -- Get detailed index stats for the table
    ON ips.object_id = OBJECT_ID('dbo.heaptable1');  -- Join on object_id of the table to match index stats

	--OutPut file_id=1, page_id=264

	--Checking version 
	SELECT @@VERSION;



-- 8. DBCC TRACEON: Activates trace flag 3604, which directs DBCC (Database Consistency Check) output to the client; the '-1' applies it globally
DBCC TRACEON(3604, -1);

-- 9. DBCC PAGE: Displays detailed information about the first page (file_id = 1, page_id = 1) in the 'dbtest' database, with a detail level of 3
DBCC PAGE(dbtest, 1, 1, 3);


------------------------------------------------------------------------------------------------

--Troubleshooting

-- Check if the 'sys.dm_db_database_page_allocation' view exists
SELECT *
FROM sys.views
WHERE name = 'dm_db_database_page_allocation';

-- Check if the user has permission to select from the view
SELECT HAS_PERMS_BY_NAME('sys.dm_db_database_page_allocation', 'OBJECT', 'SELECT');

-- Switch to 'master' database to run system-related queries
USE master;

-- Check the compatibility level to ensure it supports SQL Server features
SELECT compatibility_level
FROM sys.databases
WHERE name = 'dbtest';

-- Set compatibility level to 110 (SQL Server 2012) if it's lower
ALTER DATABASE dbtest
SET COMPATIBILITY_LEVEL = 110;

-- Main query to get page allocation details for 'heaptable1'

---Modified Query (Success):
SELECT
    ht1.c1,  -- Select column c1 from heaptable1
    ht1.c2,  -- Select column c2 from heaptable1
    p.file_id,  -- Get file_id from PhysLocCracker (physical location of rows)
    p.page_id,  -- Get page_id from PhysLocCracker
    ips.page_count AS total_pages,  -- Get total pages for the table from index stats
    ips.avg_fragmentation_in_percent  -- Get fragmentation percentage for the index
FROM
    heaptable1 AS ht1  -- From the heaptable1 table
CROSS APPLY
    sys.fn_PhysLocCracker(ht1.%%physloc%%) AS p  -- Break down the physical location of each row
INNER JOIN
    sys.dm_db_index_physical_stats(DB_ID(), OBJECT_ID('dbo.heaptable1'), NULL, NULL, 'DETAILED') AS ips  -- Get detailed index stats for the table
    ON ips.object_id = OBJECT_ID('dbo.heaptable1');  -- Join on object_id of the table to match index stats


------------------------------------------------------------------------------------
