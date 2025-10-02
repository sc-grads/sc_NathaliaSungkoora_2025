/*SQL Statements in Microsoft Fabric*/


SELECT * 
FROM purchases;


--Using an Alias
SELECT Date, Subtype, PurchaseMethod AS Method
FROM purchases;


SELECT Date, Subtype, PurchaseMethod AS "Purchase Method"
FROM purchases;


SELECT Date, Subtype, PurchaseMethod AS 'Purchase Method'
FROM purchases;


--Adding new Columns (Strings)
SELECT Subtype, PurchaseMethod, Subtype + ' ' + PurchaseMethod
FROM purchases;

--CONCAT FUNCTION
SELECT Subtype, PurchaseMethod,CONCAT( Subtype, ' ' ,PurchaseMethod
FROM purchases;


--CONCAT WS->CONCATE WITH SEPERATOR
SELECT Subtype, PurchaseMethod,CONCAT_WS(' ' ,Subtype, PurchaseMethod)
FROM purchases;


SELECT Subtype, LEFT(Subtype,1)), RIGHT(Subtype,1), SUBSTRING(Subtype 2,1)
FROM purchases

--TRIM FUNCTION

SELECT Subtype, TRIM(SUBSTRING(Subtype, 6, 1) + SUBTYPE + SUBSTRING(Subtype, 11, 1)
FROM purchases

--UPPER
SELECT UPPER(Subtype)
FROM purchases;

--MISCELLANEOUS

SELECT Subtype, REPLACE(Subtype, 'Misc', 'Miscellaneous')
FROM purchases;



--Adding new Columns (Mathematical Functions)

SELECT Out, Out+10,Out-10,Out*10,Out/10
FROM purchases;

SELECT Out, SQUARE(Out), SQRT(Out)
FROM purchases;

SELECT Out, FLOOR(Out),CEILING(Out),ROUND(Out)
FROM purchases;

SELECT Out,ROUND(Out)
FROM purchases;


SELECT Out,ROUND(Out), SIGN(Out-7.9)
FROM purchases;


SELECT Out,ROUND(Out), SIGN(Out-7.9), ABS(-7.9)
FROM purchases;


--Adding new Columns (Date and Time Functions)

SELECT Date,DATEADD(Day, 1, Date)
FROM purchases;


SELECT Date,DATEADD(Day, 1, Date), DATEADD(MONTH, 1, Date), DATEADD(DAY, 1, Date)
FROM purchases;

SELECT Date, DATETRUNC(WEEK, Date)
FROM purchases;

SELECT Date, DATETRUNC(WEEK, Date), EOMONTH(Date)
FROM purchases;

SELECT Date, DATETRUNC(WEEK, Date), EOMONTH(Date), DATEDIFF(Day,DATETRUNC(WEEK, Date), EOMONTH(Date)) 
FROM purchases;

SELECT Date,DAY(Date),MONTH(Date), YEAR(Date), DATENAME(WEEKDAY,Date), DATEPART(WEEKDAY, Date)
FROM purchases;

SELECT CURRENT_TIMESTAMP, GETDATE(), SYSDATETIME()
FROM purchases;

--CONVERTING BETWEEN DATES

SELECT Date, CAST(Date, DATETIME2), CONVERT(DATETIME2, Date)
FROM purchases;


SELECT TRY_CAST('31/02/2027'AS Date) --Otherwise returns NULL

SELECT PARSE('31/02/2027'AS Date USING 'en-GB')

SELECT 'Date is: ' + FORMAT(CAST(Date AS DATE), 'dddd dd MMMM yyyy')
FROM purchases;

SELECT Subtype, CAST(Subtype AS CHAR(20)) + '.'
FROM purchases;

--FILTERING
SELECT ID, PName
 FROM ProductCategory
 WHERE ParentID <> 3

 --AGGREGATION
 SELECT CategoryID, COUNT(*) AS NumberOfRows
FROM ProductCategory
GROUP BY CategoryID 

--REARRANGING RESULTS
SELECT CategoryID, count(*) as NumberOfRows
FROM ProductCategory
GROUP BY CategoryID
HAVING count(*)>=10
ORDER BY NumberOfRows DESC

--REMOVING DUPLICATES

SELECT DISTINCT PurchaseMethod
FROM purchases

SELECT DISTINCT PurchaseMethod, Subtype
FROM purchases


SELECT DISTINCT PurchaseMethod, Subtype, COUNT(*)
FROM purchases
GROUP BY PurchaseMethod, Subtype
HAVING COUNT(*)>1

--UNION

SELECT Subtype
FROM purchases
UNION 
SELECT Subtype
FROM purchasesapril


SELECT Subtype
FROM purchases
UNION ALL --Includes DUPLICATES
SELECT Subtype
FROM purchasesapril

SELECT Subtype, PurchaseMethod, CAST(Date AS DATE) AS Date, Out
FROM purchases
UNION ALL 
SELECT Subtype
FROM purchasesapril

--MERGE
SELECT Date, P.Subtype, PurchaseMethod, Out, Category, PC.Subtype
FROM purchases AS P
JOIN purchasecategory AS PC
ON P.Subtype=PC.Subtype

SELECT Date, P.Subtype AS PurchaseSubtype, PurchaseMethod, Out, Category, PC.Subtype AS CategorySubtype
FROM purchases AS P
INNER JOIN purchasecategory AS PC
ON P.Subtype=PC.Subtype

--HANDLING NULLS
SELECT Date, P.Subtype AS PurchaseSubtype, PurchaseMethod, Out, Category, PC.Subtype AS CategorySubtype
FROM purchases AS P
FULL JOIN purchasecategory AS PC
ON P.Subtype=PC.Subtype
WHERE PurchaseMethod IS NOT NULL


SELECT Date, P.Subtype AS PurchaseSubtype, PurchaseMethod, Out, Category,
PC.Subtype AS CategorySubtype, COALESCE(P.Subtype, PC.Subtype)
FROM purchases AS P
FULL JOIN purchasecategory AS PC
ON P.Subtype=PC.Subtype


--CONDITIONALS
SELECT Date, P.Subtype AS PurchaseSubtype, PC.Subtype AS CategorySubtype,
			CASE WHEN P.Subtype IS NOT NULL THEN P.Subtype
				CASE WHEN P.Subtype IS NOT NULL THEN PC.Subtype
				ELSE NULL END
FROM purchases AS P
FULL JOIN purchasecategory AS PC
ON P.Subtype=PC.Subtype

SELECT Date, P.Subtype AS PurchaseSubtype, PC.Subtype AS CategorySubtype,
			CASE WHEN P.Subtype IS NOT NULL THEN P.Subtype
				CASE WHEN P.Subtype IS NOT NULL THEN PC.Subtype
				ELSE NULL END,
			CASE P.Subtype WHEN 'Misc' THEN 'Miscellaneous'
							WHEN 'Other' THEN 'Miscellaneous'
							END	
FROM purchases AS P
FULL JOIN purchasecategory AS PC
ON P.Subtype=PC.Subtype

--CREATING A BRIDGE TABEL IN A LAKEHOUSE
DROP TABLE IF EXISTS tblTargetSum
 
CREATE TABLE tblTargetSum
(Country VARCHAR(20), TotalTarget INT)
 
DROP TABLE IF EXISTS tblActualSum
 
CREATE TABLE tblActualSum
(Country VARCHAR(20), TotalActual INT)
 
INSERT INTO tblActualSum (Country, TotalActual) VALUES
('England', 4000), ('France', 16000), ('Italy', 23000);
 
INSERT INTO tblTargetSum (Country, TotalTarget) VALUES
('England', 12000),  ('France', 10500),('Germany', 15000);

--RUNNING TOTAL
SELECT Counrty, Location, Actual, SUM(TOTALActual) OVER(ORDER BY Country DESC) AS RunningTotal
FROM tblActual

SELECT Counrty, Location, Actual, SUM(TOTALActual) OVER(ORDER BY Country, Location) AS RunningTotal
FROM tblActual

SELECT Counrty, Location, Actual, SUM(TOTALActual) OVER(PARTITION BY Country ORDER BY  Location) AS RunningTotal
FROM tblActual


--CREATING VIEW
CREATE VIEW dbo.view_AddressData
AS
SELECT *
FROM [DemoLakehouse].[dbo]. [AddressData]


--CREATING A  STORED PROCEDURE

DROP PROC dbo.proc_AddressData
GO

CREATE PROC dbo.proc_AddressData @Country VARCHAR(20)
AS
SELECT* 
FROM view_AddressData

SELECT * 
FROM view AddressData2
WHERE CountryRegion = @Country

--EXECUTE STORED PROCEDURE
EXEC dbo.proc_AddressData "Canada"


--CREATING A FUNCTION: Returns a Table
CREATE FUNCTION dbo.func_AddressData (@Country AS VARCHAR(20)= 'Canada')
RETURNS TABLE
AS
RETURN
SELECT* 
FROM AddressData
WHERE CountryRegion= @Country


--Using FUNCTION
Select * 
FROM func_AddressData ('Canada')

Select AddressID, City
FROM func_AddressData ('Canada')
