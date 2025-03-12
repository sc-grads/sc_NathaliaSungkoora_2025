SELECT TOP (1000) [product_id]
      ,[product_name] AS [Product Name]
      ,[brand_id]
      ,[category_id]
      ,[model_year]
      ,[list_price]
  FROM [Bikestores].[production].[products]
  -- ORDER BY Column, ColumnOrdinal, ColumnAlias;

SELECT TOP (1000) [product_id]
      ,[product_name] AS [Product Name]
      ,[brand_id]
      ,[category_id]
      ,[model_year]
      ,[list_price]
  FROM [Bikestores].[production].[products]
  ORDER BY [Product Name] DESC;

   -- ORDER BY Column, ColumnOrdinal, ColumnAlias (Descending-DESC/ Ascending-ASC)
  
SELECT TOP (1000) [product_id]
      ,[product_name] AS [Product Name]
      ,[brand_id]
      ,[category_id]
      ,[model_year]
      ,[list_price]
  FROM [Bikestores].[production].[products]
  ORDER BY model_year, list_price ASC;