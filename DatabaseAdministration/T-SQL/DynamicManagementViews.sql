/*DMV-> DYNAMIC MANAGEMNT VIEWS*/

--sys.dm_db_index_usage_stats
-----------------------------
SELECT *
FROM sys.dm_db_index_usage_stats

------------------------------
-- SHOW INDEX USAGE STATS
SELECT DB_NAME(database_id) AS [Database Name],
       OBJECT_NAME(ddius.object_id) AS [Table Name],
       i.name AS [Index Name],
       ddius.*
FROM sys.dm_db_index_usage_stats AS ddius
JOIN sys.indexes AS i 
  ON ddius.object_id = i.object_id AND ddius.index_id = i.index_id
WHERE database_id = DB_ID();
----------------------------------------------------------------------------------------------------------------------------------

--sys.dm_db_index_physical_stats
-- SHOW PHYSICAL STATS FOR INDEXES ON tblEmployee
SELECT * 
FROM sys.dm_db_index_physical_stats(
    DB_ID(N'70-461S7'), 
    OBJECT_ID(N'dbo.tblEmployee'), 
    NULL, NULL, 'DETAILED');


----------------------------------------------------------------------------------------------------------------------------------

--sys.dm_db_missing_index_details

-- CREATE LARGE TEST TABLE TO GENERATE MISSING INDEXES
SELECT T.*
INTO dbo.tblTransactionBigger
FROM [dbo].[tblTransaction] AS T
CROSS JOIN [dbo].[tblTransaction] AS T2;

-- QUERY TO TRIGGER MISSING INDEX DETECTION
SELECT * FROM dbo.tblTransactionBigger WHERE [EmployeeNumber] = 127;

-- SHOW MISSING INDEX DETAILS
SELECT * FROM sys.dm_db_missing_index_details
WHERE database_id = DB_ID();

-- SHOW MISSING INDEX COLUMNS AND USAGE
SELECT mig.*, statement AS table_name, column_id, column_name, column_usage
FROM sys.dm_db_missing_index_details AS mid
CROSS APPLY sys.dm_db_missing_index_columns(mid.index_handle)
INNER JOIN sys.dm_db_missing_index_groups AS mig 
  ON mig.index_handle = mid.index_handle
WHERE database_id = DB_ID()
ORDER BY column_id;

-- DROP TEST TABLE
DROP TABLE dbo.tblTransactionBigger;

