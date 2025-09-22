//*EXAMPLES*//

SELECT SalesLT.Product.ProductID,Name,ListPrice,OrderQty,LineTotal
FROM SalesLT.Product INNER JOIN SalesLT.SalesOrderDetail
ON (SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID);
 
SELECT p.ProductID,p.Name,p.ListPrice,o.OrderQty,o.LineTotal
FROM SalesLT.Product p INNER JOIN SalesLT.SalesOrderDetail o
ON (p.ProductID = o.ProductID);
