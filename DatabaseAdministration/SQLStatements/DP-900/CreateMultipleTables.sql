-- Create the Student table first due to foreign key reference in Orders
CREATE TABLE Student (
    StudentID varchar(100) NOT NULL,
    StudentName varchar(1000),
    PRIMARY KEY (StudentID)
);

-- Insert data into Student
INSERT INTO Student (StudentID, StudentName) VALUES ('S1', 'StudentA');
INSERT INTO Student (StudentID, StudentName) VALUES ('S2', 'StudentB');
INSERT INTO Student (StudentID, StudentName) VALUES ('S3', 'StudentC');

-- Create the Course table
CREATE TABLE Course (
    CourseID varchar(100) NOT NULL,
    CourseName varchar(1000),
    Price real,
    PRIMARY KEY (CourseID)
);

-- Insert data into Course
INSERT INTO Course (CourseID, CourseName, Price) VALUES ('C1', 'AZ-900', 99.99);
INSERT INTO Course (CourseID, CourseName, Price) VALUES ('C2', 'DP-900', 100.99);
INSERT INTO Course (CourseID, CourseName, Price) VALUES ('C3', 'AZ-104', 89.99);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID varchar(100) NOT NULL,
    CourseID varchar(100),
    StudentID varchar(100),
    Discountpercent int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert data into Orders
INSERT INTO Orders (OrderID, CourseID, StudentID, Discountpercent) VALUES ('O1', 'C2', 'S1', 90);
INSERT INTO Orders (OrderID, CourseID, StudentID, Discountpercent) VALUES ('O2', 'C1', 'S2', 50);
INSERT INTO Orders (OrderID, CourseID, StudentID, Discountpercent) VALUES ('O3', 'C3', 'S3', 60);

-- Query to verify data
SELECT * FROM [dbo].[Student];
SELECT * FROM [dbo].[Orders];
SELECT * FROM [dbo].[Course];