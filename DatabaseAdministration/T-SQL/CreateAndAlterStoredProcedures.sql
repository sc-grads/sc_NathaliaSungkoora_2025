/*CREATE AND ALTER STORED PROCEDURES */

-- Create a stored procedure
CREATE PROC NameEmployees AS
BEGIN
    -- Get employee details (based on specific columns)
    SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
    FROM tblEmployee
END
GO

--Execute: All gives same output
NameEmployees -- Run the procedure
EXECUTE NameEmployees -- Run using EXECUTE
EXEC NameEmployees -- Run using EXEC


-----------------------------------------------------------------------------------------------------------------------------------------------------
--ASK FOR A SPECIFIC EMPLOYEE

--Check to see if SP exists (if so, drop and recreate it):
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'NameEmployees')
    DROP PROC NameEmployees
	GO
-- Create a stored procedure
CREATE PROC NameEmployees AS
BEGIN
    -- Get employee details (based on specific columns)
    SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
    FROM tblEmployee
END
GO
--ALTERNATIVE WAY:
-- Delete the procedure if it exists
IF OBJECT_ID('NameEmployees', 'P') IS NOT NULL
    DROP PROC NameEmployees
GO

-- Create a procedure that takes EmployeeNumber as input
CREATE PROC NameEmployees(@EmployeeNumber INT) AS --declare here
BEGIN
    -- Check if the employee exists
    IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber = @EmployeeNumber)
    BEGIN
        -- Show employee details
        SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
        FROM tblEmployee
        WHERE EmployeeNumber = @EmployeeNumber
    END
END
GO

--EXECUTE SP
NameEmployees 4 -- DOES NOT SHOWS EMPLOYEE DETAILS (doesn't exist)
EXECUTE NameEmployees 223 --SHOWS EMPLOYEE DETAILS
EXEC NameEmployees 323 --SHOWS EMPLOYEE DETAILS

-- This line will cause an error (invalid use of SELECT with a procedure)
-- SELECT EmployeeNumber FROM NameEmployees

-- Create a variable and set value
DECLARE @EmployeeName INT = 123

-- Show variable value
SELECT @EmployeeName

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--EXERCISE IF

-- Check if the procedure exists
IF OBJECT_ID('NameEmployees','P') IS NOT NULL
    DROP PROC NameEmployees
GO

-- Create the procedure with input parameter
CREATE PROC NameEmployees(@EmployeeNumber INT) AS
BEGIN
    -- Check if employee exists
    IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber = @EmployeeNumber)
    BEGIN
        -- If EmployeeNumber is less than 300
        IF @EmployeeNumber < 300
        BEGIN
            -- Show basic employee info
            SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
            FROM tblEmployee
            WHERE EmployeeNumber = @EmployeeNumber
        END
        ELSE
        BEGIN
            -- Show detailed employee info (same as above)
            SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName, Department
            FROM tblEmployee
            WHERE EmployeeNumber = @EmployeeNumber
            -- Show employee's transactions
            SELECT * FROM tblTransaction WHERE EmployeeNumber = @EmployeeNumber
        END
    END
END
GO

--EXECUTE QUERY
NameEmployees 4 --NO OUTPUT
EXECUTE NameEmployees 223 --OUTPUT SHOWN
EXEC NameEmployees 324 --OUTPUT SHOWN AND TRANSACTION NUMBERS

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--MULTIPLE ARGUMENTS (like a range)

-- Check if the procedure exists
IF OBJECT_ID('NameEmployees','P') IS NOT NULL
    DROP PROC NameEmployees
GO

-- Create the procedure with input parameter
CREATE PROC NameEmployees(@EmployeeNumberFrom INT, @EmployeeNumberTo INT)  AS
BEGIN
    -- Check if employee exists
    IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber
	BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo) --ADD BETWEEN....AND... for range
    
        BEGIN
            -- Show basic employee info
            SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
            FROM tblEmployee
            WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo 
        END
        ELSE
        BEGIN
            -- Show detailed employee info (same as above)
            -- Use one of the input values as fallback (e.g., show details for the 'from' number)
            SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName, Department
            FROM tblEmployee
            WHERE EmployeeNumber = @EmployeeNumberFrom

            -- Show employee's transactions
            SELECT * FROM tblTransaction WHERE EmployeeNumber = @EmployeeNumberFrom
        END
   
END
GO


--EXECUTE QUERY
NameEmployees 4, 5 --OUPUT: DOES NOT SHOW BEACUSE THEY DON"T EXIST
EXECUTE NameEmployees 223, 227 --OUTPUT SHOWN
EXEC NameEmployees @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327 --OUTPUT SHOWN AND TRANSACTION NUMBERS
			--Being more specific


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--WHILE (LOOPING)
-- Check if the procedure exists
IF OBJECT_ID('NameEmployees','P') IS NOT NULL
    DROP PROC NameEmployees
GO
-- Create the procedure with input parameter
CREATE PROC NameEmployees(@EmployeeNumberFrom INT, @EmployeeNumberTo INT)  AS
BEGIN
    
    IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber
	BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo) --ADD BETWEEN....AND... for range
    
        BEGIN
			DECLARE @EmployeeNumber INT =  @EmployeeNumberFrom--Add declare
			WHILE @EmployeeNumber <= @EmployeeNumberTo
			BEGIN
				SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
				FROM tblEmployee
				WHERE EmployeeNumber=@EmployeeNumber
				SET @EmployeeNumber = @EmployeeNumber + 1 --ADD SET
			END
        
        END
   
END
GO

--EXECUTE QUERY
--RUNS SEPERATE SELECT STATEMENTS
EXEC NameEmployees @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--RETURN

-- Drop procedure if it exists
IF OBJECT_ID('NameEmployees', 'P') IS NOT NULL
    DROP PROC NameEmployees
GO

-- Create procedure with input range and OUTPUT parameter
CREATE PROC NameEmployees(@EmployeeNumberFrom INT, @EmployeeNumberTo INT, @NumberOfRows INT OUTPUT) AS
BEGIN
    -- Check if any employees exist in the given range
    IF EXISTS (SELECT * FROM tblEmployee WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
    BEGIN
        SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName
        FROM tblEmployee
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
        SET @NumberOfRows = @@ROWCOUNT --ADD ROWCOUNT

        RETURN 0 -- Success
    END
    ELSE --ADD ELSE
    BEGIN 
        SET @NumberOfRows = 0
        RETURN 1 -- No rows found
    END
END
GO

-- Example calls to the procedure with different parameters and capturing output
DECLARE @NumberRows INT, @ReturnStatus INT
EXEC @ReturnStatus = NameEmployees 4, 5, @NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount, @ReturnStatus AS Return_Status
GO

DECLARE @NumberRows INT, @ReturnStatus INT
EXEC @ReturnStatus = NameEmployees 4, 327, @NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount, @ReturnStatus AS Return_Status
GO --output:MyRowCount 206

DECLARE @NumberRows INT, @ReturnStatus INT
EXEC @ReturnStatus = NameEmployees @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327, @NumberOfRows = @NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount, @ReturnStatus AS Return_Status --output:MyRowCount 5


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--TRY AND CATCH

-- CHECK IF PROCEDURE EXISTS
IF OBJECT_ID('AverageBalance', 'P') IS NOT NULL  
    DROP PROC AverageBalance  
GO  

-- CREATE PROCEDURE  
CREATE PROC AverageBalance(@EmployeeNumberFrom INT, @EmployeeNumberTo INT, @AverageBalance INT OUTPUT) AS  
BEGIN  
    SET NOCOUNT ON  -- Stop extra result sets
	--DECLARE TWO AMOUNTS:
    DECLARE @TotalAmount MONEY  -- Total money amount  
    DECLARE @NumOfEmployee INT  -- Total employee count  

    BEGIN TRY  -- Start TRY block  

        -- Get total amount from transactions in range  
        SELECT @TotalAmount = SUM(Amount)  
        FROM tblTransaction  
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo  

        -- Get number of employees in range  
        SELECT @NumOfEmployee = COUNT(DISTINCT EmployeeNumber)  --ADD DISTINCT IN COUNT
        FROM tblEmployee  
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo  

        -- Avoid divide by zero  
        IF @NumOfEmployee > 0  
            SET @AverageBalance = CONVERT(INT, @TotalAmount / @NumOfEmployee)  
        ELSE  
            SET @AverageBalance = 0  

        RETURN 0 --SUCCESS

    END TRY  

    BEGIN CATCH  -- If ERROR happens  
        SET @AverageBalance = 0  -- Default value on error  

        -- ERROR INFO 
        SELECT  
            ERROR_MESSAGE() AS ErrorMessage,  
            ERROR_LINE() AS ErrorLine,  --shows exactly where problem lies
            ERROR_NUMBER() AS ErrorNumber,  
            ERROR_PROCEDURE() AS ErrorProcedure,  
            ERROR_SEVERITY() AS ErrorSeverity,  --0-10 (only for info), 16 is DEFAULT
            ERROR_STATE() AS ErrorState  

        RETURN 1  -- ERROR  
    END CATCH  
END  
GO  



--EXECUTING: 
DECLARE @AvgBalance INT, @ReturnStatus INT  
EXEC @ReturnStatus = AverageBalance 4, 5, @AvgBalance OUTPUT  
SELECT @AvgBalance AS Average_Balance, @ReturnStatus AS Return_Status  
GO  

DECLARE @AvgBalance INT, @ReturnStatus INT  
EXECUTE @ReturnStatus = AverageBalance 223, 227, @AvgBalance OUTPUT  
SELECT @AvgBalance AS Average_Balance, @ReturnStatus AS Return_Status  
GO  
 
DECLARE @AvgBalance INT, @ReturnStatus INT  
EXEC @ReturnStatus = AverageBalance @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327, @AverageBalance = @AvgBalance OUTPUT  
SELECT @AvgBalance AS Average_Balance, @ReturnStatus AS Return_Status  
GO  

-- TEST INVALID CONVERSION  
SELECT TRY_CONVERT(INT, 'two')  -- Returns NULL  


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PRINT


-- DROP PROCEDURE IF EXISTS
IF OBJECT_ID('AverageBalance','P') IS NOT NULL
    DROP PROC AverageBalance
GO

CREATE PROC AverageBalance(
    @EmployeeNumberFrom INT, 
    @EmployeeNumberTo INT, 
    @AverageBalance INT OUTPUT
) AS
BEGIN
    SET NOCOUNT ON  -- Prevent extra messages

    DECLARE @TotalAmount DECIMAL(18,2)  -- Total amount sum
    DECLARE @NumOfEmployee INT           -- Number of employees

    BEGIN TRY
        PRINT 'Employee numbers from ' + CONVERT(VARCHAR(10), @EmployeeNumberFrom) 
              + ' to ' + CONVERT(VARCHAR(10), @EmployeeNumberTo)

        SELECT @TotalAmount = SUM(Amount) 
        FROM tblTransaction
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        SELECT @NumOfEmployee = COUNT(DISTINCT EmployeeNumber) 
        FROM tblEmployee
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        SET @AverageBalance = CASE WHEN @NumOfEmployee > 0 
                                   THEN CONVERT(INT, @TotalAmount / @NumOfEmployee) 
                                   ELSE 0 
                              END

        RETURN 0  -- Success
    END TRY

    BEGIN CATCH
        SET @AverageBalance = 0  -- Default on error

        IF ERROR_NUMBER() = 8134  -- Divide by zero error number
        BEGIN
            PRINT 'There are no valid employees in this range.'
            RETURN 8134
        END
        ELSE
        BEGIN
            DECLARE @ErrorMessage VARCHAR(255) --DECLARE ERROR MESSAGE
            SELECT @ErrorMessage = ERROR_MESSAGE()
            RAISERROR (@ErrorMessage, 16, 1)
            -- Optionally: THROW 56789, 'Custom error message', 1
        END

        -- DEBUG message (optional)
        SELECT 'Hi There'
    END CATCH
END
GO

-- TEST EXECUTIONS
DECLARE @AvgBalance INT, @ReturnStatus INT
EXEC @ReturnStatus = AverageBalance 4, 5, @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance, @ReturnStatus AS Return_Status
GO

DECLARE @AvgBalance INT, @ReturnStatus INT
EXECUTE @ReturnStatus = AverageBalance 223, 227, @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance, @ReturnStatus AS Return_Status, 'Error did not stop us' AS MyMessage
GO

DECLARE @AvgBalance INT, @ReturnStatus INT
EXEC @ReturnStatus = AverageBalance @EmployeeNumberFrom = 323, @EmployeeNumberTo = 327, @AverageBalance = @AvgBalance OUTPUT
SELECT @AvgBalance AS Average_Balance, @ReturnStatus AS Return_Status



