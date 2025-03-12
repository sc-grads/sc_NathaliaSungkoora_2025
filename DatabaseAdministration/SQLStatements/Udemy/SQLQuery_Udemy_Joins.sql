/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses Using AdventureWorks2022 Database*/

-- Looking at new employee table created using graphical user interface
SELECT TOP (1000) [EmpID]
      ,[EmpName]
      ,[EmpTitle]
  FROM [AdventureWorks2022].[dbo].[Employee]

  --Inserting example values into table created (can also use graphical interface)
INSERT INTO [AdventureWorks2022].[dbo].[Employee] (EmpID, EmpName, EmpTitle)
VALUES
    (3, N'Dino', N'Sales Associate'),
    (11, N'Dino', N'Sr Sales Associate'),
    (79, N'James', N'Sales Manager');

	-- Looking at new sales table created using graphical user interface
	SELECT TOP (1000) [EmpID]
      ,[EmpName]
      ,[SalesNumber]
      ,[ItemSold]
  FROM [AdventureWorks2022].[dbo].[Sales]

  --Inserting values into data using grpahical interface
  SELECT TOP (1000) [EmpID]
      ,[EmpName]
      ,[SalesNumber]
      ,[ItemSold]
  FROM [AdventureWorks2022].[dbo].[Sales]

  --Two tables that will be Joined together
  SELECT TOP (1000) [EmpID] --Table 1
      ,[EmpName]
      ,[EmpTitle]
  FROM [AdventureWorks2022].[dbo].[Employee]

    SELECT TOP (1000) [EmpID] --Table 2
      ,[EmpName]
      ,[SalesNumber]
      ,[ItemSold]
  FROM [AdventureWorks2022].[dbo].[Sales]


  --JOIN:
  SELECT * 
  FROM [AdventureWorks2022].[dbo].[Employee] AS E --Using aliases for better readability
  JOIN [AdventureWorks2022].[dbo].[Sales] AS S
  ON E.EmpName = S.EmpName				-- Output Shows wrong data because wrong column is used (NOT UNIQUE)
  
  --BETTER JOIN:
  SELECT * 
  FROM [AdventureWorks2022].[dbo].[Employee] AS E --Using aliases for better readability
  JOIN [AdventureWorks2022].[dbo].[Sales] AS S
  ON E.EmpID = S.EmpID		-- Using UNIQUE column to Join	

    --BETTER JOIN:Specifying Columns
  SELECT E.[EmpID],			--Use Alias when referring to specific column from specific tables. 
		 E.[EmpName],
		 S.[SalesNumber],
		 S.[ItemSold]
  FROM [AdventureWorks2022].[dbo].[Employee] AS E --Using aliases for better readability
  JOIN [AdventureWorks2022].[dbo].[Sales] AS S
  ON E.EmpID = S.EmpID		-- Using UNIQUE column to Join	
  ORDER BY E.[EmpID]		-- Using Order BY to order according to EmployID


  --Using Group by in a Join (because an aggregate function is also being used)
SELECT COUNT(SalesNumber) AS NoOfSales,
		E.EmpID,
		E.EmpName
FROM [AdventureWorks2022].[dbo].[Employee] AS E --Using aliases for better readability
  JOIN [AdventureWorks2022].[dbo].[Sales] AS S
  ON E.EmpID = S.EmpID	
GROUP BY E.EmpID, E.EmpName --Use columns already added in select statement