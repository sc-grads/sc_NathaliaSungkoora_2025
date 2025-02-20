
-- Inner Join Product Tables and Brand Table
-- Using Aliases to improve format or query

SELECT TOP (1000) [product_id]
      ,[product_name]
      ,[brand_id]
      ,[category_id]
      ,[model_year]
      ,[list_price]
  FROM [Bikestores].[production].[products] AS p
  INNER JOIN [Bikestores].[production].[brands] AS b
  ON p.brand_id = b.brand_id;

  -- Selecting all (*)the information you want to see.

  SELECT *
  FROM [Bikestores].[production].[products] AS p
  INNER JOIN [Bikestores].[production].[brands] AS b
  ON p.brand_id = b.brand_id;


  -- Joining more than one table (Joining category table using category_id).
    SELECT *
  FROM [Bikestores].[production].[products] AS p
  INNER JOIN [Bikestores].[production].[brands] AS b
  ON p.brand_id = b.brand_id
  INNER JOIN [Bikestores].[production].[categories] AS c
  ON p.category_id = c.category_id;

  -- Cleaning up the Query to improve the format.
   SELECT TOP (1000)
		product_name,
		model_year,
		brand_name,
		category_name

  FROM [Bikestores].[production].[products] AS p
  INNER JOIN [Bikestores].[production].[brands] AS b
  ON p.brand_id = b.brand_id
  INNER JOIN [Bikestores].[production].[categories] AS c
  ON p.category_id = c.category_id;


  
-- Left Join Two tables (Store table and Staff table Join ON store_id):
SELECT TOP (1000) 
		* -- Displaying everything
  FROM [Bikestores].[sales].[stores] AS s
  LEFT OUTER JOIN [Bikestores].[sales].[staffs] AS st
  ON s.store_id = st.store_id;

  
--RIGHT OUTER JOIN (Showing all the data on the right side):
SELECT TOP (1000) [staff_id]
      ,[first_name]
      ,[last_name]
      ,[email]
      ,[phone]
      ,[active]
      ,[store_id]
      ,[manager_id]
  FROM [Bikestores].[sales].[staffs] AS s
  RIGHT OUTER JOIN [Bikestores].[sales].[stores] AS st
  ON s.store_id = st.store_id;

  --RIGHT OUTER JOIN Cleaned up and showing everything(Showing all the data on the right side):
SELECT TOP (1000) 
			*
  FROM [Bikestores].[sales].[staffs] AS s
  RIGHT OUTER JOIN [Bikestores].[sales].[stores] AS st
  ON s.store_id = st.store_id;