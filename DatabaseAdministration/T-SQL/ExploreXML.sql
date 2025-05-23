/*EXPLORE XML IN SQL SERVER*/

--CREATE XML OUTPUT
DECLARE @x XML

-- Set XML content
SET @x = '<Shopping ShopperName="Nathalia Sungkoora" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

-- Display XML content
SELECT @x AS XMLOutput

--USING XML IN SQL SERVER
--ADD XML To a row in Employee Table:

--(1) Create a temporary column
ALTER TABLE [dbo].[tblEmployee]
ADD XMLOutput XML NULL

DECLARE @x XML

-- Set XML content
SET @x = '<Shopping ShopperName="Nathalia Sungkoora" Weather="Nice">
<ShoppingTrip ShoppingTripID="L1">
    <Item Cost="5">Bananas</Item>
    <Item Cost="4">Apples</Item>
    <Item Cost="3">Cherries</Item>
</ShoppingTrip>
<ShoppingTrip ShoppingTripID="L2">
    <Item>Emeralds</Item>
    <Item>Diamonds</Item>
    <Item>Furniture</Item>
</ShoppingTrip>
</Shopping>'

-- Display XML content
SELECT @x 

-- Update XML column for employee 200
UPDATE [dbo].[tblEmployee] 
SET XMLOutput = @x
WHERE EmployeeNumber = 200

-- View updated employee row
SELECT * FROM [dbo].[tblEmployee]

--DROP COLUMN ONCE DONE TESTING:
ALTER TABLE [dbo].[tblEmployee]
DROP COLUMN XMLOutput


-----------------------------------------------------------------------------------------------------------------------------------------------------------
--FOR XML RAW
--SELF CONTAINED ELEMENTS WHERE EACH ELEMENT CONTAINS ALL THE INFORMATION

SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName,
       E.DateOfBirth, T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML RAW('MyRow'), ELEMENTS --CREATING INDIVIDUAL ELEMENTS


-----------------------------------------------------------------------------------------------------------------------------------------------------------
--FOR XML AUTO


SELECT E.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName,
       E.DateOfBirth, T.Amount, T.DateOfTransaction
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber
WHERE E.EmployeeNumber BETWEEN 200 AND 202
FOR XML AUTO, ELEMENTS -- Output results as XML with nested elements for each column


-----------------------------------------------------------------------------------------------------------------------------------------------------------
--FOR XML PATH

SELECT E.EmployeeFirstName AS '@EmployeeFirstName', -- Employee first name as XML attribute
       E.EmployeeLastName AS '@EmployeeLastName',   -- Employee last name as XML attribute
       E.EmployeeNumber,                            -- Employee number as element
       E.DateOfBirth,                               -- Date of birth as element
       T.Amount AS 'Transaction/Amount',            -- Transaction amount nested inside Transaction element
       T.DateOfTransaction AS 'Transaction/DateOfTransaction' -- Transaction date nested inside Transaction element
FROM [dbo].[tblEmployee] AS E
LEFT JOIN [dbo].[tblTransaction] AS T
ON E.EmployeeNumber = T.EmployeeNumber             
WHERE E.EmployeeNumber BETWEEN 200 AND 202        
FOR XML PATH('Employees'), ROOT('MyXML')            -- Output as XML with 'Employees' elements and 'MyXML' root


-----------------------------------------------------------------------------------------------------------------------------------------------------------
--FOR XML EXPLICIT
--Table 1: Employee Table
SELECT 1 AS Tag, NULL AS Parent, --Tag gives ROOT
       E.EmployeeFirstName AS [Elements!1!EmployeeFirstName],  -- Parent element with employee info
       E.EmployeeLastName AS [Elements!1!EmployeeLastName],
       E.EmployeeNumber AS [Elements!1!EmployeeNumber],
       E.DateOfBirth AS [Elements!1!DateOfBirth],
       NULL AS [Elements!2!Amount],                            -- Child element placeholders
       NULL AS [Elements!2!DateOfTransaction]
FROM [dbo].[tblEmployee] AS E
WHERE E.EmployeeNumber BETWEEN 200 AND 202

UNION ALL --UNION ALL both Table 1 and Table 2

--Table 2: Amount and data Transaction Table
SELECT 2 AS Tag, 1 AS Parent,
       NULL AS [EmployeeFirstName],
       NULL AS [EmployeeLastName],
       T.EmployeeNumber,
       NULL AS DateOfBirth,
       Amount,                                                -- Child element with transaction info
       DateOfTransaction
FROM [dbo].[tblTransaction] AS T
INNER JOIN [dbo].[tblEmployee] AS E ON T.EmployeeNumber = E.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 200 AND 202

ORDER BY EmployeeNumber, [Elements!2!Amount]

FOR XML EXPLICIT   -- Use explicit mode to define custom XML hierarchy and elements

