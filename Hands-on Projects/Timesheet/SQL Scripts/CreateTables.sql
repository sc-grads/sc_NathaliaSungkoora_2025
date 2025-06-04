

--Creating different tables


--CLIENTS TABLE
CREATE TABLE clients (
    client_id INT IDENTITY(1,1) PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL UNIQUE
);

SELECT * FROM clients


--(2)PROJECTS TABLE
CREATE TABLE projects (
    project_id INT IDENTITY(1,1) PRIMARY KEY,
    client_id INT NOT NULL,
    project_name VARCHAR(255) NOT NULL,
    CONSTRAINT FK_projects_clients FOREIGN KEY (client_id)
        REFERENCES clients(client_id),
    CONSTRAINT UQ_projects_client_project UNIQUE (client_id, project_name)
);

SELECT * FROM  projects

--TIMESHEET ENTRIES TABLE

CREATE TABLE timesheet_entries (
    entry_id INT IDENTITY(1,1) PRIMARY KEY,
    project_id INT NOT NULL,
    work_date DATE NOT NULL,
    day_of_week VARCHAR(20),
    description VARCHAR(1000),
    billable_or_non_billable VARCHAR(50),
    comments VARCHAR(2000),
    total_hours DECIMAL(5,2),
    start_time TIME,
    end_time TIME,
    CONSTRAINT FK_timesheet_entries_projects FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
);
