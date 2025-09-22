/*EXAMPLES*/


-- 1. Use the following command to create a new table

CREATE TABLE customers
(
CustomerId int,
CustomerName varchar(1000),
Age int
)

-- 2. Use the following commands to add data to the table

INSERT INTO Customers(CustomerId,Customername,Age) VALUES (1,'userA',20)
INSERT INTO Customers(CustomerId,Customername,Age) VALUES (2,'userB',30)
INSERT INTO Customers(CustomerId,Customername,Age) VALUES (3,'userC',31)
INSERT INTO Customers(CustomerId,Customername,Age) VALUES (4,'userD',26)
INSERT INTO Customers(CustomerId,Customername,Age) VALUES (5,'userE',29)


-- 3. Next enable the viewing of Actual Execution plans in SQL Server Management Studio.
--Execute the following command and see the relevant output

SELECT * from Customers where CustomerId=3

-- 4. Then go ahead and create a clustered index

CREATE CLUSTERED INDEX IX_customers_customerid
    ON dbo.Customers (CustomerId);  
