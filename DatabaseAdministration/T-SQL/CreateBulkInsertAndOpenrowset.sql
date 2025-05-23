/*BULK INSERT AND OPENROWSET*/

USE [70-461(2)];


-- Create a table with one XML column
CREATE TABLE #tblXML(XmlCol XML)
GO

-- Bulk insert raw XML data from file into the table
BULK INSERT #tblXML 
FROM 'C:\XML\SampleDataBulkInsert.txt'


-- View the loaded data
SELECT * FROM #tblXML

-- Drop the table again to reuse it
DROP TABLE #tblXML
GO


--ALTERNATIVE way:
-- Create table with an identity/int column and an XML column
CREATE TABLE #tblXML(IntCol INT, XmlCol XML)
GO

-- Load entire XML file as a single BLOB (binary large object) into XML column
INSERT INTO #tblXML(XmlCol)
SELECT * 
FROM OPENROWSET(BULK 'C:\XML\SampleDataOpenRowset.txt', SINGLE_BLOB) AS x


-- View the contents of the table
SELECT * FROM #tblXML
