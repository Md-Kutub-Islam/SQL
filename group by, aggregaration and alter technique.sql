SHOW DATABASES
USE techwithpriya
DESC learners
SHOW TABLES

SELECT * FROM course
SELECT * FROM learners
SELECT * FROM employee
--  count the number of student who joined via Linkdin, WhatApp, youTube
SELECT SourceOfJoining, COUNT(*) as num_of_students FROM learners GROUP BY SourceOfJoining

-- Group By SourceOfJoining and Location
SELECT SourceOfJoining, Location, COUNT(*) as num_of_students FROM learners GROUP BY SourceOfJoining, Location

-- Coresponding to each course, how many student have enrolled
SELECT SelectedCourse
, COUNT(*) as num_of_students FROM learners GROUP BY SelectedCourse

-- Coresponding TO individual souce of joining give the maxium year of experiance any person
SELECT SourceOfJoining, MAX(YearOfExperonce) AS max_year_exp FROM learners GROUP BY SourceOfJoining


-- Coresponding TO individual souce of joining give the minum year of experiance any person
SELECT SourceOfJoining, MIN(YearOfExperonce) AS min_year_exp FROM learners GROUP BY SourceOfJoining

-- Coresponding TO individual souce of joining give the average year of experiance any person
SELECT SourceOfJoining, AVG(YearOfExperonce) AS avg_year_exp FROM learners GROUP BY SourceOfJoining

-- when ever you apply filter on Aggregrtion you have to use HAVING insted of WHERE 
SELECT SourceOfJoining, COUNT(*) AS NUM_OF_STUDENT FROM learners GROUP BY SourceOfJoining HAVING NUM_OF_STUDENT>2

-- Display the count of those students who  joined via linkdin
SELECT  SourceOfJoining, COUNT(*) AS NUM_OF_STUDENT FROM learners GROUP BY SourceOfJoining HAVING SourceOfJoining="youTub"

-- Display the cource which dosn't include "Excel 
SELECT * FROM course WHERE CourseName NOT LIKE %"Excel"%

-- Display the record of those student who have 4 year experiance and source of joing Youtuble and location Banglore
SELECT * FROM learners WHERE  YearOfExperonce=4 AND SourceOfJoining="YouTub" AND Location="Kolkata"

-- Diplay the result of those students who have year of exprience between 1 to 4 years
 SELECT * FROM learners WHERE  YearOfExperonce BETWEEN 1 AND 4 

-- Display the record of those students who have less than 4 year of expreience or source of joing Youtub and location Asanso
SELECT * FROM Learners WHERE YearOfExperonce<3 OR SourceOfJoining="YouTub" OR Location="Asan"


-- Alter command in SQL
ALTER TABLE employee ADD column jobPosition varchar(50)
ALTER TABLE employee MODIFY COLUMN firstName VARCHAR(40)
ALTER TABLE employee DROP COLUMN jobPosition


-- Datatype in SQL -> DECIMAL
-- IMPLICIT TYPECASTING
INSERT INTO Course(CourseName, CourseDurationMonth, CourseFee) VALUE ("GRAPHQL Bootcamp", 1.5, 5000);
 
 CREATE TABLE course_Update(
	CourseID INT AUTO_INCREMENT,
    CourseName VARCHAR(50),
    CourseDurationMonth DECIMAL(3, 1) NOT NULL,
    CourseFee INT NOT NULL,
    Change_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    PRIMARY KEY(CourseID)
);

DROP TABLE course_Update

INSERT INTO course_Update(CourseName, CourseDurationMonth, CourseFee) VALUE ("The complete Exel mastary course", 1.5, 2000);
INSERT INTO course_Update(CourseName, CourseDurationMonth, CourseFee) VALUE ("DSA for interview prepartion", 3.5, 5000);
INSERT INTO course_Update(CourseName, CourseDurationMonth, CourseFee) VALUE ("SQL Bootcamp", 1, 3000);
INSERT INTO course_Update(CourseName, CourseDurationMonth, CourseFee) VALUE ("GRAPHQL Bootcamp", 1.5, 5000);
 
SELECT * FROM course_Update
INSERT INTO course_Update(CourseName, CourseDurationMonth, CourseFee) VALUE ("RABITMQ Bootcamp", 0.5, 2000);

UPDATE course_Update SET CourseFee=4999 WHERE CourseID=3