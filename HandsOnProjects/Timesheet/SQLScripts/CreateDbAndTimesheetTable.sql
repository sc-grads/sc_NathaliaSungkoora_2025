-- Create the database
CREATE DATABASE TimesheetDB;
GO

Use TimesheetDB
Go

  -- Drop existing table if it exists
IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Employee;
END
GO

CREATE TABLE Employee(FullName VARCHAR(100) PRIMARY KEY);

  --TIMESHEET: Drop existing table if it exists
IF OBJECT_ID('dbo.Timesheet', 'U') IS NOT NULL
BEGIN
    DROP TABLE dbo.Timesheet;
END
GO

CREATE TABLE dbo.Timesheet (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100), -- FK to EMPLOYEE.FULLNAME
	Date DATE,
	DayOfWeek VARCHAR(255),
	Client VARCHAR(255),
	ClientProjectName VARCHAR(255),
	Description VARCHAR(255),
	Billable VARCHAR(255),
	Comments VARCHAR(255),
	TotalHours DECIMAL (5,2),
	StartTime TIME,
	EndTime TIME,

	CONSTRAINT FK_Timesheet_Employees
		FOREIGN KEY (FullName)
		REFERENCES dbo.Employee(FullName)
);




--INSERTING Employees into Table
INSERT INTO [dbo].[Employee](FullName)
VALUES
  ('Evashan Govender'),
  ('Iviwe Makinana'),
  ('Mehul Patel'),
  ('Nathalia Sungkoora'),
  ('Neo Motaung'),
  ('Siphenathi Ndevu');

  SELECT TOP (1000) [FullName]
  FROM [TimesheetDB].[dbo].[Employee]