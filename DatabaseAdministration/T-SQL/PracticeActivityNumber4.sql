/* Practice Activity Number 3 */


select system_type_id, column_id, system_type_id / column_id as Calculation
from sys.all_columns

--1. Calculation column only has whole numbers and no decimals
select system_type_id, column_id, system_type_id * 1.0000/ column_id as Calculation
from sys.all_columns
--Changing data type


--2. ROunding the numbers down to nearest whole number
select system_type_id, column_id, FLOOR(system_type_id * 1.0000/ column_id) as Calculation
from sys.all_columns

--3. Rounding the numbers up to nearest whole number
select system_type_id, column_id, CEILING(system_type_id * 1.0000/ column_id) as Calculation
from sys.all_columns

--3. Rounding the numbers up to nearest one decimal place
select system_type_id, column_id, ROUND(system_type_id * 1.0000/ column_id, 1) as Calculation
from sys.all_columns

--4.Converting to a tinyint
select system_type_id, column_id, try_CONVERT(tinyint, system_type_id * 2) as Calculation
from sys.all_columns