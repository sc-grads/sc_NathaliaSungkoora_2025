/* COMBINE DATASETS  */
USE [70-461(2)];
--UNION AND UNION ALL
-- Rows from trigger tables can be added together
SELECT * FROM INSERTED --Goes all way down to having then UNION...
UNION
SELECT * FROM DELETED

--If same type: biggest one wins
SELECT CONVERT(CHAR(5), 'hi') 
UNION --Creates two rows in one dataset
SELECT CONVERT(CHAR(11), 'hello there')  --If UNION is removed: Output=two seperate datasets

-- Combine  greetings with UNION ALL and does not remove duplication
SELECT CONVERT(CHAR(5), 'hi') AS Greeting --This will be overall column name
UNION ALL
SELECT CONVERT(CHAR(11), 'hello there') AS GreetingNow --If same type: biggest one wins
UNION ALL
SELECT CONVERT(CHAR(11), 'bonjour')
UNION ALL
SELECT CONVERT(CHAR(11), 'hi')--duplicate row

-- Combine values of different data types (Here it will go to biggest data type)
SELECT CONVERT(TINYINT, 45) AS MyColumn
UNION
SELECT CONVERT(BIGINT, 456)

-- UNION between number and string 
--Will try to convert sting to a number rather than number into string
SELECT 4
UNION
SELECT 'hi there' --Output: Error Message



----------------------------------------------------------------------------------------------------------------------------------------------------------
--INTERSECT AND EXCEPT

--ADDS NEW TABLE and ADDA extra column based on ROW NUMBER:
SELECT *, ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) % 3 AS ShouldIDelete
INTO tblTransactionNew
FROM tblTransaction				--%3=modulus (what is left over when you divide by)



DELETE FROM tblTransactionNew
WHERE ShouldIDelete = 1

-- Add one day to date
UPDATE tblTransactionNew
SET DateOfTransaction = DATEADD(DAY, 1, DateOfTransaction)
WHERE ShouldIDelete = 2

-- Remove column that was added
ALTER TABLE tblTransactionNew
DROP COLUMN ShouldIDelete


--Joining the two tables together
--UNION will remove duplicates
SELECT * FROM tblTransaction
UNION 
SELECT * FROM tblTransactionNew

--UNION ALL will keep duplicates
SELECT * FROM tblTransaction
UNION ALL
SELECT * FROM tblTransactionNew


--USING EXCEPT
SELECT * FROM tblTransaction
EXCEPT
SELECT * FROM tblTransactionNew --Output: 1667 rows

--USING INTERSECT
SELECT * FROM tblTransaction
INTERSECT
SELECT * FROM tblTransactionNew --Output: unchanged 833 rows


SELECT * FROM tblTransaction
INTERSECT
--EXCEPT
--UNION
--UNION ALL
SELECT * FROM tblTransactionNew
ORDER BY EmployeeNumber --KEEP ORDER BY AT END

----------------------------------------------------------------------------------------------------------------------------------------------------------
--CASE STATEMENT

--OPTION A
DECLARE @myOption VARCHAR(10) = 'Option A'

-- Use CASE with WHEN conditions, no ELSE here
SELECT CASE 
         WHEN @myOption = 'Option A' THEN 'First option'
         WHEN @myOption = 'Option B' THEN 'Second option'
         ELSE 'No Option'
       END AS MyOptions --Output: First option
GO

--OPTION B
DECLARE @myOption VARCHAR(10) = 'Option B'

-- Use CASE with WHEN conditions, no ELSE here
SELECT CASE 
         WHEN @myOption = 'Option A' THEN 'First option'
         WHEN @myOption = 'Option B' THEN 'Second option'
         ELSE 'No Option'
       END AS MyOptions --Output: Second option
GO


--OPTION C
DECLARE @myOption VARCHAR(10) = 'Option C'

-- Use CASE with WHEN conditions, no ELSE here
SELECT CASE 
         WHEN @myOption = 'Option A' THEN 'First option'
         WHEN @myOption = 'Option B' THEN 'Second option'
         ELSE 'No Option'
       END AS MyOptions --Output: No Option
GO

--EXAMPLE IN PRACTICE

SELECT TOP (1000) [EmployeeNumber]
      ,[EmployeeFirstName]
      ,[EmployeeMiddleName]
      ,[EmployeeLastName]
      ,[EmployeeGovernmentID]
      ,[DateOfBirth]
      ,[Department],
	  CASE WHEN LEFT (EmployeeGovernmentID, 1)= 'A' THEN 'Letter A'
			WHEN LEFT (EmployeeGovernmentID, 1)= 'B' THEN 'Letter B'
			ELSE 'Neither Letter' END + '.' AS myCol
  FROM [70-461].[dbo].[tblEmployee]




DECLARE @myOption VARCHAR(10) = 'Option C'

-- Use CASE with WHEN conditions, no ELSE here
SELECT CASE 
         WHEN @myOption = 'Option A' THEN 'First option'
         WHEN @myOption = 'Option B' THEN 'Second option'
         -- ELSE section optionl
       END AS MyOptions
GO

DECLARE @myOption VARCHAR(10) = 'Option A'

-- CONVERT data types to be the same
SELECT CASE @myOption
         WHEN 'Option A' THEN 'First option'
         WHEN 'Option B' THEN CONVERT(VARCHAR(10),2)
         ELSE 'No Option'
       END AS MyOptions
GO



-- CASE in SELECT with string + numeric checks
DECLARE @myOption VARCHAR(10) = 'Option A'

SELECT CASE 
         WHEN LEFT(EmployeeGovernmentID, 1) = 'A' THEN 'Letter A'
         WHEN EmployeeNumber < 200 THEN 'Less than 200'
         ELSE 'Neither letter'
       END + '.' AS myCol
FROM tblEmployee



----------------------------------------------------------------------------------------------------------------------------------------------------------
--CASE STATEMENT

-- Check rows with NULL middle name (compares variable to NULL)
SELECT * FROM tblEmployee WHERE EmployeeMiddleName IS NULL
GO

-- FUNCTION OF ISNULL: returns value if not NULL, else fallback
DECLARE @myOption VARCHAR(10) = 'Option B'
SELECT ISNULL(@myOption, 'No Option') AS MyOptions
GO --Output: Option B


--LOOKING AT COALESCE
-- COALESCE Can take one, two or more arguments
DECLARE @myFirstOption VARCHAR(10) = 'Option A'
DECLARE @mySecondOption VARCHAR(10)= 'Option B'
SELECT COALESCE(@myFirstOption, @mySecondOption, 'No option') AS MyOptions
GO --Output: Option A

DECLARE @myFirstOption VARCHAR(10)
DECLARE @mySecondOption VARCHAR(10)= 'Option B'
SELECT COALESCE(@myFirstOption, @mySecondOption, 'No option') AS MyOptions
GO --Output: Option B

DECLARE @myFirstOption VARCHAR(10)
DECLARE @mySecondOption VARCHAR(10)
SELECT COALESCE(@myFirstOption, @mySecondOption, 'No option') AS MyOptions
GO --Output: No option



-- ISNULL and COALESCE 
SELECT ISNULL('ABC', 1) AS MyAnswer --Output:ABC
SELECT COALESCE('ABC', 1) AS MyOtherAnswer --Output: Error message failed to convert data types
GO

-- Both NULL inputs return NULL
SELECT ISNULL(NULL, NULL) AS MyAnswer --Output:NULL
SELECT COALESCE(NULL, NULL) AS MyOtherAnswer --Output: Error message (can't express NULL-expression can =NULL but can't directly write NULL)
GO

--CREATING A TABLE:
-- Create test table and insert 1 row
CREATE TABLE tblExample
(myOption NVARCHAR(10) NULL) 
INSERT INTO tblExample (myOption)
VALUES ('Option A')

-- Use COALESCE in SELECT INTO
SELECT COALESCE(myOption, 'No option') AS MyOptions
INTO tblIsCoalesce
FROM tblExample --Output:Created a NULL column

-- Same result using CASE
SELECT CASE WHEN myOption IS NOT NULL THEN myOption ELSE 'No option' END AS MyOptions
FROM tblExample
GO


-- Use ISNULL in SELECT INTO
SELECT ISNULL(myOption, 'No option') AS MyOptions
INTO tblIsNull
FROM tblExample
GO --Output:Created a NOT NULL column

-- Drop tables after examples
DROP TABLE tblExample
DROP TABLE tblIsCoalesce
DROP TABLE tblIsNull


----------------------------------------------------------------------------------------------------------------------------------------------------------
--MERGE STATEMENT

MERGE INTO tblTransaction AS T


BEGIN TRAN 

MERGE INTO tblTransaction AS T 
USING tblTransactionNew AS S    --USING to MERGE
ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction  -- Merging by more than one column
   

WHEN MATCHED THEN  -- If a matching row is found in tblTransaction
    UPDATE SET Amount = T.Amount + S.Amount  -- Add the new Amount to the existing Amount

WHEN NOT MATCHED BY TARGET THEN  -- If no matching row exists in tblTransaction
    INSERT ([Amount], [DateOfTransaction], [EmployeeNumber])  -- Insert a new row with these columns
    VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber);

ROLLBACK TRAN  -- Undo all changes (for testing or safety; remove to commit changes)

-- Notes:
-- tblTransactionNew has new data, tblTransaction is the target
-- One row in tblTransaction can match one row in tblTransactionNew
-- One row in tblTransaction can also match multiple rows in tblTransactionNew (amounts will be summed)

----------------------------------------
USE [70-461(2)];
SELECT EmployeeNumber, DateOfTransaction, COUNT(*) AS NumberOfRows
FROM tblTransactionNew
GROUP BY EmployeeNumber, DateOfTransaction
HAVING COUNT(*)>1;

SELECT EmployeeNumber, DateOfTransaction, SUM(Amount) AS TotalAmount
FROM tblTransactionNew
GROUP BY EmployeeNumber, DateOfTransaction

----------------------------------------
--MODIFYING MERGE STATEMENT 
--Including the SELECT STATEMENT:

BEGIN TRAN 
MERGE INTO tblTransaction AS T 
USING (
	SELECT EmployeeNumber, DateOfTransaction,
	SUM(Amount) AS Amount
	FROM tblTransactionNew
	GROUP BY EmployeeNumber, DateOfTransaction) AS S

ON T.EmployeeNumber = S.EmployeeNumber 
AND T.DateOfTransaction = S.DateOfTransaction 
   
WHEN MATCHED THEN 
    UPDATE SET Amount = T.Amount + S.Amount  

WHEN NOT MATCHED BY TARGET THEN 
    INSERT ([Amount], [DateOfTransaction], [EmployeeNumber]) 
    VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber)
	
OUTPUT INSERTED.*, DELETED.*; --See what happens internally without querying
ROLLBACK TRAN


-----------------
--MERGE WITH ADDITIONAL COLUMNS

BEGIN TRAN 
ALTER TABLE tblTransaction
ADD Comments varchar(50) NULL
GO --Data Definitionn Language

MERGE INTO tblTransaction AS T 
USING (
	SELECT EmployeeNumber, DateOfTransaction,
	SUM(Amount) AS Amount
	FROM tblTransactionNew
	GROUP BY EmployeeNumber, DateOfTransaction) AS S

ON T.EmployeeNumber = S.EmployeeNumber 
AND T.DateOfTransaction = S.DateOfTransaction 
   
WHEN MATCHED THEN  --add AND to put another one
    UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updated Row'  

WHEN NOT MATCHED BY TARGET THEN 
	INSERT ([Amount], [DateOfTransaction], [EmployeeNumber], Comments)
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
	
WHEN NOT MATCHED BY SOURCE THEN --Add not matched by source
	UPDATE SET Comments = 'Unchanged'

OUTPUT INSERTED.*, DELETED.*, $action; --Tells you action done (optional)
--SELECT * FROM tblTransaction ORDER BY EmployeeNumber, DateOfTransaction --Include Order by
ROLLBACK TRAN



