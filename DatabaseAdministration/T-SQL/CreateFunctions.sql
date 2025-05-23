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
---------------------------------------------------------------------------------------------------------------
--INLINE TABLE FUNCTION

--SYNTAX USING INSERT SNIPPET 
CREATE FUNCTION [dbo].[FunctionName]
(
    @param1 int,
    @param2 char(5)
)
RETURNS TABLE AS RETURN
(
    SELECT @param1 AS c1,
	       @param2 AS c2
)

--FUNCTION which RETURNS all an Employee's TRANSACTIONS

-- INLINE TABLE-VALUED FUNCTION  to return TRANSACTIONS for an employee
CREATE FUNCTION TransactionList(@EmployeeNumber INT)
RETURNS TABLE AS RETURN --ONLY HAS RETURN
(
    SELECT * 
    FROM tblTransaction
    WHERE EmployeeNumber = @EmployeeNumber
)

-- TRANSACTIONS  for employee 123
SELECT * 
FROM dbo.TransactionList(123)

-- Employees who have at least one TRANSACTIONS
SELECT * 
FROM tblEmployee
WHERE EXISTS (SELECT * FROM dbo.TransactionList(EmployeeNumber))

-- DISTINCT employees who made TRANSACTIONS (using JOIN)
SELECT DISTINCT E.*
FROM tblEmployee AS E
JOIN tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber

-- SAME result using EXISTS IN WHERE CLAUSE instead of JOIN
SELECT *
FROM tblEmployee AS E
WHERE EXISTS (
    SELECT EmployeeNumber 
    FROM tblTransaction AS T 
    WHERE E.EmployeeNumber = T.EmployeeNumber
)

---------------------------------------------------------------------------------------------------------------
--MULTI STATEMENT TABLE FUNCTION

--SYNTAX USING INSERT SNIPPET 
CREATE FUNCTION [dbo].[FunctionName]
(
    @param1 int,
    @param2 char(5)
)
RETURNS @returntable TABLE 
(
	[c1] int,
	[c2] char(5)
)
AS
BEGIN
    INSERT @returntable
    SELECT @param1, @param2
    RETURN 
END

--MODIFY to print out existing [dbo].[TransactionList] FUNCTION:
ALTER FUNCTION [dbo].[TransactionList](@EmployeeNumber INT)
RETURNS TABLE AS RETURN --ONLY HAS RETURN
(
    SELECT * 
    FROM tblTransaction
    WHERE EmployeeNumber = @EmployeeNumber
)
GO

--Check TRANSACTION LIST
SELECT *
FROM dbo.TransactionList(123);

--NOW LOOKING AT DIFFERENCES CREATE MULTILINE FUNCTION:
CREATE FUNCTION TransList(@EmployeeNumber INT)
RETURNS @TransList TABLE 
(
	Amount SMALLMONEY,
	DateOfTransaction SMALLDATETIME,
	EmployeeNumber INT
)
AS
BEGIN
		INSERT INTO @TransList
		SELECT Amount, DateOfTransaction, EmployeeNumber   
		FROM tblTransaction
		WHERE EmployeeNumber = @EmployeeNumber
		RETURN
END

--After running functions: Check TRANS LIST
SELECT *
FROM dbo.TransList(123);


---------------------------------------------------------------------------------------------------------------
--APPLY


-- TRANSACTION for employee 123
SELECT * 
FROM dbo.TransList(123)
GO

--USING TRANSLIST FUNCTION:
-- Show employees with their number of transactions
SELECT *, (SELECT COUNT(*) FROM dbo.TransList(E.EmployeeNumber)) AS NumTransactions
FROM tblEmployee AS E

--OUTER APPLY
-- Return all employees and their transactions (like LEFT JOIN)
SELECT *
FROM tblEmployee AS E
OUTER APPLY TransList(E.EmployeeNumber) AS T

--CANT USE LEFT JOIN:
/* PROCESS OF WHAT IS HAPPENING:
123 left join TransList(123)
124 left join TransList(124)

--outer apply all of tblEmployee, UDF 0+ rows
--cross apply UDF 1+ rows

--outer apply = LEFT JOIN
--cross apply = INNER JOIN*/

--CROSS APPLY
-- Return only employees with transactions (like INNER JOIN)
SELECT *
FROM tblEmployee AS E
CROSS APPLY TransList(E.EmployeeNumber) AS T

-- Only show employees with more than 3 transactions
SELECT *
FROM tblEmployee AS E
WHERE (SELECT COUNT(*) FROM dbo.TransList(E.EmployeeNumber)) > 3
