/* Non Integer Numbers */


DECLARE @myvar AS numeric(7,2) 
--OR CAN be DECLARE @myvar as decimal(7,2) 
SET @myvar = 12345.7
--NOTE:		-- 12345.67 is valid for the above.
			-- 123456.7 is not valid 

SELECT @myvar AS myVariable


--Testing another example:
DECLARE @myvar AS numeric(18,8);--Takes 9 bytes

SET @myvar = 1000000000.12345678;


SELECT @myvar AS myVariable --Output: 1000000000.12345678

-- 1 000 000 000.12345678 Precision of 18


------------------------------------------------------------------------------
--SMALLMONEY vs MONEY

DECLARE @myvar AS smallmoney = 123456.7891;

Select @myvar AS myVariable; -- 1234567.7891

--if you add another decimal place, it will round to nearest:
DECLARE @myvar AS smallmoney = 123456.78917;

Select @myvar AS myVariable; -- 1234567.7892

------------------------------------------------------------------------------
--FLOAT vs REAL
--Not recommended as it gives approximate numbers
--REAL is float 24

DECLARE @myvar AS FLOAT (24) = 123456.7891; --precise to 7 digits

SELECT @myvar AS myVariable --Output: 123456.8 --Same as declaring as REAL


------------------------------------------------------------------------------
/* MATH FUNCTIONS */

DECLARE @myvar as numeric(7,2) = 3

--Using POWER FUNCTION:
SELECT POWER (@myvar, 2); --Output=9.00
SELECT SQUARE (@myvar) ; --Output=9
		--Using square to say 3 to the power of 2
--USing SQUARE ROOT (or SQRT):
SELECT POWER (@myvar, 0.5); --Output=1.73
	--OR use SQRT:
	SELECT SQRT (@myvar); --Output: 1.73205080756888

GO


--FUNCTIONS that have to do with rounding to the nearest:
DECLARE @myvar as numeric(7,2) = 3.7
SELECT FLOOR(@myvar); --Rounds down to nearest whole number
					--Output: 3
SELECT CEILING(@myvar); --Rounds up to nearest whole number
					--Output: 4

--Testing with negative numbers:
DECLARE @myvar as numeric(7,2) = -3.7
SELECT FLOOR(@myvar) AS myFloor; --Rounds down to nearest whole number
					--Output: -4
SELECT CEILING(@myvar)AS myCeiling; --Rounds up to nearest whole number
					--Output: -3
SELECT ROUND(@myvar,0); --Rounds to decimal you specify
					--Output: -4.00 ( 0 decimal)


--Testing with another number and more decimals:

DECLARE @myvar as numeric(7,2) = 12.345
SELECT FLOOR(@myvar) AS myFloor; --Rounds down to nearest whole number
					--Output: 12
SELECT CEILING(@myvar)AS myCeiling; --Rounds up to nearest whole number
					--Output: 13
SELECT ROUND(@myvar,0) AS myRound; --Rounds to nearest decimal you specify
					--Output: 12.00 ( 0 decimal)
SELECT ROUND(@myvar,1) AS myRound; --Rounds to nearest 1 decimal you specify
					--Output: 12.40 ( 1 decimal) 
					--provides estimate and will not always work as expected

--Testing with another example
DECLARE @myvar as numeric(7,2) = 12.344
SELECT FLOOR(@myvar) AS myFloor; --Rounds down to nearest whole number
					--Output: 12
SELECT CEILING(@myvar)AS myCeiling; --Rounds up to nearest whole number
					--Output: 13
SELECT ROUND(@myvar,0) AS myRound; --Rounds to nearest decimal you specify
					--Output: 12.00 ( 0 decimal)
SELECT ROUND(@myvar,1) AS myRound; --Rounds to nearest 1 decimal you specify
					--Output: 12.30 ( 1 decimal) 
					--provides estimate and will not always work as expected

--Testing with another example with 3 decimals
SELECT ROUND(@myvar,3) AS myRound; --Rounds to nearest 3 decimal you specify
					--Output: 12.34 ( 3 decimal) 
--Testing with another example with -1 decimals
SELECT ROUND(@myvar,-1) AS myRound; --Rounds to nearest 10
					--Output: 10.00 ( -1 decimal) 
GO


----------------------------------------------------------------------------------------
--PI and ESPRESSION
SELECT PI() AS myPI --Output: 3.14159265358979
SELECT EXP(1) as e --Output: 2.71828182845905


--ABSOLUTE(only positive value of any number) and SIGN VALUE(give -1 or +1 or 0)
--POSITIVE NUMBERS:
DECLARE @myvar as numeric (7,2) = 456

SELECT ABS(@myvar) AS myABS,--Output:456.00
SIGN(@myvar)AS mySign;--Output:1.00


--NEGATIVE NUMBERS:
DECLARE @myvar as numeric (7,2) = -456

SELECT ABS(@myvar) AS myABS,--Output:456.00
SIGN(@myvar)AS mySign;--Output:-1.00


--RANDOM VALUE (RAND)

SELECT RAND(345); --Need random number to get a random number
					-- Output: 0.720001735325744 (random number)

----------------------------------------------------------------------------------------------------------
--Coding exercise

SELECT POWER(4,3)   AS Result1; -- Output:64
 
SELECT Floor(PI())   AS Result2;-- Output: 3

SELECT Ceiling (PI())    AS Result3; -- Output:4