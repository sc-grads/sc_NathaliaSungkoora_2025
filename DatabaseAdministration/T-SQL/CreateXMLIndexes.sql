/* XML INDEXES */


DECLARE @x1 XML, @x2 XML;

SET @x1 = '<Shopping ShopperName="Phillip Burton" >  
<ShoppingTrip ShoppingTripID="L1" >  
  <Item Cost="5">Bananas</Item>  
  <Item Cost="4">Apples</Item>  
  <Item Cost="3">Cherries</Item>
</ShoppingTrip></Shopping>';

SET @x2 = '<Shopping ShopperName="Phillip Burton" >
<ShoppingTrip ShoppingTripID="L2" >  
  <Item>Emeralds</Item>  
  <Item>Diamonds</Item>  
  <Item>Furniture
        <Color></Color></Item>  
</ShoppingTrip>  
</Shopping>';

DROP TABLE IF EXISTS #tblXML;

--CREATE table and insert data into it
CREATE TABLE #tblXML (
    pkXML INT PRIMARY KEY,
    xmlCol XML
);

INSERT INTO #tblXML(pkXML, xmlCol) VALUES (1, @x1);
INSERT INTO #tblXML(pkXML, xmlCol) VALUES (2, @x2);

-- Create PRIMARY XML index to speed up XML queries
CREATE PRIMARY XML INDEX pk_tblXML ON #tblXML(xmlCol);

-- Create SECONDARY XML indexes to optimize different XML operations:
-- PATH index optimizes queries using XML PATH expressions
CREATE XML INDEX secpk_tblXML_Path ON #tblXML(xmlCol)
    USING XML INDEX pk_tblXML FOR PATH;

-- VALUE index optimizes queries searching XML values
CREATE XML INDEX secpk_tblXML_Value ON #tblXML(xmlCol)
    USING XML INDEX pk_tblXML FOR VALUE;

-- PROPERTY index optimizes queries accessing XML attributes and properties
CREATE XML INDEX secpk_tblXML_Property ON #tblXML(xmlCol)
    USING XML INDEX pk_tblXML FOR PROPERTY; --USEFUL WHEN MULTIPLE VALUES ARE BEING RETRIEVED
