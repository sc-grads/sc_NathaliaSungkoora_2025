/* IMPLEMENT AGGREGATE QUERIES*/

USE [70-461(2)];

SELECT * FROM [dbo].[tblAttendance]

SELECT E.Department, A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
FROM tblEmployee AS E
JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--OVER()

--look AT TABLE AGAIN (specify each column you want to see)
SELECT A.EmployeeNumber,
		A.AttendanceMonth,
		A.NumberAttendance
FROM tblEmployee AS E
JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber

-- Show attendance details with total and percentage
SELECT 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance,
    SUM(A.NumberAttendance) OVER() AS TotalAttendance,  -- Total for all rows
    CONVERT(DECIMAL(18,7), A.NumberAttendance) 
        / SUM(A.NumberAttendance) OVER() * 100.0000 AS PercentageAttendance  
FROM tblEmployee AS E 
JOIN tblAttendance AS A 
    ON E.EmployeeNumber = A.EmployeeNumber;


-- Check total attendance (for all employees)
SELECT SUM(NumberAttendance) AS TotalAttendance
FROM tblAttendance


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PARTITION BY AND ORDER BY

--ADDING A PARTITION BY:
SELECT 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance,
    SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber) AS TotalAttendance,  -- ADD PARTITION BY
    CONVERT(DECIMAL(18,7), A.NumberAttendance) 
        / SUM(A.NumberAttendance) OVER(PARTITION BY A.EmployeeNumber) * 100.0000 AS PercentageAttendance  
FROM tblEmployee AS E 
JOIN tblAttendance AS A 
ON E.EmployeeNumber = A.EmployeeNumber
WHERE A.AttendanceMonth < '20150101';

--EmployeeNumber 123 (ROW 1):
--NumberAttendance:14
--TotalAttendance:205
--PercentageAttendance:6.8292682926829268000000
--THIS means they worked 6.83% of all hours that he was going to work for the entire year

--ADD ORDER BY, PARTITION BY, ROWS BETWEEN:

SELECT 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance,
    SUM(A.NumberAttendance)
	OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth)
    ORDER BY A.AttendanceMonth, A.NumberAttendance 
	ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS RunningTotal
FROM tblEmployee AS E 
JOIN tblAttendance AS A 
ON E.EmployeeNumber = A.EmployeeNumber;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CURRENT ROW AND UNBOUNDED
-- Add up attendance for each employee from this month onward
SELECT 
    A.EmployeeNumber, 
    A.AttendanceMonth, 
    A.NumberAttendance,
    SUM(A.NumberAttendance)
	OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth)
    ORDER BY A.AttendanceMonth, A.NumberAttendance 
	ROWS BETWEEN CURRENT ROW  AND UNBOUNDED FOLLOWING) AS RunningTotal
FROM tblEmployee AS E 
JOIN tblAttendance AS A 
ON E.EmployeeNumber = A.EmployeeNumber;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--RANGE VS ROWS

SELECT	A.EmployeeNumber, 
		A.AttendanceMonth,
		A.NumberAttendance,

SUM(A.NumberAttendance) 
OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
     ORDER BY A.AttendanceMonth 
     ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS RowsTotal,

SUM(A.NumberAttendance) 
OVER(PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth) 
     ORDER BY A.AttendanceMonth 
     RANGE BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS RangeTotal

FROM tblEmployee AS E 
JOIN (SELECT * FROM tblAttendance 
      UNION ALL			--USE UNION ALL BECAUSE IT INCLUDES DUPLICATES
      SELECT * FROM tblAttendance) AS A
ON E.EmployeeNumber = A.EmployeeNumber
ORDER BY A.EmployeeNumber, A.AttendanceMonth;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ROW NUMBER, RANK AND DENSE RANK
-- ORDER BY must be included here and OVER must include a default
SELECT A.EmployeeNumber, A.AttendanceMonth, 
       A.NumberAttendance, 
       ROW_NUMBER() OVER (ORDER BY E.EmployeeNumber, A.AttendanceMonth) AS TheRowNumber,  
       -- Gives a unique number to each row, counting 1, 2, 3, ... even if values repeat

       RANK() OVER (ORDER BY E.EmployeeNumber, A.AttendanceMonth) AS TheRank,            
       -- Gives the same rank to rows with the same values, but skips numbers after ties
       -- (Output: if two rows are rank 1, the next rank will be 3)

       DENSE_RANK() OVER (ORDER BY E.EmployeeNumber, A.AttendanceMonth) AS TheDenseRank  
       -- Gives the same rank to ties, but no numbers are skipped after ties
       -- (Output: if two rows are rank 1, the next rank will be 2)
FROM tblEmployee AS E 
JOIN (SELECT * FROM tblAttendance UNION ALL SELECT * FROM tblAttendance) AS A
ON E.EmployeeNumber = A.EmployeeNumber;

-- Row number to all rows in tblAttendance without specific order
SELECT *, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) 
FROM tblAttendance;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--NTILE
-- HERE it DIVIDES rows into 10 groups per employee, ordered by month
SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
       NTILE(10) OVER (PARTITION BY E.EmployeeNumber
	   ORDER BY A.AttendanceMonth) AS TheNTILE  
FROM tblEmployee AS E 
JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber;



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FIRST VALUE AND LAST VALUE

SELECT A.EmployeeNumber, A.AttendanceMonth, 
       A.NumberAttendance, 

       -- Attendance of the FIRST month for each employee
       FIRST_VALUE(NumberAttendance)
       OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS FirstMonth,

       -- Attendance of the LAST month for each employee
       LAST_VALUE(NumberAttendance)
       OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth
       ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastMonth

FROM tblEmployee AS E 
JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--LAG AND LEAD

SELECT A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
        
       LAG(NumberAttendance, 1) 
       OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLag, -- previous month

       LEAD(NumberAttendance, 1) 
       OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyLead, -- next month
	   --USE CASE : used to see differences for example between different months
       NumberAttendance - LAG(NumberAttendance, 1) 
       OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyDiff -- diff from previous

FROM tblEmployee AS E 
JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--CUME_DIST and PERCENT_RANK

SELECT A.EmployeeNumber, A.AttendanceMonth, 
       A.NumberAttendance, 

       CUME_DIST() 
       OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyCume_Dist, -- BUILT-IN CUME_DIST 

       PERCENT_RANK() 
       OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS MyPercent_Rank, -- BUILT-IN PERCENT_RANK

       CAST(ROW_NUMBER() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) AS DECIMAL(9,5)) 
       / COUNT(*) OVER(PARTITION BY E.EmployeeNumber) AS CalcCume_Dist, -- MANUAL CUME_DIST 

       CAST(ROW_NUMBER() OVER(PARTITION BY E.EmployeeNumber ORDER BY A.AttendanceMonth) - 1 AS DECIMAL(9,5)) 
       / (COUNT(*) OVER(PARTITION BY E.EmployeeNumber) - 1) AS CalcPercent_Rank -- MANUAL PERCENT_RANK

FROM tblEmployee AS E 
JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PERCENTILE_CONT and PERCENTILE_DISC

-- Calculate CUME_DIST and PERCENT_RANK based on attendance
SELECT A.EmployeeNumber, A.AttendanceMonth, 
       A.NumberAttendance, 

       CUME_DIST() 
       OVER(PARTITION BY E.EmployeeNumber ORDER BY A.NumberAttendance) AS MyCume_Dist, 

       PERCENT_RANK() --Express as a %
       OVER(PARTITION BY E.EmployeeNumber ORDER BY A.NumberAttendance) * 100 AS MyPercent_Rank 

FROM tblEmployee AS E 
JOIN tblAttendance AS A
ON E.EmployeeNumber = A.EmployeeNumber;


-- 40th PERCENTILE (continuous and discrete methods)
SELECT DISTINCT EmployeeNumber,

       PERCENTILE_CONT(0.4) 
       WITHIN GROUP (ORDER BY NumberAttendance) 
       OVER (PARTITION BY EmployeeNumber) AS AverageCont, 

       PERCENTILE_DISC(0.4) 
       WITHIN GROUP (ORDER BY NumberAttendance) 
       OVER (PARTITION BY EmployeeNumber) AS AverageDisc --EXACT MATCH

FROM tblAttendance;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ADDING TOTALS

SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth AS AttendanceMonth, 
       SUM(A.NumberAttendance) AS NumberAttendance
FROM tblEmployee AS E 
JOIN tblAttendance AS A ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY E.Department, E.EmployeeNumber, A.AttendanceMonth --(3)
-- Can't have an ORDER BY in the middle 

UNION
								--Can't use string or number here
SELECT E.Department, E.EmployeeNumber, NULL AS AttendanceMonth,
       SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E 
JOIN tblAttendance AS A ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY E.Department, E.EmployeeNumber --(2)

UNION

SELECT E.Department, NULL, NULL AS AttendanceMonth, 
       SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E 
JOIN tblAttendance AS A ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY E.Department --(1)

UNION

SELECT NULL, NULL, NULL AS AttendanceMonth, 
       SUM(A.NumberAttendance) AS TotalAttendance
FROM tblEmployee AS E 
JOIN tblAttendance AS A ON E.EmployeeNumber = A.EmployeeNumber
--GROYP BY (0)

ORDER BY Department, EmployeeNumber, AttendanceMonth; 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ROLLUP, GROUPING and GROUPING_ID

-- TOTALS and SUBTOTALS by DEPARTMENT, EMPLOYEE, MONTH (WITHOUT using UNION, but ROLLUP)

SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth AS AttendanceMonth, 
       SUM(A.NumberAttendance) AS NumberAttendance,

       GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy,

       GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) AS EmployeeNumberGroupedID 

FROM tblEmployee AS E 
JOIN tblAttendance AS A ON E.EmployeeNumber = A.EmployeeNumber 

GROUP BY ROLLUP (E.Department, E.EmployeeNumber, A.AttendanceMonth)

ORDER BY Department, EmployeeNumber, AttendanceMonth; 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--GROUPING SETS
-- Show detail, DEPARTMENT TOTAL, and GRAND TOTAL

SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth AS AttendanceMonth, 
       SUM(A.NumberAttendance) AS NumberAttendance,

       GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy, 

       GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) AS EmployeeNumberGroupedID 

FROM tblEmployee AS E 
JOIN tblAttendance AS A ON E.EmployeeNumber = A.EmployeeNumber

GROUP BY GROUPING SETS ( (E.Department, E.EmployeeNumber, A.AttendanceMonth), 
                         (E.Department), 
                         () )

ORDER BY COALESCE(Department, 'zzzzzzz'), 
         COALESCE(E.EmployeeNumber, 99999), 
         COALESCE(AttendanceMonth, '2100-01-01');



-- SAME query with better NULL sorting

SELECT E.Department, E.EmployeeNumber, A.AttendanceMonth AS AttendanceMonth, 
       SUM(A.NumberAttendance) AS NumberAttendance,

       GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy, -- 1 = subtotal

       GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) AS EmployeeNumberGroupedID -- subtotal level

FROM tblEmployee AS E 
JOIN tblAttendance AS A ON E.EmployeeNumber = A.EmployeeNumber

GROUP BY GROUPING SETS ( (E.Department, E.EmployeeNumber, A.AttendanceMonth), 
                         (E.Department), 
                         () )

ORDER BY CASE WHEN Department       IS NULL THEN 1 ELSE 0 END, Department, 
         CASE WHEN E.EmployeeNumber IS NULL THEN 1 ELSE 0 END, E.EmployeeNumber, 
         CASE WHEN AttendanceMonth  IS NULL THEN 1 ELSE 0 END, AttendanceMonth;
