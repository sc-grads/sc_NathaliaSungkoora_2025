-- Create Users Table in AutoDBNathalia

-- 1. Switch to the AutoDBNathalia database
USE AutoTest_NS_04April;
GO

-- 2. Check if 'users' table exists
IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'users' AND TABLE_TYPE = 'BASE TABLE'
)
BEGIN
	-- 3. If it doesn't exist, create the users table
    CREATE TABLE users (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(100),
        Surname NVARCHAR(100),
        Email NVARCHAR(100),
       
    );
END;
GO
