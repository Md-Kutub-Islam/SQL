SHOW DATABASES
CREATE DATABASE IF NOT EXISTS techwithpriya
USE techwithpriya
SELECT database() we run this command if we forgot the database which i work--  

CREATE TABLE employee(
	EID INT AUTO_INCREMENT,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Age INT NOT NULL,
    Salary INT NOT NULL,
    Location varchar(50) NOT NULL,
    PRIMARY KEY(EID)
)

DESC employee
DROP TABLE employee

SHOW TABLES

-- When we run multiple line of the code in once then use semicolon
INSERT employee(FirstName, LastName, age, Salary, Location) values ("Shalik", "Ali", 22, 20000, "Asansol");
INSERT employee(FirstName, LastName, age, Salary, Location) values ("Shokail", "Khane", 21, 10000, "Dhanbad");
INSERT employee(FirstName, LastName, age, Salary, Location) values ("Shakil", "Ali", 20, 30000, "Kumardhubi");
INSERT employee(FirstName, LastName, age, Salary, Location) values ("Arman", "Anasari", 22, 50000, "Bokaro");
INSERT employee(FirstName, LastName, age, Salary, Location) values ("Akram", "Khan", 22, 60000, "Asansol");

SELECT * FROM employee

-- Write a query to fetch emoloyee whose salary is more than 100000
SELECT * FROM employee WHERE Salary > 20000

-- Fetch only FirstName and LastName  whose salary more than 10000
SELECT FirstName, LastName FROM employee WHERE Salary > 20000

-- Fetch data of employee whose age > 21 
SELECT * FROM employee WHERE age > 21

-- Update the LastName of Aman
UPDATE employee SET LastName = "Khan" WHERE EID = 4

-- Delete the record of EID 4
DELETE FROM employee WHERE EID = 4 