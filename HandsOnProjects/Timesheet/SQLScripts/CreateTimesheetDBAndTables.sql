/* =================================================
   SQL STATEMENTS FOR AUTOMATED SSIS TIMESHEET PROJECT
   ================================================= */

-- 1) Create the database if it doesn't exist
IF DB_ID(N'TimesheetDB') IS NULL
    CREATE DATABASE TimesheetDB;
GO

USE TimesheetDB;
GO

-- 2) EMPLOYEE table
IF OBJECT_ID(N'dbo.Employee', 'U') IS NOT NULL
    DROP TABLE dbo.Employee;
GO

CREATE TABLE dbo.Employee (
    EmployeeID   INT         IDENTITY(1,1) PRIMARY KEY,
    FullName     VARCHAR(100) NOT NULL,
    CreatedAt    DATETIME    NOT NULL DEFAULT GETDATE()
);
GO

-- 3) CLIENT table
IF OBJECT_ID(N'dbo.Client', 'U') IS NOT NULL
    DROP TABLE dbo.Client;
GO

CREATE TABLE dbo.Client (
    ClientID    INT          IDENTITY(1,1) PRIMARY KEY,
    ClientName  VARCHAR(255) NOT NULL UNIQUE,
    CreatedAt   DATETIME     NOT NULL DEFAULT GETDATE()
);
GO

-- 4) DESCRIPTION table
IF OBJECT_ID(N'dbo.Description', 'U') IS NOT NULL
    DROP TABLE dbo.Description;
GO

CREATE TABLE dbo.Description (
    DescriptionID INT         IDENTITY(1,1) PRIMARY KEY,
    Description   VARCHAR(100) NOT NULL,
    CreatedAt     DATETIME     NOT NULL DEFAULT GETDATE()
);
GO

-- 5) TIMESHEET table
IF OBJECT_ID(N'dbo.Timesheet', 'U') IS NOT NULL
    DROP TABLE dbo.Timesheet;
GO

CREATE TABLE dbo.Timesheet (
    TimesheetID   INT           IDENTITY(1,1) PRIMARY KEY,
    EmployeeID    INT           NOT NULL,
    [Date]        DATE          NOT NULL,
    DayOfWeek     VARCHAR(50)   NULL,
    ClientID      INT           NOT NULL,
    ProjectName   VARCHAR(255)  NULL,
    DescriptionID INT           NOT NULL,
    Billable      VARCHAR(10)   NULL,
    Comments      VARCHAR(255)  NULL,
    TotalHours    DECIMAL(5,2)  NULL,
    StartTime     TIME          NULL,
    EndTime       TIME          NULL,
    CreatedAt     DATETIME      NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Timesheet_Employee    FOREIGN KEY (EmployeeID)    REFERENCES dbo.Employee(EmployeeID),
    CONSTRAINT FK_Timesheet_Client      FOREIGN KEY (ClientID)      REFERENCES dbo.Client(ClientID),
    CONSTRAINT FK_Timesheet_Description FOREIGN KEY (DescriptionID) REFERENCES dbo.Description(DescriptionID)
);
GO

-- 6) LEAVE table
IF OBJECT_ID(N'dbo.Leave', 'U') IS NOT NULL
    DROP TABLE dbo.Leave;
GO

CREATE TABLE dbo.Leave (
    LeaveID           INT           IDENTITY(1,1) PRIMARY KEY,
    EmployeeID        INT           NOT NULL,
    TypeOfLeave       VARCHAR(255)  NULL,
    StartDate         DATE          NULL,
    EndDate           DATE          NULL,
    NumberOfDays      DECIMAL(4,1)  NULL,
    ApprovalObtained  VARCHAR(255)  NULL,
    SickNoteProvided  VARCHAR(255)  NULL,
    ContactInformation VARCHAR(1000) NULL,
    SubmissionDate    DATE          NULL,
    CreatedAt         DATETIME      NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Leave_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID)
);
GO

-- 7) EXPENSE table
IF OBJECT_ID(N'dbo.Expense', 'U') IS NOT NULL
    DROP TABLE dbo.Expense;
GO

CREATE TABLE dbo.Expense (
    ExpenseID          INT           IDENTITY(1,1) PRIMARY KEY,
    EmployeeID         INT           NOT NULL,
    [Month]            DATE          NULL,
    ExpenseDescription VARCHAR(255)  NULL,
    Type               VARCHAR(100)  NULL,
    ZarCost            DECIMAL(5,2)  NULL,
    CreatedAt          DATETIME      NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Expense_Employee FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID)
);
GO

-- 8) AUDIT LOG table
IF OBJECT_ID(N'dbo.AuditLog', 'U') IS NOT NULL
    DROP TABLE dbo.AuditLog;
GO

CREATE TABLE dbo.AuditLog (
    AuditID       INT         IDENTITY(1,1) PRIMARY KEY,
    PackageName   VARCHAR(255) NULL,
    TaskName      VARCHAR(255) NULL,
    OperationType VARCHAR(50)  NULL,
    EntityType    VARCHAR(255) NULL,
    [RowCount]      INT          NULL,
    AuditTime     DATETIME     NOT NULL DEFAULT GETDATE(),
    FileProcessed VARCHAR(500) NULL,
    EmployeeID    INT          NULL,
    EmployeeName  VARCHAR(255) NULL
);
GO


/***** SSIS PROJECT DEPLOYMENT SCRIPT 
DECLARE @ProjectBinary VARBINARY(MAX);

-- read the .ispac file as a single BLOB
SELECT @ProjectBinary = BulkColumn
FROM   OPENROWSET(
         BULK '$(IspacFullPath)',         
         SINGLE_BLOB
       ) AS ProjectFile;

--Create SSIS Folder 
EXEC SSISDB.catalog.create_folder 
     @folder_name = N'AutomatedTimesheetProject',
     @folder_id   = NULL;

EXEC SSISDB.catalog.deploy_project
     @folder_name   = N'AutomatedTimesheetProject',
     @project_name  = N'SSIS_Automated_Timesheet_Project',
     @project_stream= @ProjectBinary,
     @operation_id  = NULL; *****/

