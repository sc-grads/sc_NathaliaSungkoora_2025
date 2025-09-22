/*DP-600 SSMS Queries*/

USE [DP-900]
GO

-- 1. Use the following command to create a new table
CREATE TABLE Customer (
    CustomerID varchar(10) NOT NULL,
    CustomerName varchar(1000)
);

-- 2. Use the following commands to add data to the table
INSERT INTO Customer (CustomerID, CustomerName) VALUES ('C1', 'UserA');
INSERT INTO Customer (CustomerID, CustomerName) VALUES ('C2', 'UserB');
INSERT INTO Customer (CustomerID, CustomerName) VALUES ('C3', 'UserC');
-- 3. Use the following command to fetch the rows from the table
SELECT * FROM Customer;



