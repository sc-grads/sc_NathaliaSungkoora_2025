/*DATA TYPES AND FUNCTIONS */


--SETTING DATES AND DATE EXTRACTION

DECLARE @mydate AS DATETIME = '2025-05-19 15:44:55.124'
SELECT @mydate AS myDate --Output: 2025-05-19 15:44:55.123



DECLARE @mydate2 AS DATETIME2 = '2025-05-19 15:44:55.124'
SELECT @mydate2 AS MyDate --Output:2025-05-19 15:44:55.1240000


DECLARE @mydate3 AS DATETIME2(3) = '2025-05-19 15:44:55.124' --will take more storage(bytes) as number increase
SELECT @mydate3 AS MyDate --Output:2025-05-19 15:44:55.124


--Using different functions:
SELECT DATEFROMPARTS(2025,05,19) AS ThisDate; --Output: 2025-05-19

SELECT DATETIME2FROMPARTS(2025,05,19,12,34,56,124,5) AS ThatDate --Output:2025-05-19 12:34:56.00124 
												--number by last comma is how many decimal places
SELECT 
    YEAR(@mydate) AS myYear, --Output:2025
    MONTH(@mydate) AS myMonth,  --Output:5
    DAY(@mydate) AS myDay; --Output:19

--------------------------------------------------------------------------------------------------------
-- TODAY'S DATE AND MORE DATE FUNCTIONS

-- GET CURRENT DATE AND TIME (all functions below will give you the same output)
SELECT CURRENT_TIMESTAMP AS RightNow; --Output: 2025-05-19 21:28:51.230  (DATETIME)
SELECT GETDATE() AS RightNow;  --Output:2025-05-19 21:28:51.230 (DATETIME)
SELECT SYSDATETIME() AS RightNow;  --Output:2025-05-19 21:28:51.2332311 (MORE ACCURATE -DATETIME2)

--DATEADD: ADD ONE YEAR TO A SPECIFIC DATE
SELECT DATEADD(YEAR, 1, '2025-05-19 15:44:55.124') AS myYear;  --Output:2026-05-19 15:44:55.123

--DATEPART: EXTRACT HOUR FROM A SPECIFIC DATE
SELECT DATEPART(HOUR, '2025-05-19 15:44:55.124') AS myHour;  --Output:15

-- DATENAME: GET CURRENT DAY OF THE WEEK
SELECT DATENAME(WEEKDAY, GETDATE()) AS myAnswer;  --Output:Monday

--  DATEDIFF: CALCULATES SECONDS BETWEEN TWO DATES
SELECT DATEDIFF(SECOND, '2025-05-19 15:44:55.124', GETDATE()) AS SecondsElapsed;  --Output: 21002

--------------------------------------------------------------------------------------------------------
-- DATE OFFSET
-- WORKING WITH DATETIMEOFFSET

-- DECLARE DATETIMEOFFSET VALUE WITH TIME ZONE (+05:30)
DECLARE @myDateOffset AS DATETIMEOFFSET(2) = '2025-05-19 15:44:55.124 +05:30' -- 8–10 BYTES
			--(2) REDUCE byte size to 8 and not 10 --Output: 2025-05-19 15:44:55.12 +05:30
SELECT @myDateOffset AS MyDateOffset; --Output:2025-05-19 15:44:55.1240000 +05:30
GO

-- convert datetime2 to datetimeoffset using time zone
DECLARE @myDate AS DATETIME2 = '2025-05-19 15:44:55.124';
SELECT TODATETIMEOFFSET(@myDate, '+05:30') AS MyDateOffset; --Just adds timezone (not used ofr converting)
															--Output: 2025-05-19 15:44:55.1240000 +05:30

-- CREATE A DATETIME2 VALUE FROM SEPARATE PARTS
SELECT DATETIME2FROMPARTS(2025, 05, 19, 15, 44, 55, 456, 3);
															--Output: 2025-05-19 15:44:55.456

-- create  DATETIMEOFFSET from parts with offset
SELECT DATETIMEOFFSETFROMPARTS(2025, 05, 19, 15, 44, 55, 456, 5, 30, 3) AS MyDateOffset;
															--Output: 2025-05-19 15:44:55.456 +05:30

-- GET CURRENT DATE AND TIME WITH OFFSET
SELECT SYSDATETIMEOFFSET() AS TimeNowWithOffset; --Output: 2025-05-19 21:53:20.7866165 +02:00

-- get current UTC date and time
SELECT SYSUTCDATETIME() AS TimeNowUTC; --Output: 2025-05-19 19:53:29.7283716 (Coordinated Universal Time (UTC))

-- CHANGE THE TIME ZONE OF A DATETIMEOFFSET VALUE (changing timeZONE)
DECLARE @myDateOffset AS DATETIMEOFFSET = '2025-05-19 15:44:55.124 +05:30';
SELECT SWITCHOFFSET(@myDateOffset, '-05:00') AS MyDateOffsetTexas; --Output: 2025-05-19 05:14:55.1240000 -05:00

-------------------------------------------------------------------------------------------------------------------------------------
--CONVERTING FROM DATE TO STRINGS
-- Cannot directly concatenate string and datetime (will cause error)
DECLARE @mydate AS DATETIME = '2025-05-19 15:44:55.124';
SELECT 'The date and time is: ' + @mydate; -- Error message: Conversion failed when converting date and/or time from character string.
		

-- Convert datetime to string using NVARCHAR (dd.mm.yyyy)
DECLARE @mydate AS DATETIME = '2025-05-19 15:44:55.124'; 
SELECT 'The date and time is: ' +CONVERT(NVARCHAR(20), @mydate) AS MyConvertedDate;
						--Output: May 19 2025  3:44PM	
						--Output:The date and time is: May 19 2025  3:44PM (adding STRING before CONVERT FUNCTION)

--OR USE CAST for SAME output
-- Cast datetime to string using default format
DECLARE @mydate AS DATETIME = '2025-05-19 15:44:55.124'; --Output: May 19 2025  3:44PM	
SELECT CAST(@mydate AS NVARCHAR(20)) AS MyCastDate;

-- Try converting string to date safely
SELECT TRY_CONVERT(DATE, 'Monday, 19 May 2025') AS MyConvertedDate; --Output: NULL

--CONVERTING FROM STRING INTO DATE: USE PARSE
-- Parse string to date (culture sensitive)
SELECT PARSE('Monday, 19 May 2025' AS DATE) AS MyParsedDate; --Output: 

-- Parse Spanish date string using Spanish culture
SELECT PARSE('Lunes, 19 de mayo de 2025' AS DATE USING 'es-ES') AS MySpanishParsedDate;
										 --Output: 2025-05-19

--CONVERTING DATE INTO STRING USING FORMAT FUNCTION
-- Format datetime as long date (English)
SELECT FORMAT(CAST('2025-05-19 15:44:55.124' AS DATETIME), 'D') AS MyFormattedLongDate;
										 --Output: Monday, May 19, 2025

-- Format datetime as short date (English)
SELECT FORMAT(CAST('2025-05-19 15:44:55.124' AS DATETIME), 'd') AS MyFormattedShortDate;
										 --Output: 5/19/2025


-- Format datetime to British style date (dd-MM-yyyy)
SELECT FORMAT(CAST('2025-05-19 15:44:55.124' AS DATETIME), 'dd-MM-yyyy') AS MyFormattedBritishDate;
										 --Output: 19-05-2025

-- Format datetime as long date in simplified Chinese
SELECT FORMAT(CAST('2025-05-19 15:44:55.124' AS DATETIME), 'D', 'zh-CN') AS MyFormattedInternationalLongDate;
										 --Output: 2025年5月19日
