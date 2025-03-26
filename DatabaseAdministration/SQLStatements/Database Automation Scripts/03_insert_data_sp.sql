--Inserting data by creating a stored procedure
USE AutoDBNathalia;
GO

CREATE OR ALTER PROCEDURE InsertUser
    @Name NVARCHAR(100),
    @Surname NVARCHAR(100),
    @Email NVARCHAR(100)
AS
BEGIN
    INSERT INTO users (Name, Surname, Email)
    VALUES (@Name, @Surname, @Email);
END;
GO
