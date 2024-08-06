SHOW DATABASES
USE techwithpriya

DESC employee

SELECT * FROM employee
SELECT Location, COUNT(location) AS total, AVG(salary) AS avg_salary
 from employee GROUP BY Location

-- performing Joing 
SELECT firstName, lastName, employee.location, total, avg_salary FROM employee
JOIN
(SELECT location, COUNT(location) AS total, AVG(salary) AS avg_salary
FROM employee GROUP BY Location) AS temp
ON employee.location = temp.location

-- optimize the joing window function
SELECT firstName, lastName, location, COUNT(location) OVER (PARTITION BY location) AS total, AVG(salary) OVER (PARTITION BY location) AS salary from employee



INSERT employee(FirstName, LastName, age, Salary, Location) values ("uday", "shetty", 24, 50000, "tirat");
INSERT employee(FirstName, LastName, age, Salary, Location) values ("Abhijit", "Thakur", 25, 50000, "Kalla");


-- priority employee salary
-- diffrence between ROW_NUMBER() vs RANK() vs DENSE_RANK()
-- note: if there is no duplicate value in your data then all three function same value
SELECT firstName, lastName, salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS priority_emp FROM employee

SELECT firstName, lastName, salary, RANK() OVER (ORDER BY salary DESC) AS priority_emp FROM employee

SELECT firstName, lastName, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS priority_emp FROM employee

SELECT firstName, lastName, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS priority_emp FROM employee

-- Give me the record of second highest salary of employeee
SELECT * FROM
(SELECT firstName, lastName, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS priority_emp FROM employee) AS temp
WHERE priority_emp=2

-- Give me the first of second highest salary of employeee
SELECT * FROM
(SELECT firstName, lastName, salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS priority_emp FROM employee) AS temp
WHERE priority_emp=2

-- Specify the deatails of each employee having height salary people in each location
SELECT * FROM
(SELECT firstName, lastName, salary, location, ROW_NUMBER() OVER (PARTITION BY location ORDER BY salary DESC) AS priority_emp FROM employee) AS temp
WHERE priority_emp=1
