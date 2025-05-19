/* Practice Activity Number 3 */

--Creating variable (up to 32 767 =smallint)

--DECLARE @myvar AS smallint;

--Version 3:
--DECLARE @myvar AS int;--Output: once data type is changed to int it can take the value of 2000000/

--Version 4: Changing data type
DECLARE @myvar AS tinyint;

--Version 1 and Version 4:
SET @myvar =20000;

--Version 2:
--SET @myvar = 200000;--Error message: Arithmetic overflow error for data type smallint, value = 200000.


SELECT @myvar AS myVariable;

--Version 4 output: Error message once data type was changed