USE Finance;

--CREATING THE TABLES----------------------
CREATE TABLE Employees (
    EmployeeID int,
    Name varchar(255),
    Age int,
    Gender varchar(10),
    DepartmentID int,
    Salary decimal
);

CREATE TABLE Departments (
    DepartmentID int,
    DepartmentName varchar(255),
    Location varchar(255)
);

CREATE TABLE Projects (
    ProjectID int,
    ProjectName varchar(255),
    DepartmentID int,
    Budget decimal
);


--INSERTING THE VALUES---------------------------
INSERT INTO Employees (EmployeeID, Name, Age, Gender, DepartmentID, Salary)
VALUES 
    (1, 'John Doe', 30, 'Male', 1, 50000),
    (2, 'Jane Smith', 25, 'Female', 2, 60000),
    (3, 'Sam Brown', 28, 'Male', 1, 55000),
    (4, 'Nancy White', 32, 'Female', 3, 65000),
    (5, 'Mike Green', 35, 'Male', 4, 70000);

INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES 
    (1, 'HR', 'New York'),
    (2, 'Finance', 'London'),
    (3, 'Engineering', 'San Francisco'),
    (4, 'Marketing', 'Chicago');

INSERT INTO Projects (ProjectID, ProjectName, DepartmentID, Budget)
VALUES 
    (101, 'Project Alpha', 1, 100000),
    (102, 'Project Beta', 2, 150000),
    (103, 'Project Gamma', 3, 200000),
    (104, 'Project Delta', 4, 250000),
    (105, 'Project Epsilon', 1, 120000);


--DISPLAYING THE EMPLOYEES TABLE----------------------------------
SELECT * FROM Employees;

--DISPLAYING THE DEPARTMENTS TABLE-----------------------------
SELECT * FROM Departments;

--DISPLAYING THE PROJECTS TABLE----------------------------
SELECT * FROM Projects;


--JOINS--------------------------------------------------
-- INNER JOIN
SELECT Employees.Name, Employees.Age, Departments.DepartmentName, Departments.Location
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- LEFT JOIN
SELECT Employees.Name, Employees.Age, Departments.DepartmentName, Departments.Location
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- RIGHT JOIN
SELECT Employees.Name, Employees.Age, Departments.DepartmentName, Departments.Location
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- FULL OUTER JOIN
SELECT Employees.Name, Employees.Age, Departments.DepartmentName, Departments.Location
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
UNION
SELECT Employees.Name, Employees.Age, Departments.DepartmentName, Departments.Location
FROM Employees
RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- CROSS JOIN
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments;

--QUERIES WITH CONDITION
SELECT Employees.Name, Projects.ProjectName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
INNER JOIN Projects ON Departments.DepartmentID = Projects.DepartmentID
WHERE Projects.Budget > 150000;
