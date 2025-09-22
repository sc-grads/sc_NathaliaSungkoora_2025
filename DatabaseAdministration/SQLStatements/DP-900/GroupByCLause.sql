//*EXAMPLES*//


SELECT ProductID,MAX(OrderQty) AS 'Order Quantity' FROM SalesLT.SalesOrderDetail
GROUP BY ProductID;
 
SELECT ProductID,MAX(OrderQty) AS 'Order Quantity' FROM SalesLT.SalesOrderDetail
GROUP BY ProductID
ORDER BY 'Order Quantity' DESC;