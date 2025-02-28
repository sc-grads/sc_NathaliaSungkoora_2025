-- Read Operations( Selecting rows from table)
		SELECT FirstName
		FROM Employees;

		SELECT FirstName, Age, Department
		FROM Employees;

		SELECT EmployeeID,FirstName, LastName, Age
		FROM Employees
		WHERE Age>30;