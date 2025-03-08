-- Test insert data into table
USE AutoTest;
GO

EXEC InsertUser 'John', 'Doe', 'john.doe@example.com';
EXEC InsertUser 'Jane', 'Smith', 'jane.smith@example.com';
GO
