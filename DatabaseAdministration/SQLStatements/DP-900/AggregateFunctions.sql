//*EXAMPLES*//

SELECT COUNT(ProductID) AS 'Count of Products' FROM SalesLT.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10;
 
SELECT ProductID FROM SalesLT.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10 
ORDER BY ProductID;
 
SELECT COUNT(DISTINCT(ProductID)) AS 'Count of Products' FROM SalesLT.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10;
 
SELECT MAX(OrderQty) FROM SalesLT.SalesOrderDetail;
 
SELECT ProductID,MAX(OrderQty) FROM SalesLT.SalesOrderDetail;