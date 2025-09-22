//*EXAMPLES*//

SELECT * FROM SalesLT.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10
ORDER BY UnitPrice;
 
SELECT * FROM SalesLT.SalesOrderDetail
WHERE OrderQty BETWEEN 5 and 10
ORDER BY OrderQty DESC;