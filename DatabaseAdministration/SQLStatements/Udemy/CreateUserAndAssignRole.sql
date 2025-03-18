/*Udemy Course_ Microsoft SQL Server Database Administration Course
Practicing different Queries and Statements Creating And Managing Database Users And Roles */


-- Set the context to the AdventureWorks2022 database
USE [AdventureWorks2022]
GO

-- Create a new user with the specified login and set the default schema to dbo
CREATE USER [LAPTOP-JUKB3QVS\winuser01] WITH DEFAULT_SCHEMA=[dbo]
GO
----------------------------------------------------------------------------------------------
-- Set the context to the AdventureWorks2022 database again (optional if already in context)
USE [AdventureWorks2022]
GO

-- Add the newly created user to the db_owner role, granting them full database permissions
ALTER ROLE [db_owner] ADD MEMBER [LAPTOP-JUKB3QVS\winuser01]
GO
---------------------------------------------------------------------------------------------------

-- Set the context to the AdventureWorks2022 database
USE [AdventureWorks2022]
GO

-- Grant ALTER permission on the Sales schema to winuser01
GRANT ALTER ON SCHEMA::Sales TO [LAPTOP-JUKB3QVS\winuser01];

-- SELECT User Permissions
-- Retrieves permission details for specific principals (users) in the system.

SELECT pe.STATE_DESC, pe.PERMISSION_NAME  -- Check server-level permissions for the user
FROM SYS.SERVER_PRINCIPALS pr
INNER JOIN [sys].[server_permissions] pe
   ON pr.PRINCIPAL_ID = pe.GRANTEE_PRINCIPAL_ID
WHERE pr.SID = SUSER_SID('LAPTOP-JUKB3QVS\winuser01');

------------------------------------------------------------------------------------------------
-- Troubleshooting
GRANT CONNECT TO [LAPTOP-JUKB3QVS\winuser01];

-- Check database-level permissions for the user
SELECT dp.STATE_DESC, dp.PERMISSION_NAME
FROM SYS.DATABASE_PRINCIPALS pr
INNER JOIN sys.database_permissions dp
    ON pr.PRINCIPAL_ID = dp.GRANTEE_PRINCIPAL_ID
WHERE pr.SID = SUSER_SID('LAPTOP-JUKB3QVS\winuser01');
------------------------------------------------------------------------------------------------------------

-- Set the context to the AdventureWorks2022 database
USE [AdventureWorks2022]
GO

-- Create a new database user (sqluser01) for the existing login (sqluser01)
-- This links the login at the server level to the database user in the AdventureWorks2022 database
CREATE USER [sqluser01] FOR LOGIN [sqluser01]
GO

-- Check database-level permissions for the sqluser01 (should only have CONNECT permission)
SELECT dp.STATE_DESC, dp.PERMISSION_NAME
FROM SYS.DATABASE_PRINCIPALS pr
INNER JOIN sys.database_permissions dp
    ON pr.PRINCIPAL_ID = dp.GRANTEE_PRINCIPAL_ID
WHERE pr.SID = SUSER_SID('sqluser01');

-- Check database-level permissions for the LAPTOP-JUKB3QVS\winuser01(should only have CONNECT permission)
SELECT dp.STATE_DESC, dp.PERMISSION_NAME
FROM SYS.DATABASE_PRINCIPALS pr
INNER JOIN sys.database_permissions dp
    ON pr.PRINCIPAL_ID = dp.GRANTEE_PRINCIPAL_ID
WHERE pr.SID = SUSER_SID('LAPTOP-JUKB3QVS\winuser01'); --Login can do anything on Database level

------------------------------------------------------------------------------------------------------------------------------

-- Set the context to the AdventureWorks2022 database
USE [AdventureWorks2022]
GO

-- Add the Windows user LAPTOP-JUKB3QVS\winuser01 to the dbdev role
-- This gives the user all the permissions associated with the dbdev role in the AdventureWorks2022 database
ALTER ROLE [dbdev] ADD MEMBER [LAPTOP-JUKB3QVS\winuser01]
GO

-- Set the context to the AdventureWorks2022 database again (optional, as already in context)
USE [AdventureWorks2022]
GO

-- Add the SQL user sqluser01 to the dbdev role
-- This gives the SQL user all the permissions associated with the dbdev role in the AdventureWorks2022 database
ALTER ROLE [dbdev] ADD MEMBER [sqluser01]
GO

-----------------------------------------------------------------------------------------------------------------------------
