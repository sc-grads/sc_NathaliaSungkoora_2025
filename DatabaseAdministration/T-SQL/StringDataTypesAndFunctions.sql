/* STRING DATA TYPES AND FUNCTIONS */


-- char - ASCII - 1 byte
-- varchar - ASCII - 1 byte
-- nchar - UNICODE - 2 bytes
-- nvarchar - UNICODE - 2 bytes

-- ASCII: A-Z, a-z, 0-9  
--       65   97   48   32  128 (0-255)



DECLARE @chrMyCharacters AS CHAR(10)

SET @chrMyCharacters = 'hello'

SELECT @chrMyCharacters--Output= hello


--Seeing the length of the chatacters
SELECT @chrMyCharacters AS myString, len(@chrMyCharacters) AS MyLength , DATALENGTH(@chrMyCharacters) AS MyDataLength

--Using variable character string (VARCHAR)
DECLARE @chrMyCharacters AS VARCHAR(10)
SET @chrMyCharacters = 'hello'
SELECT @chrMyCharacters--Output= hello


--Seeing the length of the chatacyers
SELECT @chrMyCharacters AS myString, len(@chrMyCharacters) AS MyLength , DATALENGTH(@chrMyCharacters) AS MyDataLength

--Using variable character string (NVARCHAR)
DECLARE @chrMyCharacters AS NVARCHAR(10)
SET @chrMyCharacters = 'hello'
SELECT @chrMyCharacters--Output= hello

--Seeing the length of the chatacters
SELECT @chrMyCharacters AS myString, len(@chrMyCharacters) AS MyLength , DATALENGTH(@chrMyCharacters) AS MyDataLength

--Using Symbol to test
DECLARE @chrMyCharacters AS NVARCHAR(10)
SET @chrMyCharacters = N'helloϞ'
SELECT @chrMyCharacters--Output= hello

--Seeing the length of the chatacters
SELECT @chrMyCharacters AS myString, len(@chrMyCharacters) AS MyLength , DATALENGTH(@chrMyCharacters) AS MyDataLength


----------------------------------------------------------------------------------------------------------------------------------------
--STRING FUNCTIONS

DECLARE @chrASCII AS VARCHAR(10) = 'hello';


DECLARE @chrUNICODE AS NVARCHAR(10) = N'helloϞ';

--USING LEFT AND RIGHT
-- Get the first two characters of @chrASCII and the last two of @chrUNICODE
SELECT LEFT(@chrASCII, 2) AS myASCII, --Output:he
       RIGHT(@chrUNICODE, 2) AS myUNICODE; -- --Output:oϞ

-- SUBSTRING (GETS MIDDLE LETTERS): Get two characters starting from the third character of @chrASCII
SELECT SUBSTRING(@chrASCII, 3, 2) AS middleletters; --Output: ll

-- USING LTRIM AND RTRIM to Trim any extra spaces from the left and right of @chrASCII
SELECT LTRIM(@chrASCII) AS myLTRIM; --getting from left only
SELECT LTRIM(RTRIM(@chrASCII)) AS myTRIM; --getting from both left and right

-- USING REPLACE to Replace all lowercase 'l' with uppercase 'L' in @chrASCII
SELECT REPLACE(@chrASCII, 'l', 'L') AS myReplace; --Output: heLLothere

-- UPPER: Convert @chrASCII to uppercase
SELECT UPPER(@chrASCII) AS myUPPER;

--  LOWER: Convert @chrASCII to lowercase
SELECT LOWER(@chrASCII) AS myLOWER;
----------------------------------------------------------------------------------------------------------------------
--NULL and INTRODUCTION
-- Declare variables (all NULL by default)
DECLARE @myvar AS INT;
--SET @myvar =4
SELECT  @myvar AS myCol --Output=4
			--If second line is removed -Outout=NULL

--Unknown answer +2 ( do not know value)
DECLARE @myvar AS INT;

SELECT  @myvar +2 AS myCol --Output=NULL

DECLARE @mystring AS NVARCHAR(20);
DECLARE @mydecimal DECIMAL(5,2);

-- Calculation with NULL 
SELECT 1 + 1 + 1 + 1 + 1 + @myvar + 1 + 1 AS myCol; --Output=NULL

-- Check length of NULL string 
SELECT DATALENGTH(@mystring) AS mystring; --Output=NULL

-- Convert 1000 to DECIMAL(5,2) 
SELECT try_CONVERT(DECIMAL(5,2), 1000) AS myConvertResult; --Output=NULL

-- Cast 1000 to DECIMAL(5,2) 
SELECT try_CAST(1000 AS DECIMAL(5,2)) AS myCastResult; --Output=NULL
--NULL means " I don't know"


----------------------------------------------------------------------------------------------------------------------
--JOINING TWO STRINGS TOGETHER

--Example 1:
-- Declare variables
DECLARE @firstname AS NVARCHAR(20) = 'John';
DECLARE @middlename AS NVARCHAR(20)='Walker';
DECLARE @lastname AS NVARCHAR(20) = 'Smith';
SELECT @firstname + ' ' + @middlename + ' '+ @lastname as FullName;
		--Output=John Walker Smith

--Example 2:
-- Declare variables
DECLARE @firstname AS NVARCHAR(20) = 'Sarah';
DECLARE @middlename AS NVARCHAR(20); -- --Output: NULL by default
DECLARE @lastname AS NVARCHAR(20) = 'Milligan';
SELECT @firstname + ' ' + @middlename + ' '+ @lastname as FullName;
		--Output=NULL

-- Use IIF (shorter conditional)
SELECT @firstname + IIF(@middlename IS NULL, '', ' ' + @middlename) + ' ' + @lastname AS FullName;
		--Output= Sarah Milligan

-- Use CASE (clear logic) (in this case do this, otherwise do that...)
SELECT @firstname + CASE WHEN @middlename IS NULL THEN '' ELSE ' ' + @middlename END + ' ' + @lastname AS FullName;
			--Output= Sarah Milligan

-- Use COALESCE (simpler): Takes many arguments and checks if it is NULL or not and takes it
SELECT @firstname + COALESCE(' ' + @middlename, '') + ' ' + @lastname AS FullName;
			--Output= Sarah Milligan

-- Use CONCAT (auto-handles NULL): Disregards arguments that are NULL
SELECT CONCAT(@firstname, ' ' + @middlename, ' ', @lastname) AS FullName;
			--Output= Sarah Milligan

----------------------------------------------------------------------------------------------------------------------
--JOINING ASTRING AND A NUMBER TOGETHER

--Convert integer to string using CONVERT
SELECT 'My number is: ' + CONVERT(VARCHAR(20), 4567);
		--Output: My number is: 4567

--Convert integer to string using CAST (SAME result)
SELECT 'My number is: ' + CAST(4567 AS VARCHAR(20));
		--Output: My number is: 4567

--Convert decimal to string (basic, no formatting)
SELECT 'My salary is: $' + CONVERT(VARCHAR(20), 2345.6);
		--Output: My salary is: $2345.6


--Properly format number as currency (BRITISH)
SELECT 'My salary is: ' + FORMAT(2345.6, 'C', 'en-GB');
		--Output: My salary is: £ 2 345,60 

--Properly format number as currency (French)
SELECT 'My salary is: ' + FORMAT(2345.6, 'C', 'fr-FR');
		--Output: My salary is: 2 345,60 €


