

--Creating a database
-- 1. Set context to master database (system database)
USE master;
GO

-- 2. Create or modify a stored procedure named CreateAutoDatabase
CREATE OR ALTER PROCEDURE CreateAutoDatabase
AS
BEGIN
	-- 3. Check if database 'AutoDBNathalia' exists
    IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoDBNathalia')
    BEGIN
	-- 4. If it doesn't exist, create it
        EXEC('CREATE DATABASE AutoDBNathalia');
    END
END;
GO

-- 5. Run the stored procedure
EXEC CreateAutoDatabase;
GO
