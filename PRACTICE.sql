-- NAME: Syed Asim Razvi
-- STUDENT ID: 103219618

/* RELATIONAL SCHEMA

Subject (SubjCode, Description)
PRIMARY KEY (SubjCode)

Teacher (StaffID, Surname, GivenName
PRIMARY KEY (StaffID)

Student (StudentID, Surname, GivenName, Gender)
PRIMARY KEY (StudentID)

SubjectOffering (Year, Semester, Fee, SubjCode, StaffID)
PRIMARY KEY (SubjCode, Year, Semester)
FOREIGN KEY (SubjCode) references Subject
FOREIGN KEY (StaffID) references Teacher

Enrolment (StudentID, SubjCode, Year, Semester, DateEnrolled, Grade)
PRIMARY KEY (StudentID, SubjCode, Year, Semester)
FOREIGN KEY (StudentID) references Student
FOREIGN KEY (SubjCode) references Subject
FOREIGN KEY (Year) references SubjectOffering
FOREIGN KEY (Semester) references SubjectOffering

*/


IF OBJECT_ID('SUBJECT') IS NOT NULL
	DROP TABLE SUBJECT;
IF OBJECT_ID('TEACHER') IS NOT NULL
	DROP TABLE TEACHER;
IF OBJECT_ID('STUDENT') IS NOT NULL
	DROP TABLE STUDENT;
IF OBJECT_ID('SUBJECTOFFERING') IS NOT NULL
	DROP TABLE SUBJECTOFFERING;
IF OBJECT_ID('ENROLMENT') IS NOT NULL
	DROP TABLE ENROLMENT;

GO

CREATE TABLE Subject
(
    SubjCode NVARCHAR(100),
    Description NVARCHAR(500),
    PRIMARY KEY		(SubjCode)
);

CREATE TABLE Teacher
(
    StaffID INT CHECK (StaffID between 0 and 99999999),
    Surname NVARCHAR(100) NOT NULL,
    GivenName NVARCHAR(100) NOT NULL,
    PRIMARY KEY		(StaffID)
);

CREATE TABLE Student
(
    StudentID NVARCHAR(10),
    Surname NVARCHAR(100) NOT NULL,
    GivenName NVARCHAR(100) NOT NULL,
    Gender NVARCHAR(1) CHECK (Gender in ('M', 'F', 'I')),
    PRIMARY KEY		(StudentID)
);

CREATE TABLE SubjectOffering
(
    SubjCode NVARCHAR(100),
    Year INT CHECK (Year between 0 and 9999),
    Semester INT CHECK (Semester in (1,2)),
    Fee MONEY CHECK (Fee > 0) NOT NULL,
    StaffID INT CHECK (StaffID between 0 and 99999999),
    PRIMARY KEY		(SubjCode, Year, Semester),
    FOREIGN KEY		(SubjCode) references Subject,
    FOREIGN KEY		(StaffID) references Teacher
);

CREATE TABLE Enrolment
(
    StudentID NVARCHAR(10),
    SubjCode NVARCHAR(100),
    Year INT CHECK (Year between 0 and 9999),
    Semester INT CHECK (Semester in (1,2)),
    Grade NVARCHAR(2) CHECK(Grade in ('N','P', 'C', 'D', 'HD')),
    DateEnrolled DATE,
    PRIMARY KEY		(StudentID, SubjCode, Year, Semester),
    FOREIGN KEY		(StudentID) references Student,
    FOREIGN KEY		(SubjCode, Year, Semester) references SubjectOffering
);



INSERT INTO SUBJECT
    (SubjCode, Description)
VALUES
    ('ICTWEB425', 'Apply SQL to extract & manipulate date'),
    ('ICTDBS403', 'Create Basic Databases'),
    ('ICTDBS502', 'Design a Database');

INSERT INTO TEACHER
    (StaffID, Surname, GivenName)
VALUES
    (98776655, 'Starr', 'Ringo'),
    (87665544, 'Lennon', 'John'),
    (76554433, 'McCartney', 'Paul');

INSERT INTO STUDENT
    (StudentID, Surname, GivenName, Gender)
VALUES
    ('s12233445', 'Morrison', 'Scott', 'M'),
    ('s23344556', 'Gillard', 'Julia', 'F'),
    ('s34455667', 'Whitlam', 'Gough', 'M'),
    ('103219618', 'Syed', 'Razvi', 'M');

INSERT INTO SUBJECTOFFERING
    (SubjCode, Year, Semester, Fee, StaffID)
VALUES
    ('ICTWEB425', 2018, 1, 200, 98776655),
    ('ICTWEB425', 2019, 1, 225, 98776655),
    ('ICTDBS403', 2019, 1, 200, 87665544),
    ('ICTDBS403', 2019, 2, 200, 76554433),
    ('ICTDBS502', 2018, 2, 225, 87665544);

INSERT INTO ENROLMENT
    (StudentID, SubjCode, Year, Semester, Grade)
VALUES
    ('103219618', 'ICTDBS403', 2019, 1, 'HD'),
    ('s12233445', 'ICTWEB425', 2018, 1, 'D'),
    ('s23344556', 'ICTWEB425', 2018, 1, 'P'),
    ('s12233445', 'ICTWEB425', 2019, 1, 'C'),
    ('s23344556', 'ICTWEB425', 2019, 1, 'HD'),
    ('s34455667', 'ICTWEB425', 2019, 1, 'P'),
    ('s12233445', 'ICTDBS403', 2019, 1, 'C'),
    ('s23344556', 'ICTDBS403', 2019, 2, NULL),
    ('s34455667', 'ICTDBS403', 2019, 2, NULL),
    ('s23344556', 'ICTDBS502', 2018, 2, 'P'),
    ('s34455667', 'ICTDBS502', 2018, 2, 'N');