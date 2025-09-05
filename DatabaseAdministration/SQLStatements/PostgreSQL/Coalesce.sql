/*COALESCE EXAMPLES*/

-- Example 1: COALESCE with NULL and 5
SELECT COALESCE(NULL, 5) AS result;
-- First value is NULL, so it returns 5


-- Example 2: COALESCE with 10 and 5
SELECT COALESCE(10, 5) AS result;
-- First value is not NULL, so it returns 10


--Example 3: COALESCE as a Validation CONSTRAINT
SELECT COALESCE ((4)::BOOLEAN::INTEGER,0); --1

--Example 4: COALESCE as a Validation CONSTRAINT
SELECT COALESCE ((NULL)::BOOLEAN::INTEGER,0); --0
