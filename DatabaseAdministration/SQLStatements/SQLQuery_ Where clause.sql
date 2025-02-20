SELECT TOP (1000) [customer_id]
      ,[first_name]
      ,[last_name]
      ,[phone]
      ,[email]
      ,[street]
      ,[city]
      ,[state]
      ,[zip_code]
  FROM [Bikestores].[sales].[customers]
 WHERE (customer_id <>1 AND city = 'san diego') OR phone IS NOT NULL;
-- WHERE [Coloumn] {LOGICAL OPERATOR} {VALUES}

SELECT TOP (1000) [customer_id]
      ,[first_name]
      ,[last_name]
      ,[phone]
      ,[email]
      ,[street]
      ,[city]
      ,[state]
      ,[zip_code]
  FROM [Bikestores].[sales].[customers]
 WHERE phone LIKE '%246-8375%';
-- WHERE [Coloumn] {LOGICAL OPERATOR} {VALUES}

SELECT TOP (1000) [customer_id]
      ,[first_name]
      ,[last_name]
      ,[phone]
      ,[email]
      ,[street]
      ,[city]
      ,[state]
      ,[zip_code]
  FROM [Bikestores].[sales].[customers]
 WHERE first_name LIKE '%e';
-- WHERE [Coloumn] {LOGICAL OPERATOR} {VALUES}

SELECT TOP (1000) [customer_id]
      ,[first_name]
      ,[last_name]
      ,[phone]
      ,[email]
      ,[street]
      ,[city]
      ,[state]
      ,[zip_code]
  FROM [Bikestores].[sales].[customers]
 WHERE phone IS NOT NULL;
-- WHERE [Coloumn] {LOGICAL OPERATOR} {VALUES}