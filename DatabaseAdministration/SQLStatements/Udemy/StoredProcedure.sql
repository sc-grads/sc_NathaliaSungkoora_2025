/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses and statements Using AdventureWorks2022 Database*/

--Stored Procedure

-- Create a stored procedure to select all records from Person.Address table
CREATE PROCEDURE SelectAllPersonAddress --Write name of Stored Proceduew
AS
SELECT * FROM Person.Address 
GO; -- End the stored procedure definition

-- Execute the stored procedure to fetch all data from Person.Address
EXEC SelectAllPersonAddress-- Execute stored procedure

-- Drop the procedure SelectAllPersonAddressWithParams
DROP PROCEDURE SelectAllPersonAddress -- Drop the existing stored procedure

-- Create a stored procedure with a parameter @City to filter addresses by city
CREATE PROCEDURE SelectAllPersonAddressWithParams (@City NVARCHAR(30)) 
AS
BEGIN
    SET NOCOUNT ON -- Disable the message showing the count of affected rows
    SELECT * FROM Person.Address WHERE City = @City; -- Filter the records based on the city parameter
END
GO

-- Execute the stored procedure with the parameter @City = 'New York'
EXEC SelectAllPersonAddressWithParams @City = 'New York' -- Pass 'New York' as the city


-- Execute the stored procedure with the parameter @City = 'Miami'
EXEC SelectAllPersonAddressWithParams 'Miami' -- Pass 'Miami' as the city

-- Drop the procedure SelectAllPersonAddressWithParams
DROP PROCEDURE SelectAllPersonAddressWithParams -- Drop the stored procedure

-- Create a stored procedure with a default parameter @City set to 'New York'
CREATE PROCEDURE SelectAllPersonAddressWithParams (@City NVARCHAR(30) = 'New York') 
AS
BEGIN
    SET NOCOUNT ON -- Disable the message showing the count of affected rows
    SELECT * FROM Person.Address WHERE City = @City; -- Filter records based on the city parameter
END
GO

-- Execute the stored procedure with the parameter @City = 'Miami'
EXEC SelectAllPersonAddressWithParams 'Miami' -- Pass 'Miami' as the city

-- Create a stored procedure with two parameters: @City and @stateProvinceId
CREATE PROCEDURE SelectAllPersonAddressWithParams (@City NVARCHAR(30) = 'New York', @stateProvinceid INT) 
AS
BEGIN
    SET NOCOUNT ON -- Disable the message showing the count of affected rows
    SELECT * FROM Person.Address WHERE City = @City; -- Filter records based on the city parameter
END
GO

USE [AdventureWorks2022]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllPersonAddressWithParams]    Script Date: 2025/03/11 15:02:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SelectAllPersonAddressWithParams] (@City NVARCHAR(30) = 'New York', @stateProvinceid INT) 
AS
BEGIN
    SET NOCOUNT ON -- Disable the message showing the count of affected rows
    SELECT * FROM Person.Address WHERE City = @City; -- Filter records based on the city parameter
END


-- Create a stored procedure with encryption for sensitive data
CREATE PROCEDURE SelectAllPersonAddressWithParamswithEncryption (@City NVARCHAR(30)
--Do not encrypt unless you know how to decrypt it 