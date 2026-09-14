-- ============================================================
-- ASSIGNMENT 4: EMPLOYEE MANAGEMENT AND SQL QUERIES
-- ============================================================

-- QUESTION 1: Create a database named employee_db.
CREATE DATABASE IF NOT EXISTS employee_db;

USE employee_db;


-- QUESTION 2: Create an employees table containing:
-- emp_id PRIMARY KEY, emp_name, emp_age, emp_department,
-- emp_salary and emp_city.

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    emp_age INT,
    emp_department VARCHAR(30),
    emp_salary DECIMAL(10,2),
    emp_city VARCHAR(30)
);


-- QUESTION 3: Insert 10 employees.

INSERT INTO employees
(emp_id, emp_name, emp_age, emp_department, emp_salary, emp_city)
VALUES
(1, 'Amit', 28, 'IT', 65000, 'Lucknow'),
(2, 'Riya', 24, 'HR', 45000, 'Delhi'),
(3, 'Ankit', 30, 'Finance', 70000, 'Mumbai'),
(4, 'Neha', 27, 'IT', 55000, 'Lucknow'),
(5, 'Arjun', 32, 'HR', 62000, 'Delhi'),
(6, 'Pooja', 26, 'Finance', 48000, 'Kanpur'),
(7, 'Rahul', 29, 'IT', 75000, 'Delhi'),
(8, 'Sneha', 23, 'Sales', 35000, 'Lucknow'),
(9, 'Aditya', 31, 'Sales', 58000, 'Kanpur'),
(10, 'Kavita', 35, 'IT', NULL, 'Mumbai');


-- QUESTION 4: Display all employees.

SELECT *
FROM employees;


-- QUESTION 5: Update the salary of one employee.

UPDATE employees
SET emp_salary = 80000
WHERE emp_id = 1;


-- QUESTION 6: Change the city of one employee.

UPDATE employees
SET emp_city = 'Noida'
WHERE emp_id = 2;


-- QUESTION 7: Delete one employee.

DELETE FROM employees
WHERE emp_id = 10;


-- ============================================================
-- SECTION A: BASIC FILTERING QUESTIONS
-- ============================================================

-- QUESTION 8: Find employees earning more than 50,000.

SELECT *
FROM employees
WHERE emp_salary > 50000;


-- QUESTION 9: Find employees from the IT department.

SELECT *
FROM employees
WHERE emp_department = 'IT';


-- QUESTION 10: Find employees from Lucknow.

SELECT *
FROM employees
WHERE emp_city = 'Lucknow';


-- QUESTION 11: Find employees earning between 40,000 and 60,000.

SELECT *
FROM employees
WHERE emp_salary BETWEEN 40000 AND 60000;


-- QUESTION 12: Find employees whose name starts with A.

SELECT *
FROM employees
WHERE emp_name LIKE 'A%';


-- QUESTION 13: Find employees whose name ends with a.

SELECT *
FROM employees
WHERE emp_name LIKE '%a';


-- QUESTION 14: Find employees belonging to IT or HR.

SELECT *
FROM employees
WHERE emp_department IN ('IT', 'HR');


-- QUESTION 15: Find employees older than 25 and earning more than 50,000.

SELECT *
FROM employees
WHERE emp_age > 25
  AND emp_salary > 50000;


-- QUESTION 16: Find employees whose salary is NULL.

SELECT *
FROM employees
WHERE emp_salary IS NULL;


-- QUESTION 17: Find employees whose salary is NOT NULL.

SELECT *
FROM employees
WHERE emp_salary IS NOT NULL;


-- ============================================================
-- SECTION B: SORTING AND GROUPING QUESTIONS
-- ============================================================

-- QUESTION 18: Sort employees by salary in ascending order.

SELECT *
FROM employees
ORDER BY emp_salary ASC;


-- QUESTION 19: Sort employees from highest salary to lowest salary.

SELECT *
FROM employees
ORDER BY emp_salary DESC;


-- QUESTION 20: Count employees in every department.

SELECT emp_department, COUNT(*) AS employee_count
FROM employees
GROUP BY emp_department;


-- QUESTION 21: Find the average salary per department.

SELECT emp_department, AVG(emp_salary) AS average_salary
FROM employees
GROUP BY emp_department;


-- QUESTION 22: Find the maximum salary per department.

SELECT emp_department, MAX(emp_salary) AS maximum_salary
FROM employees
GROUP BY emp_department;


-- QUESTION 23: Find departments having more than 5 employees.

SELECT emp_department, COUNT(*) AS employee_count
FROM employees
GROUP BY emp_department
HAVING COUNT(*) > 5;


-- QUESTION 24: Find departments whose average salary is greater than 60,000.

SELECT emp_department, AVG(emp_salary) AS average_salary
FROM employees
GROUP BY emp_department
HAVING AVG(emp_salary) > 60000;


-- QUESTION 25: Sort departments by average salary.

SELECT emp_department, AVG(emp_salary) AS average_salary
FROM employees
GROUP BY emp_department
ORDER BY average_salary ASC;


-- QUESTION 26: Find the number of employees in every city.

SELECT emp_city, COUNT(*) AS employee_count
FROM employees
GROUP BY emp_city;


-- QUESTION 27: Find cities having more than 3 employees.

SELECT emp_city, COUNT(*) AS employee_count
FROM employees
GROUP BY emp_city
HAVING COUNT(*) > 3;


-- ============================================================
-- SECTION C: AGGREGATE FUNCTION QUESTIONS
-- ============================================================

-- QUESTION 28: Find the total number of employees.

SELECT COUNT(*) AS total_employees
FROM employees;


-- QUESTION 29: Find the total salary.

SELECT SUM(emp_salary) AS total_salary
FROM employees;


-- QUESTION 30: Find the average salary.

SELECT AVG(emp_salary) AS average_salary
FROM employees;


-- QUESTION 31: Find the maximum salary.

SELECT MAX(emp_salary) AS maximum_salary
FROM employees;


-- QUESTION 32: Find the minimum salary.

SELECT MIN(emp_salary) AS minimum_salary
FROM employees;


-- QUESTION 33: Find the average salary of IT employees.

SELECT AVG(emp_salary) AS average_IT_salary
FROM employees
WHERE emp_department = 'IT';


-- QUESTION 34: Find the highest salary in HR.

SELECT MAX(emp_salary) AS highest_HR_salary
FROM employees
WHERE emp_department = 'HR';


-- QUESTION 35: Find the total salary paid to Finance employees.

SELECT SUM(emp_salary) AS total_Finance_salary
FROM employees
WHERE emp_department = 'Finance';


-- QUESTION 36: Find the number of employees in Delhi.

SELECT COUNT(*) AS Delhi_employee_count
FROM employees
WHERE emp_city = 'Delhi';


-- QUESTION 37: Find the average salary of employees earning more than 50,000.

SELECT AVG(emp_salary) AS average_salary
FROM employees
WHERE emp_salary > 50000;


-- QUESTION 38: Find the department-wise total salary.

SELECT emp_department, SUM(emp_salary) AS total_salary
FROM employees
GROUP BY emp_department;


-- QUESTION 39: Find the department-wise average salary.

SELECT emp_department, AVG(emp_salary) AS average_salary
FROM employees
GROUP BY emp_department;


-- QUESTION 40: Find the department with the highest average salary.

SELECT emp_department, AVG(emp_salary) AS average_salary
FROM employees
GROUP BY emp_department
ORDER BY average_salary DESC
LIMIT 1;


-- QUESTION 41: Find the department with the highest total salary.

SELECT emp_department, SUM(emp_salary) AS total_salary
FROM employees
GROUP BY emp_department
ORDER BY total_salary DESC
LIMIT 1;


-- QUESTION 42: Find the city-wise employee count.

SELECT emp_city, COUNT(*) AS employee_count
FROM employees
GROUP BY emp_city;