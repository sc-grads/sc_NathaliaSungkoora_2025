/*FUNCTIONS*/
USE [70-461(2)];

--SCALAR FUNCTIONS


--SYNTAX USING INSERT SNIPPET 
CREATE FUNCTION [dbo].[FunctionName]
(
    @param1 int,
	@param2 int
)
RETURNS INT
AS
BEGIN

    RETURN @param1 + @param2

END



-- FUNCTION adds 1 to the input amount
CREATE FUNCTION AmountPlusOne(@Amount SMALLMONEY)
RETURNS SMALLMONEY
AS
BEGIN
    RETURN @Amount + 1
END
GO --END BATCH STATEMENT

-- Select transactions with AmountPlusOne result
SELECT DateOfTransaction, EmployeeNumber, Amount, dbo.AmountPlusOne(Amount) AS AmountAndOne
FROM tblTransaction

--ALTERNATIVELY:
-- Declare variable and call function
DECLARE @myValue SMALLMONEY
EXEC @myValue = dbo.AmountPlusOne @Amount = 345.67
SELECT @myValue


---------------------------------------------------------------------------------------------------------------
--MORE COMPLEX SCALAR FUNCTION
--For a given EmployeeNumber->How many TRANSACTIONS have occurred?

-- DROP FUNCTION IF IT ALREADY EXISTS
IF OBJECT_ID(N'NumberOfTransactions', N'FN') IS NOT NULL
	DROP FUNCTION NumberOfTransactions
GO

-- CREATE FUNCTION TO RETURN NUMBER OF TRANSACTIONS FOR AN EMPLOYEE
CREATE FUNCTION NumberOfTransactions(@EmployeeNumber INT)
RETURNS INT							--Set PARAMETER above
AS
BEGIN
	DECLARE @NumberOfTransactions INT

	SELECT @NumberOfTransactions = COUNT(*)
	FROM tblTransaction
	WHERE EmployeeNumber = @EmployeeNumber

	RETURN @NumberOfTransactions
END


--See if FUNCTION exists
SELECT *
FROM sys.objects 
WHERE NAME ='NumberOfTransactions'

--EXECUTE HERE:
SELECT *,
		 dbo.NumberOfTransactions(EmployeeNumber) AS TransNum
FROM tblEmployee;
