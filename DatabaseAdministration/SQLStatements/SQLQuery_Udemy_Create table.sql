/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses Using AdventureWorks2022 Database*/

USE AdventureWorks2022
GO

-- Creating storenew table and adding store_id
CREATE TABLE [AdventureWorks2022].[sales].[storenew](
store_id INT NOT NULL,
sales INT
)

--Creating a new sales.visits table
CREATE TABLE [AdventureWorks2022].[sales].[visits](
visit_id INT PRIMARY KEY IDENTITY (1,1),
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
visited_at DATETIME,
phone VARCHAR(20),
store_id INT NOT NULL
FOREIGN KEY(store_id) REFERENCES sales.storenew(store_id)
)

-- Selecting evrything in new sales.view table created
SELECT * FROM [AdventureWorks2022].[sales].[visits]

--Creating a temporary(temp) table (Can create in different sessions with the same name)

SELECT BusinessEntityID, firstname,lastname, Title
INTO #TempPersonTable
FROM [Person].[Person]
WHERE title = 'mr.'

--Selecting columns to see in peron.person table
SELECT BusinessEntityID, firstname,lastname, Title
FROM [Person].[Person]
WHERE title = 'mr.'

--Selecting columns to see in temp table created
SELECT * FROM #TempPersonTable

--Dropping temp table
DROP TABLE #TempPersonTable


--Creating temp table person table
CREATE TABLE #TempPersonTable(
BusinessEntityID INT,
firstname NVARCHAR(50),
lastname NVARCHAR(50),
Title NVARCHAR(50)
)

--Inserting values into temp person table created
INSERT INTO #TempPersonTable
SELECT BusinessEntityID, firstname,lastname, Title
FROM [Person].[Person]
WHERE title = 'mr.'