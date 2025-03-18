/*Udemy Course_ Microsoft SQL Server Database Administration Course
Practicing different Queries and Statements Checking Service Broker */


-- This query checks whether Service Broker is enabled for the 'MSDB' database
SELECT is_broker_enabled 
FROM sys.databases 
WHERE name = 'MSDB';

