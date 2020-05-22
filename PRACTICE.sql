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
PRIMARY KEY (Year, Semester)
FOREIGN KEY (SubjCode) references Subject
FOREIGN KEY (StaffID) references Teacher

Enrolment (StudentID, Year, Semester, DateEnrolled, Grade)
PRIMARY KEY (StudentID, Year, Semester)
FOREIGN KEY (StudentID) references Student
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

CREATE TABLE...