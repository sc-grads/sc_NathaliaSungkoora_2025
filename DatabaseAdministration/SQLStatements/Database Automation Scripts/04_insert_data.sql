
-- Inserting data

-- 1. Set context to our database
USE AutoTest_NS_03April;
GO

-- 2. Execute the InsertUser procedure with sample data
EXEC InsertUser 'John', 'Doe', 'john.doe@example.com';
EXEC InsertUser 'Jane', 'Smith', 'jane.smith@example.com';
GO
