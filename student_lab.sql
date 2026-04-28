CREATE TABLE STUDENT (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Major VARCHAR(50),
    Year INT
);

CREATE TABLE INSTRUCTOR (
    InstructorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50)
);

CREATE TABLE COURSE (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100),
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES INSTRUCTOR(InstructorID)
);

CREATE TABLE ENROLLMENT (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
    FOREIGN KEY (CourseID) REFERENCES COURSE(CourseID)
);

SHOW TABLES;
DESCRIBE STUDENT;

INSERT INTO STUDENT VALUES
(1, 'John', 'Doe', 'Computer Science', 2),
(2, 'Jane', 'Smith', 'Biology', 3),
(3, 'Mike', 'Brown', 'Mathematics', 1),
(4, 'Emily', 'Davis', 'Engineering', 4),
(5, 'Chris', 'Wilson', 'Physics', 2);

INSERT INTO INSTRUCTOR VALUES
(1, 'Dr. Adams', 'Computer Science'),
(2, 'Dr. Lee', 'Biology'),
(3, 'Dr. Clark', 'Mathematics');

INSERT INTO COURSE VALUES
(101, 'Database Systems', 1),
(102, 'Biology 101', 2),
(103, 'Calculus I', 3),
(104, 'Physics I', 3);

INSERT INTO ENROLLMENT VALUES
(1, 1, 101, 'A'),
(2, 2, 102, 'B'),
(3, 3, 103, 'A'),
(4, 1, 103, 'B'),
(5, 4, 104, 'A'),
(6, 5, 101, 'C');

SELECT * FROM STUDENT;
SELECT * FROM INSTRUCTOR;
SELECT * FROM COURSE;
SELECT * FROM ENROLLMENT;

UPDATE STUDENT
SET Major = 'Data Science'
WHERE StudentID = 1;

UPDATE COURSE
SET InstructorID = 2
WHERE CourseID = 101;

UPDATE ENROLLMENT
SET Grade = 'A'
WHERE EnrollmentID = 2;

DELETE FROM ENROLLMENT
WHERE EnrollmentID = 6;

DELETE FROM STUDENT
WHERE StudentID = 1;

DELETE FROM ENROLLMENT
WHERE StudentID = 1;

DELETE FROM STUDENT
WHERE StudentID = 1;

DELETE FROM ENROLLMENT
WHERE StudentID = 1;

DELETE FROM STUDENT
WHERE StudentID = 1;

SELECT * FROM STUDENT;
SELECT * FROM ENROLLMENT;

SELECT * FROM STUDENT
ORDER BY LastName;

SELECT * FROM COURSE
WHERE InstructorID = 2;

SELECT s.FirstName, s.LastName, c.Title
FROM STUDENT s
JOIN ENROLLMENT e ON s.StudentID = e.StudentID
JOIN COURSE c ON e.CourseID = c.CourseID;

SELECT s.FirstName, s.LastName, e.Grade
FROM STUDENT s
JOIN ENROLLMENT e ON s.StudentID = e.StudentID
WHERE e.CourseID = 101;

SELECT c.Title, COUNT(e.StudentID) AS TotalStudents
FROM COURSE c
LEFT JOIN ENROLLMENT e ON c.CourseID = e.CourseID
GROUP BY c.Title;