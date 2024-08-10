CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,  -- Primary Key
    FirstName VARCHAR(50) NOT NULL,            -- NOT NULL constraint
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,                 -- UNIQUE constraint
    BirthDate DATE,
    EnrollmentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- DEFAULT constraint
    GPA DECIMAL(3, 2) CHECK (GPA >= 0.0 AND GPA <= 4.0) -- CHECK constraint
);

CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0)
);

CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),  -- FOREIGN KEY constraint
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

--DESCRIBING TABLES;
DESCRIBE Students;
DESCRIBE Courses;
DESCRIBE Enrollments;

--INSERTING VALUES IN THE TABLES WITH CONSTRAINTS
-- Inserting data into the Students table
INSERT INTO Students (FirstName, LastName, Email, BirthDate, GPA)
VALUES
('John', 'Doe', 'john.doe@example.com', '2000-01-15', 3.5),
('Jane', 'Smith', 'jane.smith@example.com', '1999-02-20', 3.8);

-- Inserting data into the Courses table
INSERT INTO Courses (CourseName, Credits)
VALUES
('Database Systems', 4),
('Algorithms', 3);

-- Inserting data into the Enrollments table
INSERT INTO Enrollments (StudentID, CourseID)
VALUES
(1, 1),  -- John Doe enrolled in Database Systems
(2, 2);  -- Jane Smith enrolled in Algorithms
