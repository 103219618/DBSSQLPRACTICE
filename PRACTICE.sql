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

CREATE TABLE Subject (
SubjCode		NVARCHAR(100),
Description		NVARCHAR(500),
PRIMARY KEY		(SubjCode)
);

CREATE TABLE Teacher (
StaffID			INT,
Surname			NVARCHAR(100) NOT NULL,
GivenName		NVARCHAR(100) NOT NULL,
PRIMARY KET		(StaffID)
);

CREATE TABLE Student (
StudentID		NVARCHAR(10),
Surname			NVARCHAR(100) NOT NULL,
GivenName		NVARCHAR(100) NOT NULL,
Gender 			NVARCHAR(1) CHECK (Gender in ('M', 'F', 'I')),
PRIMARY KEY		(StudentID)
);

CREATE TABLE SubjectOffering (
SubjCode		NVARCHAR(100),
Year			INT,
Semester 		INT CHECK (Semester = 1 OR Semester = 2),
Fee			MONEY CHECK (Fee>0) NOT NULL,
StaffID			INT,
PRIMARY KEY		(SubjCode, Year, Semester),
FOREIGN KEY		(SubjCode) references Subject,
FOREIGN KEY		(StaffID) references Teacher
);

CREATE TABLE Enrolment (
StudentID		NVARCHAR(10),
SubjCode		NVARCHAR(100),
Year			INT,
Semester 		INT CHECK (Semester = 1 OR Semester = 2),
Grade 			NVARCHAR(2) CHECK(Grade in ('N','P', 'C', 'D', 'HD')),
DateEnrolled		DATE,
PRIMARY KEY		(StudentID, SubjCode, Year, Semester),
FOREIGN KEY		(StudentID) references Student,
FOREIGN KEY		(SubjCode) references Subject,
FOREIGN KEY		(Year) references SubjectOffering,
FOREIGN KEY		(Semester) references SubjectOffering
);



