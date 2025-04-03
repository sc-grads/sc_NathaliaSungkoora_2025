--Inserting data by creating a stored procedure

-- 1. Set context to our database
USE AutoTest_NS_03April;
GO

-- 2. Create or modify procedure to insert user data
CREATE OR ALTER PROCEDURE InsertUser
    @Name NVARCHAR(100),
    @Surname NVARCHAR(100),
    @Email NVARCHAR(100)
AS
BEGIN
-- 3. Insert the parameter values into users table
    INSERT INTO users (Name, Surname, Email)
    VALUES (@Name, @Surname, @Email);
END;
GO
