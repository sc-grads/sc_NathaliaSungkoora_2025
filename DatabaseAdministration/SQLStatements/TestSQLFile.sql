
/* SQL Test File for Pull Requests*/


-- Create a table called "Employees"
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    HireDate DATE
);

-- Insert some sample data into the "Employees" table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate)
VALUES
(1, 'John', 'Doe', 'Software Developer', '2021-03-15'),
(2, 'Jane', 'Smith', 'Project Manager', '2019-05-22'),
(3, 'Michael', 'Johnson', 'Database Administrator', '2020-07-10'),
(4, 'Emily', 'Davis', 'UX Designer', '2022-01-05');

-- Select all data from the "Employees" table
SELECT * FROM Employees;
