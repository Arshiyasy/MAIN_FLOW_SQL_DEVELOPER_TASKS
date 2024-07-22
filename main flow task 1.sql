--CREATE A NEW DATABASE
CREATE DATABASE OFFICE;

--USE THE DATABASE;
USE OFFICE;


-- Create a new table
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    salary FLOAT,
    department_id INT,
    PRIMARY KEY (employee_id));

--DESCRIBE TABLES
DESCRIBE employees;

-- Add a new column to the table
ALTER TABLE employees
ADD email VARCHAR(100);
DESCRIBE employees;

-- inserting data into the table
INSERT INTO employees (employee_id, first_name, last_name, hire_date, salary, 
department_id, email)VALUES
(1, 'John', 'Doe', '2023-01-15', 55000.00, 101, 'john.doe@example.com'),
(2, 'Jane', 'Smith', '2022-05-23', 60000.00, 102, NULL),
(3, 'Michael', 'Brown', '2021-11-02', 70000.00, 103, 'michael.brown@example.com'),
(4, 'Emily', 'Davis', '2020-03-30', 65000.00, 101, 'emily.davis@example.com'),
(5, 'Daniel', 'Wilson', '2019-07-19', 72000.00, 104, 'daniel.wilson@example.com');

--showing data and table using select statement
SELECT * FROM employees;
SELECT first_name, last_name
FROM employees
WHERE email IS NULL;

-- Modifying an existing column in the 'employees' table
ALTER TABLE employees
MODIFY COLUMN salary DECIMAL(12, 2);

-- Drop the table
DROP TABLE employees;