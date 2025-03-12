-- Group by and Aggregate clauses

SELECT TOP (1000) [product_id]
      ,[product_name]
      ,[brand_id]
      ,[category_id]
      ,[model_year]
      ,[list_price]
  FROM [Bikestores].[production].[products];

  ---Example: Find the AVG list_price for every individual category
  SELECT 
    category_id, AVG(list_price)
  FROM [Bikestores].[production].[products]
  GROUP BY category_id; --Ensure you add all the columns you are trying to show add it here.
						-- DO NOT put aggregate functions here.

---Applying WHERE clause to the Example: Find the AVG list_price for every individual category
  SELECT 
    category_id, AVG(list_price)
  FROM [Bikestores].[production].[products]
  WHERE category_id!=1
  GROUP BY category_id; --Ensure you add all the columns you are trying to show add it here.
						-- DO NOT put aggregate functions here.

---Applying HAVING clause to the GROUP BY Example: 
-- Find the AVG list_price for every individual category
  SELECT 
    category_id, AVG(list_price)
  FROM [Bikestores].[production].[products]
  GROUP BY category_id --Ensure you add all the columns you are trying to show add it here.
						-- DO NOT put aggregate functions here.
  HAVING AVG (list_price) > 700;