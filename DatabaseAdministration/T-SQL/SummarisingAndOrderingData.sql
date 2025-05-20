/* SUMMARISING AND ORDERING DATA */

--SUMMARISING AND ORDERING DATA

-- BETWEEN FUNCTION: employees born between  1976 and 1986 (inclusive)
SELECT * FROM tblEmployee
WHERE DateOfBirth BETWEEN '19760101' AND '19861231';

-- CHANGING how it is viewed: employees born from1976 up to but not including 1 Jan 1987
SELECT * FROM tblEmployee
WHERE DateOfBirth >= '19760101' AND DateOfBirth < '19870101'; --less than next day so includes the day

-- DO NOT USE: Using functions like YEAR() in WHERE clause can hurt performance
--Want to use field and not calculation of a field (like examples above)
SELECT * FROM tblEmployee
WHERE YEAR(DateOfBirth) BETWEEN 1976 AND 1986;

-- GROUP EMPLOYEES BY BIRTH YEAR AND COUNT THEM
--Start with SELECT * FROM tblEMployee to get columns using intelisense

SELECT YEAR(DateOfBirth) AS YearOfDateOfBirth, COUNT(*) AS NumberBorn
FROM tblEmployee								--COUNT number of Rows
GROUP BY YEAR(DateOfBirth); --IF use count have to use GROUP
--GROUPING each row(year)


-- same as above with GROUP BY, using WHERE 1=1 (placeholder for adding more filters)
SELECT YEAR(DateOfBirth) AS YearOfDateOfBirth, COUNT(*) AS NumberBorn
FROM tblEmployee
WHERE 1=1
GROUP BY YEAR(DateOfBirth); --CAnt't use Alias in GROUP BY
-- NON-DETERMINISTIC: no guarantee of order in results

-- same query with ORDER BY to ensure consistent output
SELECT YEAR(DateOfBirth) AS YearOfDateOfBirth, COUNT(*) AS NumberBorn
FROM tblEmployee
WHERE 1=1
GROUP BY YEAR(DateOfBirth)
ORDER BY YEAR(DateOfBirth) DESC;
-- DETERMINISTIC: result is sorted by year (latest first)

------------------------------------------------------------------------------
--CRITERIA ON SUMMARISED DATA

---- USING LEFT: GETs THE FIRST LETTER OF EACH EMPLOYEE'S LAST NAME
SELECT LEFT(EmployeeLastName, 1) AS Initial
FROM tblEmployee;

-- COUNT HOW MANY EMPLOYEES HAVE LAST NAMES STARTING WITH EACH LETTER
SELECT LEFT(EmployeeLastName, 1) AS Initial, COUNT(*) AS CountOfInitial
FROM tblEmployee
GROUP BY LEFT(EmployeeLastName, 1) --OUTPUT: non-deterministic: result will vary everytime
ORDER BY  LEFT(EmployeeLastName, 1)

-- Order by COUNT: COUNT HOW MANY EMPLOYEES HAVE LAST NAMES STARTING WITH EACH LETTER
SELECT LEFT(EmployeeLastName, 1) AS Initial, COUNT(*) AS CountOfInitial
FROM tblEmployee
GROUP BY LEFT(EmployeeLastName, 1) --OUTPUT: non-deterministic: result will vary everytime
ORDER BY COUNT(*) DESC; -- MOST COMMON INITIALS FIRST

-- ADD IN SELECT( TOP(5) ): Gets top 5 most common first letters of last names
SELECT TOP(5) LEFT(EmployeeLastName, 1) AS Initial, COUNT(*) AS CountOfInitial
FROM tblEmployee
GROUP BY LEFT(EmployeeLastName, 1)
ORDER BY COUNT(*) DESC;

--Exapnd Using HAVING CLAUSE: 
--Having 50 Rows or more

SELECT LEFT(EmployeeLastName, 1) AS Initial, COUNT(*) AS CountOfInitial
FROM tblEmployee
GROUP BY LEFT(EmployeeLastName, 1)
HAVING COUNT(*) >= 50   --EXpand with HAVING
ORDER BY CountOfInitial DESC; --Output: gives you top 7 


--Adding WHERE CLAUSE 
--only initials with 20 or more people born after 1 Jan 1986
SELECT LEFT(EmployeeLastName, 1) AS Initial, COUNT(*) AS CountOfInitial
FROM tblEmployee
WHERE DateOfBirth > '19860101'
GROUP BY LEFT(EmployeeLastName, 1)
HAVING COUNT(*) >= 20   --EXpand with HAVING: FILETRING MORE
ORDER BY CountOfInitial DESC; --Can use alias here

-------------------------------------------------------------------------------------------------------------
--CHANGING BLANK MIDDLENAME ROWS TO NULL
Update tblEmployee
SET EmployeeMiddleName = NULL
WHERE EmployeeMiddleName = ''

-------------------------------------------------------------------------------------------------------------
--EXERCISE
SELECT DATEPART(MONTH, DateOfBirth) AS MonthNumber
FROM tblEmployee;

SELECT DATEPART(MONTH, DateOfBirth) AS MonthNumber, COUNT (*) AS NumberofEmployees
FROM tblEmployee
GROUP BY DATEPART(MONTH, DateOfBirth) ;

--USing Datename to get name of month instead of number
SELECT DATENAME(MONTH, DateOfBirth) AS MonthNumber, COUNT (*) AS NumberofEmployees
FROM tblEmployee
GROUP BY DATENAME(MONTH, DateOfBirth) , DATEPART(MONTH, DateOfBirth)
ORDER BY DATEPART(MONTH, DateOfBirth);
	--Can ONLY ORDER BY something that is in the GROUP BY or SELECT


--Counting Employee Middle name:
SELECT DATENAME(MONTH, DateOfBirth) AS MonthNumber, COUNT (*) AS NumberofEmployees,
COUNT(EmployeeMiddleName) AS NumberOfMiddleNames --only count those not null
FROM tblEmployee
GROUP BY DATENAME(MONTH, DateOfBirth) , DATEPART(MONTH, DateOfBirth)
ORDER BY DATEPART(MONTH, DateOfBirth);


--Counting All Employee Middle names then subtracting those that are not null:
SELECT DATENAME(MONTH, DateOfBirth) AS MonthNumber, COUNT (*) AS NumberofEmployees,
COUNT(EmployeeMiddleName) AS NumberOfMiddleNames, --only count those not null
COUNT(*) -COUNT(EmployeeMiddleName) AS NotMiddleNames
FROM tblEmployee
GROUP BY DATENAME(MONTH, DateOfBirth) , DATEPART(MONTH, DateOfBirth)
ORDER BY DATEPART(MONTH, DateOfBirth);


--Earliest DATEOFBIRTH for each MONTH: USE MIN
--Latest DATEOFBIRTH for each MONTH: USE MAX
SELECT DATENAME(MONTH, DateOfBirth) AS MonthNumber, COUNT (*) AS NumberofEmployees,
COUNT(EmployeeMiddleName) AS NumberOfMiddleNames, --only count those not null
COUNT(*) -COUNT(EmployeeMiddleName) AS NotMiddleNames,
MIN(DateOfBirth) AS EarliestDateOfBirth,--Don't need to go in group by because they are sumamrising data
MAX(DateOfBirth) AS LatestDateOfBirth
FROM tblEmployee
GROUP BY DATENAME(MONTH, DateOfBirth) , DATEPART(MONTH, DateOfBirth)
ORDER BY DATEPART(MONTH, DateOfBirth);


--FORMAT DATES TO STRINGS:
SELECT DATENAME(MONTH, DateOfBirth) AS MonthNumber, COUNT (*) AS NumberofEmployees,
COUNT(EmployeeMiddleName) AS NumberOfMiddleNames, --only count those not null
COUNT(*) -COUNT(EmployeeMiddleName) AS NotMiddleNames,
FORMAT(MIN(DateOfBirth), 'dd-MM-yy') AS EarliestDateOfBirth,--Don't need to go in group by because they are sumamrising data
FORMAT(MAX(DateOfBirth), 'D') AS LatestDateOfBirth --Format to long date 'D'
FROM tblEmployee
GROUP BY DATENAME(MONTH, DateOfBirth) , DATEPART(MONTH, DateOfBirth)
ORDER BY DATEPART(MONTH, DateOfBirth);