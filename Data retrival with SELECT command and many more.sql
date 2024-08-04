show DATABASES
USE techwithpriya
SHOW TABLES
SELECT * FROM employee

CREATE TABLE course(
	CourseID INT AUTO_INCREMENT,
    CourseName VARCHAR(50),
    CourseDurationMonth INT NOT NULL,
    CourseFee INT NOT NULL,
    PRIMARY KEY(CourseID)
);

DESC Course

INSERT Course(CourseName, CourseDurationMonth, CourseFee) VALUE ("The complete Exel mastary course", 1, 2000);
INSERT Course(CourseName, CourseDurationMonth, CourseFee) VALUE ("DSA for interview prepartion", 3, 5000);
INSERT Course(CourseName, CourseDurationMonth, CourseFee) VALUE ("SQL Bootcamp", 1, 3000);

SELECT * FROM Course

DELETE FROM Course WHERE CourseID = 2


CREATE TABLE Learners(
	LearnerID INT AUTO_INCREMENT,
    LearnerFirstName VARCHAR(50) NOT NULL,
    LearnerLastName VARCHAR(50) NOT NULL,
    LearnerPhoneNumber VARCHAR(15) NOT NULL,
    LearnerEmailID VARCHAR(50) NOT NULL,
    LearnerEnrollmentData TIMESTAMP,
    SelectedCourse INT NOT NULL,
    YearOfExperonce INT NOT NULL,
    LearnerCompany VARCHAR(50),
    SourceOfJoining VARCHAR(50) NOT NULL,
    Batch_Start_Date TIMESTAMP,
    Location VARCHAR(50) NOT NULL,
    PRIMARY KEY(LearnerID),
    UNIQUE KEY(LearnerEmailID),
    FOREIGN KEY(SelectedCourse) REFERENCES Course(CourseID)
)

SHOW DATABASES
USE techwithpriya

DESC Learners


DROP TABLE Learners

INSERT INTO Learners(LearnerFirstName, LearnerLastName, LearnerPhoneNumber, LearnerEmailID, LearnerEnrollmentData, SelectedCourse,YearOfExperonce, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) VALUE ("Rahul", "Kumar", "123456789", "rahul@gmail.com", '2024-02-05', 1, 1, "xyz", "YouTub", '2024-02-9', "Asansol");
INSERT INTO Learners(LearnerFirstName, LearnerLastName, LearnerPhoneNumber, LearnerEmailID, LearnerEnrollmentData, SelectedCourse,YearOfExperonce, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) VALUE ("Akhil", "Georger", "123565545", "akhil.gorge.8743@gmail.com", '2024-03-20', 3, 4, "xyz", "YouTub", '2024-03-25', "Kolkata");
INSERT INTO Learners(LearnerFirstName, LearnerLastName, LearnerPhoneNumber, LearnerEmailID, LearnerEnrollmentData, SelectedCourse,YearOfExperonce, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) VALUE ("Madhuram", "Ravichandran", "123456789", "ravichranran@gmail.com", '2024-01-10', 3, 5, "xyz", "YouTub", '2024-01-16', "Raniganj");
INSERT INTO Learners(LearnerFirstName, LearnerLastName, LearnerPhoneNumber, LearnerEmailID, LearnerEnrollmentData, SelectedCourse,YearOfExperonce, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) VALUE ("Naga", "Sai", "123456789", "nagasai@gmail.com", '2024-02-05', 1, 1, "xyz", "YouTub", '2024-02-9', "Asansol");
INSERT INTO Learners(LearnerFirstName, LearnerLastName, LearnerPhoneNumber, LearnerEmailID, LearnerEnrollmentData, SelectedCourse,YearOfExperonce, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) VALUE ("Jeevan", "Hegde", "123456789", "heevanhegde@gmail.com", '2024-03-21', 3, 1, "xyz", "YouTub", '2024-03-25', "Asansol");


SELECT * FROM Learners

SELECT * FROM course


-- Data Analysis 

-- 1. Give me the record of the employee with highest salary
SELECT * FROM employee ORDER BY salary DESC LIMIT 1

-- 2. Give me the record of the employee with highest salary age is higher than 22
SELECT * FROM employee WHERE age>20 ORDER BY salary DESC

-- Display the number of enrollment done in the website
SELECT COUNT(*) AS number_of_enrolment FROM Learners

-- How many people enrolled for courseID 3
SELECT COUNT(*) AS number_of_enrolment FROM Learners WHERE SelectedCourse=3

-- Count the number of enrollment done in the month of jan
SELECT COUNT(*) FROM Learners WHERE LearnerEnrollmentData LIKE '%-01-%'

-- Count the number of enrollment done in the month of jan 21
SELECT COUNT(*) FROM Learners WHERE LearnerEnrollmentData LIKE '%-01-21%'


-- UPDATE THE JEVAN DATA WITH YEAR OF EXPERIANCE AND COMPANY
UPDATE Learners SET YearOfExperonce=2, LearnerCompany='Amazone' WHERE LearnerID=8

-- Count the unique company in lerners table
SELECT COUNT(DISTINCT LearnerCompany) AS Count_Company FROM Learners