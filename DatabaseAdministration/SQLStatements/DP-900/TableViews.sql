/*EXAMPLES*/

CREATE VIEW ProductOrderView
AS
SELECT p.ProductID,p.Name,p.ListPrice,o.OrderQty,o.LineTotal
FROM SalesLT.Product p INNER JOIN SalesLT.SalesOrderDetail o
ON (p.ProductID = o.ProductID);
 
SELECT * FROM ProductOrderView;
 
DROP VIEW ProductOrderView;
