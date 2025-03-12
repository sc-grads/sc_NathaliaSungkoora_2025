/*Udemy Course_ Microsoft SQL Server Database Administration Course
	Practicing different clauses and statements Using AdventureWorks2022 Database*/

	/* INSERT STATEMENTS in detail*/


-- CREATE TABLE statement to create the salesstaff table
CREATE TABLE salesstaff(
    staffid INT NOT NULL PRIMARY KEY,   -- staffid as primary key
    fName NVARCHAR(30) NOT NULL,			--NOT NULL means can't be empty
    lName NVARCHAR(30) NOT NULL  
	)

-- INSERT statement to add a new row into the salesstaff table
INSERT INTO salesstaff (staffid, fname, lname)  --Adding all columns in table to insert values
VALUES (200, 'Abbas', 'Mehmood')           -- Adding a single row

--SELECT Statement to see row of values just added
SELECT * 
FROM salesstaff


-- INSERT statement to add multiple rows into the salesstaff table
INSERT INTO salesstaff (staffid, fname, lname)
VALUES (300, 'Imran', 'Afzal'),            -- Adding multiple rows at once
       (325, 'John', 'Vick'),
       (314, 'James', 'Dino')

 --SELECT Statement to see multiple rows of values just added
SELECT * 
FROM salesstaff


-- CREATE TABLE statement to create a new table (salesstaffNew) with an IDENTITY column
CREATE TABLE salesstaffNew 
(	ID INT NOT NULL IDENTITY PRIMARY KEY,  -- ID as primary key
    staffid INT NOT NULL,  
    fName NVARCHAR(30) NOT NULL,			--NOT NULL means can't be empty
    lName NVARCHAR(30) NOT NULL  
	)
--SELECT Statement to see NEW Table just created in salesstaffNew 
SELECT * 
FROM salesstaffNew

-- INSERT statement to add a new row into the salesstaffNew table
INSERT INTO salesstaffNew (staffid, fname, lname)		-- IN general Need to make sure No. of columns = No. of Values to be inserted
VALUES (200, 'Abbas', 'Mehmood')         -- Adding a single row to the new table
--Did not have to specify ID because we said IDENTITY when creating column so it will be automatically generated


-- INSERT statement to add multiple rows into the salesstaffNew table
INSERT INTO salesstaffNew (staffid, fname, lname)
VALUES (300, 'Imran', 'Afzal'),           -- Adding multiple rows at once
       (325, 'John', 'Vick'),
       (314, 'James', 'Dino')


-- CREATE TABLE statement to create a new table with only fName and lName
CREATE TABLE nameOnlyTable
(
    fName NVARCHAR(30) NOT NULL,-- fName column
                       								--NOT NULL means can't be empty
    lName NVARCHAR(30) NOT NULL    -- lName column                
)
-- SELECT statement to see new nameOnlyTable created
SELECT * 
FROM nameOnlyTable


-- INSERT INTO SELECT statement to insert data from salesstaffNew table
-- into nameOnlyTable where the ID is greater than or equal to 3
INSERT INTO nameOnlyTable (fName, lName)
SELECT fName, lName 
FROM salesstaffNew 
WHERE ID >= 3



-- SELECT INTO statement to create a backup table (salesstaffNew_bkp) from salesstaffNew
SELECT * 
INTO salesstaffNew_bkp 
FROM salesstaffNew

SELECT *		--New backup table created (a copy of salesstaffNew table
FROM salesstaffNew_bkp 