
--Creating Database
USE master;
GO

CREATE OR ALTER PROCEDURE CreateAutoDatabase
AS
BEGIN
    IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AutoDBNathalia')
    BEGIN
        EXEC('CREATE DATABASE AutoDBNathalia');
    END
END;
GO
