//*EXAMPLES*//

CREATE TABLE Student
(
    StudentID varchar(100) NOT NULL,
    StudentName varchar(1000),
    PRIMARY KEY (StudentID)
);

INSERT INTO Student (StudentID,StudentName) VALUES ('S1', 'StudentA');
INSERT INTO Student (StudentID,StudentName) VALUES ('S2');
INSERT INTO Student (StudentID,StudentName) VALUES ('StudentB');


SELECT * FROM Student

