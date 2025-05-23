/*SHREDDING XML DATA*/

--XQUERY VALUE AND EXIST METHODS
DECLARE @x XML  
SET @x = '<Shopping ShopperName="Nathalia Sungkoora">  
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

-- Get the Cost attribute of the first Item element under ShoppingTrip
SELECT @x.value('(/Shopping/ShoppingTrip/Item/@Cost)[1]', 'varchar(50)')
--SELECT @x.exist('(/Shopping/ShoppingTrip/Item/@Cost)[1]', 'varchar(50)')
--EXIST Checks if it exists or not (Returns 1 or 0)

-------------------------------------------------------------------------------------------------------
--XQUERY MODIFY METHOD

--Want to replace cost of Cherries from 5 -> 6

DECLARE @x XML  
SET @x = '<Shopping ShopperName="Nathalia Sungkoora">  
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

-- Update the Cost attribute
SET @x.modify('replace value of (/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1] with "6.0"')
SELECT @x

-- Insert a new Item with Cost=5 into the 2nd ShoppingTrip
SET @x.modify('insert <Item Cost="5">New Food</Item> into (/Shopping/ShoppingTrip)[2]')
SELECT @x



-------------------------------------------------------------------------------------------------------
--XQUERY QUERY METHOD USING FOR AND RETURN


--FLWOR (FOR, LET, WHERE, ORDER BY, RETURN)

DECLARE @x XML  
SET @x = '<Shopping ShopperName="Nathalia Sungkoora">  
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
-- Return the XML nodes for all Item elements under all ShoppingTrips
SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item
                 return $ValueRetrieved')

-- Return the text content of all Item elements as strings
SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip/Item
                 return string($ValueRetrieved)')

-- Return text content of each Item in the first ShoppingTrip with a semicolon appended
SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item
                 return concat(string($ValueRetrieved),";")')


-------------------------------------------------------------------------------------------------------
--XQUERY QUERY METHOD USING LET, WHERE, AND ORDER BY (FLWOR)

--FLWOR (FOR, LET, WHERE, ORDER BY, RETURN)

DECLARE @x XML  
SET @x = '<Shopping ShopperName="Nathalia Sungkoora">  
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

-- Return items from the first ShoppingTrip where Cost >= 4, ordered by Cost
SELECT @x.query('for $ValueRetrieved in /Shopping/ShoppingTrip[1]/Item
                 let $CostVariable := $ValueRetrieved/@Cost  
                 where $CostVariable >= 4
                 order by $CostVariable
                 return concat(string($ValueRetrieved),";")')
				 ----colon and equal sign

-------------------------------------------------------------------------------------------------------
--XQUERY NODES – SHREDDING A VARIABLE

--FLWOR (FOR, LET, WHERE, ORDER BY, RETURN) Used in XQuery FLWOR expressions

DECLARE @x XML  
SET @x = '<Shopping ShopperName="Nathalia Sungkoora">  
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

-- Extract item names and their Cost attributes from XML and insert into a temporary table
SELECT tbl.col.value('.', 'varchar(50)') AS Item,               -- Item name
       tbl.col.value('@Cost', 'varchar(50)') AS Cost            -- Cost attribute
INTO tblTemp
FROM @x.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)

-- Display the contents of the temporary table
SELECT * FROM tblTemp

-- Drop the temporary table
DROP TABLE tblTemp

-------------------------------------------------------------------------------------------------------
--XQUERY NODES – SHREDDING A TABLE

DECLARE @x1 XML, @x2 XML  
SET @x1 = '<Shopping ShopperName="Nathalia Sungkoora">  
<ShoppingTrip ShoppingTripID="L1">  
  <Item Cost="5">Bananas</Item>  
  <Item Cost="4">Apples</Item>  
  <Item Cost="3">Cherries</Item>
</ShoppingTrip></Shopping>'

SET @x2 = '<Shopping ShopperName="Nathalia Sungkoora">  
<ShoppingTrip ShoppingTripID="L2">  
  <Item>Emeralds</Item>  
  <Item>Diamonds</Item>  
  <Item>Furniture</Item>  
</ShoppingTrip></Shopping>'

-- Drop temporary table if it already exists
DROP TABLE IF EXISTS #tblXML

-- Create temporary table with primary key and XML column
CREATE TABLE #tblXML (
    pkXML INT PRIMARY KEY,
    xmlCol XML
)

-- Insert XML data into temporary table
INSERT INTO #tblXML(pkXML, xmlCol) VALUES (1, @x1)
INSERT INTO #tblXML(pkXML, xmlCol) VALUES (2, @x2)

-- View full XML content in table
SELECT * FROM #tblXML

-- Extract the 'Cost' attribute from all <Item> elements across all rows
SELECT tbl.col.value('@Cost', 'VARCHAR(50)') AS Cost
FROM #tblXML
CROSS APPLY xmlCol.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col)


