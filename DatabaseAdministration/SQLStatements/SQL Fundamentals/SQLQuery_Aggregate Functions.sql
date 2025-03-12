
--Aggregate Functions (MIN, MAX, COUNT, AVG, SUM)

SELECT TOP (1000) [order_id]
      ,[item_id]
      ,[product_id]
      ,[quantity]
      ,[list_price]
      ,[discount]
  FROM [Bikestores].[sales].[order_items];


  --SUM Aggregate Function
  SELECT
	SUM (list_price) AS SUM
  FROM [Bikestores].[sales].[order_items];

   --AVG Aggregate Function
  SELECT
	AVG (list_price) AS AVG
  FROM [Bikestores].[sales].[order_items];

  
   --MAX Aggregate Function
  SELECT
	MAX (list_price) AS MAX
  FROM [Bikestores].[sales].[order_items];

   --MIN Aggregate Function
  SELECT
	MIN (list_price) AS MIN
  FROM [Bikestores].[sales].[order_items];

   --COUNT Aggregate Function

    SELECT
		COUNT(*) AS [RowCount]
  FROM [Bikestores].[sales].[order_items];


  -- Summary of SUM, AVG, MAX, MIN the Aggregate Functions

  SELECT
	SUM (list_price) AS SUM,
	AVG (list_price) AS AVG,
	MAX (list_price) AS MAX,
	MIN (list_price) AS MIN
  FROM [Bikestores].[sales].[order_items];
