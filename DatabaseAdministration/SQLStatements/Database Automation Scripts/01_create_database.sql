 
-- Check if the 'AutoTest' database exists; if not, create it.
IF NOT EXISTS (SELECT name FROM sys.databases where name = 'AutoTest')
BEGIN
	CREATE DATABASE AutoTest;	-- Create the 'AutoTest' database
END;
GO