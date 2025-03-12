-- Switch to the 'AutoTest' database and create the 'users' table
USE AutoTest;
GO

--Creating users table with ID, Name, Surname and Email
CREATE TABLE users (					
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    Surname NVARCHAR(100),
    Email NVARCHAR(100)
);
GO