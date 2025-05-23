/* JSON */


------------------------------------------------------------------------------------------------------
 --Check System Compatability
SELECT compatibility_level FROM sys.databases
where [name] = DB_NAME();  --Check System Compatability

------------------------------------------------------------------------------------------------------
--JSON 
-- Declare a variable to hold JSON data
DECLARE @json NVARCHAR(4000)
SET @json = '
{
  "name": "Nathalia",
  "ShoppingTrip": {
    "ShoppingTripItem": "L1",
    "Items": [
      {"Item": "Bananas", "Cost": 5},
      {"Item": "Apples", "Cost": 4},
      {"Item": "Cherries", "Cost": 3}
    ]
  }
}'
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Check if the string is valid JSON (returns 1 if valid, 0 if not)
SELECT ISJSON(@json) --Output: 1

-- Try to extract "Name" using wrong case 
SELECT JSON_VALUE(@json, '$."Name"') --Output:NULL

-- Correct case-sensitive extraction using 'strict'
SELECT JSON_VALUE(@json, 'strict $."name"') --Output: Nathalia

-- Return the whole JSON object
SELECT JSON_QUERY(@json, '$') --Output:{"name": "Nathalia", "ShoppingTrip": { "ShoppingTripItem": "L1", "Items": 
							--[ {"Item": "Bananas", "Cost": 5}, {"Item": "Apples", "Cost": 4}, {"Item": "Cherries", "Cost": 3}] } }

-- Extract second item (Apples) from the array (starts from 0)
SELECT JSON_VALUE(@json, 'strict $.ShoppingTrip.Items[1].Item') --Output: Apples

-----------------------------------------------------------------------------------------------------------------------------------------------
-- MODIFY the value of the second item from "Apples" to "Big Bananas"
SELECT JSON_MODIFY(@json, 'strict $.ShoppingTrip.Items[1].Item', 'Big Bananas')

-- REPLACE the second item object with a new object using a string
SELECT JSON_MODIFY(@json, 'strict $.ShoppingTrip.Items[1]', '{"Item":"Big Apples", "Cost":1}')

-- Replace the second item object with a new object using JSON_QUERY
SELECT JSON_MODIFY(@json, 'strict $.ShoppingTrip.Items[1]', JSON_QUERY('{"Item":"Big Apples", "Cost":1}'))

-- ADD a new key-value pair to the root JSON object
SELECT JSON_MODIFY(@json, '$.Date', '2022-01-1')

-----------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------
-- Parse the root JSON and return key-value pairs (name and ShoppingTrip)
SELECT * FROM OPENJSON(@json)

-- Parse the array under ShoppingTrip > Items
SELECT * FROM OPENJSON(@json, '$.ShoppingTrip.Items')

-- Parse the Items array and define column types for output: Specify specific column and data type
SELECT * 
FROM OPENJSON(@json, '$.ShoppingTrip.Items')
WITH (
  Item VARCHAR(10),
  Cost INT
) 
-------------------------------------------------------------------------------------------------------------
-- CONVERTING list into JSON
--Construct a JSON array manually from SELECT statements
SELECT 'Bananas' AS Item, 5 AS Cost
UNION
SELECT 'Apples', 4
UNION
SELECT 'Cherries', 3
FOR JSON PATH, ROOT('MyShopping Trip')
