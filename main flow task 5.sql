--using of Database
use school;

--Creating a table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender CHAR(1),
    DOB DATE,
    Department VARCHAR(100),
    Salary DECIMAL(10, 2)
);

--Inserting data into the table
INSERT INTO Employees (EmpID, Name, Gender, DOB, Department, Salary)
VALUES
(1, 'John Doe', 'M', '1965-05-15', 'IT', 12000),
(2, 'Jane Smith', 'F', '1970-07-22', 'HR', 8000),
(3, 'Michael Johnson', 'M', '1980-03-30', 'Finance', 15000),
(4, 'Mary Williams', 'F', '1975-09-10', 'IT', 11000),
(5, 'James Brown', 'M', '1968-12-12', 'Finance', 9500),
(6, 'Patricia Taylor', 'F', '1982-04-05', 'HR', 13000),
(7, 'Joe Miller', 'M', '1963-01-25', 'IT', 14500),
(8, 'Mark Wilson', 'M', '1972-08-15', 'Marketing', 10500),
(9, 'Laura White', 'F', '1960-11-11', 'IT', 15500),
(10, 'Joseph Clark', 'M', '1985-02-14', 'HR', 9000);

--Showing the table
SELECT * FROM Employees;

--1. SQL Query to find the second highest salary of Employee.
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

--2. SQL Query to find Max Salary from each department.
SELECT Department, MAX(Salary) AS MaxSalary
FROM Employees
GROUP BY Department;

--3. Write SQL Query to display the current date.
SELECT CURRENT_DATE() AS CurrentDate;

--4. Write an SQL Query to check whether the date passed to Query is the date of the given format or not?
SELECT CASE
    WHEN STR_TO_DATE('2024-08-19', '%Y-%m-%d') IS NOT NULL THEN 'Valid Format'
    ELSE 'Invalid Format'
END AS DateFormatCheck;

--5. Write an SQL Query to print the name of the distinct employee whose DOB is between 01/01/1960 to 31/12/1975.
SELECT DISTINCT Name
FROM Employees
WHERE DOB BETWEEN '1960-01-01' AND '1975-12-31';

--6. Write an SQL Query to find the number of employees according to gender whose DOB is between 01/01/1960 to 31/12/1975.
SELECT Gender, COUNT(*) AS EmployeeCount
FROM Employees
WHERE DOB BETWEEN '1960-01-01' AND '1975-12-31'
GROUP BY Gender;

--7. Write an SQL Query to find an employee whose salary is equal to or greater than 10000.
SELECT Name, Salary
FROM Employees
WHERE Salary >= 10000;

--8. Write an SQL Query to find the name of an employee whose name Start with ‘M’
SELECT Name
FROM Employees
WHERE Name LIKE 'M%';

--9. find all Employee records containing the word "Joe", regardless of whether it was stored as JOE, Joe, or joe.
SELECT *
FROM Employees
WHERE LOWER(Name) LIKE '%joe%';

--10.Write an SQL Query to find the year from date.
SELECT Name, YEAR(DOB) AS YearOfBirth
FROM Employees;

