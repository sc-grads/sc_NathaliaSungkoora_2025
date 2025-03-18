/*Udemy Course_ Microsoft SQL Server Database Administration Course
Practicing different Queries and StatementsUpdating Sales Data*/

--Replication of Instance

-- Selects the top 1000 records from the Sales table in the AdventureWorks2016_repl database
SELECT TOP (1000) [EmpID]
        ,[EmpName]
        ,[SalesNumber]
        ,[ItemSold]
FROM [AdventureWorks2022].[dbo].[Sales]

-- Selects the top 1000 records from the Sales table in the AdventureWorks2016 database
SELECT TOP (1000) [EmpID]
        ,[EmpName]
        ,[SalesNumber]
        ,[ItemSold]
FROM [AdventureWorks2022].[dbo].[Sales]

-- Updates the ItemSold value to 2000 where the EmpID is 3 and SalesNumber is 8989 in the Sales table
UPDATE [Sales] 
SET [ItemSold] = 2000 
WHERE [EmpID] = 3 AND [SalesNumber] = 8989;

-- Selects the top 1000 records from the Sales table in the AdventureWorks2022_repl database
SELECT TOP (1000) [EmpID]
        ,[EmpName]
        ,[SalesNumber]
        ,[ItemSold]
FROM [AdventureWorks2016_repl].[dbo].[Sales];

-- Retrieves the current date and time
SELECT GETDATE();

-- Selects the top 1000 records from the Sales table in the AdventureWorks2022 database
SELECT TOP (1000) [EmpID]
        ,[EmpName]
        ,[SalesNumber]
        ,[ItemSold]
FROM [AdventureWorks2022].[dbo].[Sales];

-- Updates the ItemSold value to 3000 where the EmpID is 3 and SalesNumber is 8989 in the Sales table
UPDATE [Sales] 
SET [ItemSold] = 3000 
WHERE [EmpID] = 3 AND [SalesNumber] = 8989;
