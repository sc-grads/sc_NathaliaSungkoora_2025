/*EXAMPLES*/


--USE MASTER
CREATE LOGIN newusr
WITH PASSWORD = 'PASS123'
GO

--USE APPDB/DP-900
CREATE USER newusr
FOR LOGIN newusr
WITH DEFUALT_SCHEMA =SalesLT

--GRANT permission to user on SELECT Statement and specific table only

GRANT SELECT ON SalesLT.SalesOrderDetail TO newusr;