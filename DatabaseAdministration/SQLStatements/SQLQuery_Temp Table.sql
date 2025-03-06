/* Creating a Tempt Table*/


--Step 1: Creating table with Column titles and data types
CREATE TABLE #temp_Employee (		--Difference here is the "#"
EmployeeID INT,
JobTitle VARCHAR(100),
Salary INT
);


--Step 2: Looking at Temp Table created
SELECT *
FROM #temp_Employee;

--Step 3: Inserting data into the temp table created
INSERT INTO #temp_Employee
VALUES (
'1001','HR', '45000'
);

--EXAMPLE: Selecting all data from one table and adding it into temp table
INSERT INTO #temp_Employee
SELECT *
FROM [SQL tutorial]..EmployeeSalary --Took all data from EmployeeSalary and put it into the #tempEmployee

-- Step 5: Creating a secong table and inserting data into it 

--Helps to assist when using a stored procedure. Avoids errors of existing database created.
DROP TABLE IF EXISTS #Temp_Employee2 --Deletes Table and allows you to create it again. Makes query runs more smoothly
CREATE TABLE #Temp_Employee2 (
JobTitle VARCHAR(50),
EmployeePerJob INT,
AvgAge INT,
AvgSalary INT
);

INSERT INTO #Temp_Employee2
SELECT  JobTitle,
		COUNT(JobTitle),
		AVG(Age),
		AVG(Salary)
FROM  [SQL tutorial]..EmployeeDemographics AS emp
JOIN [SQL tutorial]..EmployeeSalary AS sal
ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle;

SELECT *		--Use Case: Helps quickly run more calculations or queries based on information in temp table (reduces run time)
FROM #Temp_Employee2;


--Helps to assist when using a stored procedure. Avoids errors of existing database created.
DROP TABLE IF EXISTS #Temp_Employee2 --Deletes Table and allows you to create it again. Makes query runs more smoothly

