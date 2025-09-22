/*EXAMPLES*/


-- 1. Use the following command to create a stored procedure

CREATE PROCEDURE ChangeAge
	@CustomerID INT,
	@NewAge INT
AS
UPDATE Customers
SET age = @NewAge
WHERE CustomerId = @CustomerID
-- 2. Use the following command to execute the stored procedure

EXEC ChangeAge 2,35;