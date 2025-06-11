/* ================================================
   SQL STATEMENTS FOR AUTOMATED SSIS TIMESHEET PROJECT
   ================================================ */

-- Create the database if it doesn't exist
IF DB_ID('TimesheetDB') IS NULL
    CREATE DATABASE TimesheetDB;
GO

USE TimesheetDB;
GO


   --EMPLOYEE TABLE

IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
    DROP TABLE dbo.Employee;
GO

CREATE TABLE dbo.Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO


   --CLIENT TABLE

IF OBJECT_ID('dbo.Client', 'U') IS NOT NULL
    DROP TABLE dbo.Client;
GO

CREATE TABLE dbo.Client (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName VARCHAR(255) NOT NULL UNIQUE,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO



   --DESCRIPTION TABLE

IF OBJECT_ID('dbo.Description', 'U') IS NOT NULL
    DROP TABLE dbo.Description;
GO

CREATE TABLE dbo.Description (
    DescriptionID INT IDENTITY(1,1) PRIMARY KEY,
    Description VARCHAR(100),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO


   --TIMESHEET TABLE

IF OBJECT_ID('dbo.Timesheet', 'U') IS NOT NULL
    DROP TABLE dbo.Timesheet;
GO

CREATE TABLE dbo.Timesheet (
    TimesheetID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NOT NULL,
    Date DATE NOT NULL,
    DayOfWeek VARCHAR(255) NULL,
    ClientID INT NOT NULL,
    ProjectName VARCHAR(255) NULL,
    DescriptionID INT NOT NULL,
    Billable VARCHAR(255) NULL,
    Comments VARCHAR(255) NULL,
    TotalHours DECIMAL(5,2) NULL,
    StartTime TIME NULL,
    EndTime TIME NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID),
    FOREIGN KEY (ClientID) REFERENCES dbo.Client(ClientID),
    FOREIGN KEY (DescriptionID) REFERENCES dbo.Description(DescriptionID)
);
GO


   --LEAVE TABLE

IF OBJECT_ID('dbo.Leave', 'U') IS NOT NULL
    DROP TABLE dbo.Leave;
GO

CREATE TABLE dbo.Leave (
    LeaveID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NOT NULL,
    TypeOfLeave VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    NumberOfDays DECIMAL(4,1),
    ApprovalObtained VARCHAR(255),
    SickNoteProvided VARCHAR(255),
    ContactInformation VARCHAR(1000),
    SubmissionDate DATE,
    CreatedAt DATE DEFAULT GETDATE(),
    FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID)
);
GO


   -- EXPENSE TABLE

IF OBJECT_ID('dbo.Expense', 'U') IS NOT NULL
    DROP TABLE dbo.Expense;
GO

CREATE TABLE dbo.Expense (
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT NOT NULL,
    Month DATE NULL,
    ExpenseDescription VARCHAR(255) NULL,
    Type VARCHAR(255) NULL,
    ZarCost DECIMAL(5,2),
    CreatedAt DATE DEFAULT GETDATE(),
    FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID)
);
GO


   --AUDIT LOG TABLE

IF OBJECT_ID('dbo.AuditLog', 'U') IS NOT NULL
    DROP TABLE dbo.AuditLog;
GO

CREATE TABLE dbo.AuditLog (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    PackageName VARCHAR(255),
    UserName VARCHAR(255),
    MachineName VARCHAR(255),
    TaskName VARCHAR(255),
    OperationType VARCHAR(255), -- Insert/Update/Delete
    TableName VARCHAR(255),
    [RowCount] INT,
    AuditTime DATETIME DEFAULT GETDATE(),
    FileProcessed VARCHAR(500),
    EmployeeID INT,
    EmployeeName VARCHAR(255)
);
GO
