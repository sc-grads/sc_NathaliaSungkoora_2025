/* Writing first queries*/

USE [70-461];


/* Writing first queries*/

SELECT 1 + 1  AS Result --Creating a column name
GO

SELECT 1 * 1  AS Result	
GO


-- PRACTICE QUIZ
--1. What is 4 plus 9? Please call the column MyAnswer.
SELECT 4 + 9  AS MyAnswer
GO --Output:13

--2. What is 15 minus 26? Please call the column Balance.
SELECT 15 - 26  AS Balance
GO --Output:-11


--3. What is 24 times 4 plus 3? Please call the column MyResponse.
SELECT (24*4) +3 AS MyResponse
GO --Output:99

--4. What is 48 divided by 4? Please call the column Result.
SELECT 48/4 AS Result
GO --Output:12

-- SELECT statement that returns namely the calculation of 11 times (or multiplied by) 12.
-- This column/field should be named TheAnswer.

SELECT 11*12 AS TheAnswer
GO --Output:132
