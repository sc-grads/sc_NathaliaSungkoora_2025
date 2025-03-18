/*Udemy Course_ Microsoft SQL Server Database Administration Course
Practicing different Queries and Statements Grant, Deny and Revoke permissions */


USE [AdventureWorks2022]
GO

-- Grant CONTROL permission on the Sales schema to sqluser01
GRANT CONTROL ON SCHEMA::Sales TO sqluser01;

----------------------------------------------------------------------
-- Switch to sqluser01's context
EXECUTE AS USER = 'sqluser01';

-- Check the permissions that sqluser01 has on the Sales schema
SELECT * FROM fn_my_permissions ('Sales', 'SCHEMA');

-- Revert back to the original user context
REVERT;
GO
-----------------------------------------------------------------------------

-- Revoke CONTROL permission on the Sales schema from sqluser01
REVOKE CONTROL ON SCHEMA::Sales TO sqluser01;


-- -- Grant UPDATE permission on the Sales schema to sqluser01
GRANT UPDATE ON SCHEMA::Sales TO sqluser01;


-- Deny EXECUTE permission on the Sales schema to sqluser01
DENY EXECUTE ON SCHEMA::Sales TO sqluser01;


-- Revoke UPDATE permission on the Sales schema from sqluser01
REVOKE UPDATE ON SCHEMA::Sales TO sqluser01;
-------------------------------------------------------------------------------
--Able to run Select statement because control was granted.
-- Switch to the context of user 'sqluser01'
EXECUTE AS USER = 'sqluser01';

-- Retrieve and display the permissions that 'sqluser01' has on the 'Sales' schema
SELECT * 
FROM fn_my_permissions ('Sales', 'SCHEMA');

-- Revert back to the original user context
REVERT;
GO
--------------------------------------------------------------------------------------
-- Deny SELECT permission on the Sales schema to sqluser01
DENY SELECT ON SCHEMA::Sales TO sqluser01;


-- GRANT SELECT permission on the Sales schema to sqluser01
GRANT SELECT ON SCHEMA::Sales TO sqluser01;
--NOW:
-- Switch to the context of user 'sqluser01'
EXECUTE AS USER = 'sqluser01';

-- Retrieve and display the permissions that 'sqluser01' has on the 'Sales' schema
SELECT * 
FROM fn_my_permissions ('Sales', 'SCHEMA');

-- Uncomment the next line if you want to query the 'CreditCard' table within the 'Sales' schema
-- SELECT * FROM [Sales].[CreditCard]

-- Revert back to the original user context
REVERT;
GO
