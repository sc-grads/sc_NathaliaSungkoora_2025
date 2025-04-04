

--Creating a database
-- 1. Set context to master database (system database)
USE master;
GO

-- 2. Create or modify a stored procedure named CreateAutoDatabase
CREATE OR ALTER PROCEDURE CreateAutoDatabase
AS
BEGIN
	-- 3. Check if database 'AutoDBNathalia' exists
    IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoTest_NS_04April')
    BEGIN
	-- 4. If it doesn't exist, create it
        EXEC('CREATE DATABASE AutoTest_NS_03April');
    END
END;
GO

-- 5. Run the stored procedure
EXEC CreateAutoDatabase;
GO
