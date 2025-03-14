/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different Queries and Statements to Explore MSSQL */


-- 1. CREATE DATABASE: Establishes a new database named 'dbtest'
CREATE DATABASE dbtest;

-- 2. ALTER DATABASE: Modifies the database settings; here, enabling mixed page allocation allows SQL Server to use a mix of uniform and mixed extents for storing data
ALTER DATABASE dbtest SET MIXED_PAGE_ALLOCATION ON;

-- 3. CREATE TABLE: Defines a new table 'heaptable1' with two columns:
--    - 'c1' as an integer
--    - 'c2' as a variable-length string capable of holding up to 8000 characters
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
SELECT
    ht1.c1,
    ht1.c2,
    p.file_id,
    p.page_id,
    dddpa.is_mixed_page_allocation
FROM
    heaptable1 AS ht1
CROSS APPLY
    sys.fn_PhysLocCracker(%%physloc%%) AS p
INNER JOIN
    sys.dm_db_database_page_allocation(
        DB_ID(),
        OBJECT_ID('dbo.heaptable1'),
        NULL,
        NULL,
        'detailed'
    ) AS dddpa
ON
    p.file_id = dddpa.allocated_page_file_id
    AND p.page_id = dddpa.allocated_page_page_id;

-- 8. DBCC TRACEON: Activates trace flag 3604, which directs DBCC (Database Console Commands) output to the client; the '-1' applies it globally
DBCC TRACEON(3604, -1);

-- 9. DBCC PAGE: Displays detailed information about the first page (file_id = 1, page_id = 1) in the 'dbtest' database, with a detail level of 3
DBCC PAGE(dbtest, 1, 1, 3);
