/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses and statements Using AdventureWorks2022 Database*/

USE [AdventureWorks2022]
GO

SET ANSI_PADDING ON
GO

/****** Object:  Index [idx_FirstName]    Script Date: 2025/03/12 15:05:36 ******/
CREATE NONCLUSTERED INDEX [idx_FirstName] ON [Person].[Person]
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO



--- Create Script Index on firstname and lastname
USE [AdventureWorks2022]

GO

SET ANSI_PADDING ON


GO

/****** Object:  Index [idx_FirstName_LastName]    Script Date: 2025/03/12 15:12:23 ******/
CREATE NONCLUSTERED INDEX [idx_FirstName_LastName] ON [Person].[Person]
(
	[FirstName] ASC
)
INCLUDE([LastName]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


--Dropping Index
USE [AdventureWorks2022]
GO

/****** Object:  Index [idx_FirstName_LastName]    Script Date: 2025/03/12 15:14:49 ******/
DROP INDEX [idx_FirstName_LastName] ON [Person].[Person]
GO


---Looking at FRAGMENTATION
-- DMS for checking index fragmentation

SELECT S.name as 'Schema',
T.name as 'Table',
I.name as 'Index',
DDIPS.avg_fragmentation_in_percent,
DDIPS.page_count
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS DDIPS
INNER JOIN sys.tables T on T.object_id = DDIPS.object_id
INNER JOIN sys.schemas S on T.schema_id = S.schema_id
INNER JOIN sys.indexes I ON I.object_id = DDIPS.object_id
AND DDIPS.index_id = I.index_id
WHERE DDIPS.database_id = DB_ID()
and I.name is not null
AND DDIPS.avg_fragmentation_in_percent > 0
ORDER BY DDIPS.avg_fragmentation_in_percent desc

--Rebuilding Index because fragmentation is 50 %
USE [AdventureWorks2022]
GO
ALTER INDEX [AK_Product_ProductNumber] ON [Production].[Product] REBUILD PARTITION = ALL WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

