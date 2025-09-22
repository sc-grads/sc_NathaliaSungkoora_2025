//*EXAMPLES*//

SELECT * FROM SalesLT.SalesOrderDetail
WHERE ProductID=836
 
-- We can also use a comparison operator
 
SELECT * FROM SalesLT.SalesOrderDetail
WHERE OrderQty>5
 
-- We can have multiple conditions also
 
SELECT * FROM SalesLT.SalesOrderDetail
WHERE OrderQty>5 AND UnitPrice>100
 
-- Finding rows that are between values
 
SELECT * FROM SalesLT.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10;
 
-- Filtering string values
 
SELECT * FROM SalesLT.Customer
WHERE LastName='Gates';
 
-- Filtering on a list of values
 
SELECT * FROM SalesLT.Customer
WHERE LastName IN ('Gates','Harris','Harding')
 
-- Finding company names that include Sports in their name
 
SELECT * FROM SalesLT.Customer
WHERE CompanyName LIKE '%Sports%'