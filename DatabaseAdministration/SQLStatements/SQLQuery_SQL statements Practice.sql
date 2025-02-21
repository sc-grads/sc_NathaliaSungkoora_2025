
/*NOTES:
--COMMENT 1:There are two options to create comments
/* COMMENT 2: It is better to learn alternative ways to write comments in SQL*/*/

--Retrieving data from a table (SELECT)

-- Selecting from one column
SELECT CustomerName AS [Customer Name] -- Using an alias (AS) and adding square brackets to encase the name with a space
FROM dbo.Customers;

-- Selcting from more than one column
SELECT CustomerName AS [Customer Name],
		Notes 
FROM dbo.Customers;

--DISTINCT keyword is used to ensure that the results of a query contain only unique values, eliminating duplicate entries.
SELECT DISTINCT CustomerName AS [Customer Name]
FROM dbo.Customers;

-- Selecting ALL(*) coloumns from a table
SELECT *
FROM dbo.Customers;

--Selecting TOP(number) to show the amount of records you want to see
SELECT TOP(3) *
FROM dbo.Customers;

--Using WHERE clause to filter information
SELECT *
FROM dbo.Customers
WHERE State= 'WA';

--Use WHERE clause to filter information (NOT EQUAL TO <> and !=)
SELECT *
FROM dbo.Customers
WHERE State <> 'WA';
						-- Both ways give you the same output.
SELECT *
FROM dbo.Customers
WHERE State !='WA';


-- Using an OR statement in my WHERE clause
SELECT *
FROM dbo.Customers
WHERE State ='WA' OR State= 'NY';

SELECT *
FROM dbo.Customers
WHERE State ='WA' OR State= 'NY' OR State = 'UT';


-- Using IN and NOT IN instead of creating longer queries.

-- IN
SELECT *
FROM dbo.Customers
WHERE State IN ('WA','NY','UT'); -- with IN use brackets to encase and seperate values with a comma

-- NOT IN 
SELECT *
FROM dbo.Customers
WHERE State NOT IN ('WA','NY','UT');


  -- Using AND to be specific in queries

  SELECT *
FROM dbo.Customers
WHERE CustomerName= 'Tres Delicious' AND Country = 'United States';

-- Can combine AND with OR
SELECT *
FROM dbo.Customers
WHERE CustomerName= 'Tres Delicious' AND Country = 'United States'
OR Country= 'France';

SELECT *
FROM dbo.Customers
WHERE CustomerName= 'Tres Delicious' AND (Country = 'United States' -- Adding brackets makes the query cleaner and easier to read
OR Country= 'France');


-- Using Like to filter information and be more specific on what you are looking for.

--Looking for customers whose name starts with the letter 'A':
SELECT *
FROM dbo.Customers
WHERE CustomerName LIKE 'A%' AND (Country = 'United States' 
OR Country= 'France');

--Looking for customers whose name does NOT start with the letter 'A':
SELECT *
FROM dbo.Customers
WHERE CustomerName NOT LIKE 'A%' AND (Country = 'United States' 
OR Country= 'France');



-- Filtering using NUMERIC VALUES 
--Filter by looking for numbers GREATER THAN (>)
SELECT TOP (1000) [OrderID]
      ,[OrderDate]
      ,[CustomerID]
      ,[OrderTotal]
  FROM [KCC].[dbo].[Orders]
  WHERE  OrderTotal > 1000;

  --Filter by looking for numbers LESS THAN (<)
  SELECT TOP (1000) [OrderID]
      ,[OrderDate]
      ,[CustomerID]
      ,[OrderTotal]
  FROM [KCC].[dbo].[Orders]
  WHERE  OrderTotal <=1000;
  

 --Filter by looking for numbers BETWEEN ...AND...
  SELECT TOP (1000) [OrderID]
      ,[OrderDate]
      ,[CustomerID]
      ,[OrderTotal]
  FROM [KCC].[dbo].[Orders]
  WHERE  OrderTotal BETWEEN 1000 AND 2000;

  --Pulling data from more tables using JOINS

  --Using the Order and Customer Tables:
  SELECT OrderID,		
		OrderDate,
		OrderTotal,
		CustomerName,
		Phone
  FROM dbo.Orders AS o --Using AS to write an alias (making queries easier to read)
   JOIN dbo.Customers AS c		--Using a JOIN to combine the two tables
  ON  o.CustomerID=c.CustomerID;


  --Using the Order and Customer Tables:
  SELECT OrderID,		
		OrderDate,
		OrderTotal,
		CustomerName,
		Phone
  FROM dbo.Orders AS o --Using AS to write an alias (making queries easier to read)
  INNER JOIN dbo.Customers AS c		--Using a INNER JOIN to combine the two tables
  ON  o.CustomerID=c.CustomerID;
  -- INNER JOIN  retrieves only the records where there is a match in both tables.
  
  --Using RIGHT OUTER JOIN Using the Order and Customer Tables:
  -- Looking to find customers who have not placed an order
  SELECT OrderID,		
		OrderDate,
		OrderTotal,
		CustomerName,
		Phone
  FROM dbo.Orders AS o --Using AS to write an alias (making queries easier to read)
	RIGHT OUTER JOIN dbo.Customers AS c		--Using a RIGHT OUTER JOIN to combine the two tables
  ON  o.CustomerID=c.CustomerID;
 -- A RIGHT OUTER JOIN returns all rows from the right table and the matching rows from the left table  with NULL for left table columns where there is no match.

 --Using LEFT OUTER JOIN Using the Order and Customer Tables:
  -- Looking to find Orders who don't have customers
  SELECT OrderID,		
		OrderDate,
		OrderTotal,
		CustomerName,
		Phone
  FROM dbo.Orders AS o --Using AS to write an alias (making queries easier to read)
	LEFT OUTER JOIN dbo.Customers AS c		--Using a LEFT OUTER JOIN to combine the two tables
  ON  o.CustomerID=c.CustomerID;
  --Output shows no NULL values here because all orders have a customer in this example

  --  A LEFT OUTER JOIN returns all rows from the left table and the matching rows from the right table, with NULL for right table columns where there is no match.


  -- Using an ORDER BY clause

  SELECT OrderID,		
		OrderDate,
		OrderTotal,
		CustomerName,
		Phone,
		c. CustomerID  -- use alias when specifying what table you are getting the coloumn from
  FROM dbo.Orders AS o 
	LEFT OUTER JOIN dbo.Customers AS c
  ON  o.CustomerID=c.CustomerID
  ORDER BY OrderTotal ASC; -- ORDER BY Ascending order (ASC)

  SELECT OrderID,		
		OrderDate,
		OrderTotal,
		CustomerName,
		Phone,
		c. CustomerID  -- use alias when specifying what table you are getting the coloumn from
  FROM dbo.Orders AS o 
	LEFT OUTER JOIN dbo.Customers AS c
  ON  o.CustomerID=c.CustomerID
  ORDER BY OrderTotal DESC;-- ORDER BY Descending order (DESC)


  --Using DIFFERENT FUNCTIONS

  
   --Looking for all orders from the past month:
   SELECT * 
   FROM dbo.Orders
   WHERE OrderDate >= '2/18/2022';

   --Example: DATEADD(month, -1, GETDATE()) subtracts 1 month from the current date.
   
   SELECT * 
   FROM dbo.Orders
   WHERE OrderDate >=  DATEADD(month, -1, GETDATE());

   -- Using the COUNT, SUM Functions
   SELECT COUNT(*) 
   FROM dbo.Orders
   WHERE OrderDate >= DATEADD(month, -1, GETDATE());

   SELECT SUM (OrderTotal)
   FROM dbo.Orders
   WHERE OrderDate >= DATEADD(month, -1, GETDATE());

   -- Using Group BY
   SELECT SUM (OrderTotal)
   FROM dbo.Orders
   WHERE OrderDate >= DATEADD(month, -1, GETDATE())
   GROUP BY CustomerID;


  