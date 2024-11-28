create database EdTech;

use edtech;

Create table Students(
StudentID INT primary key auto_increment,
FullName VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL UNIQUE,
RegistrationDate DATE NOT NULL);

INSERT INTO Students (FullName, Email, RegistrationDate)
VALUES
('John Doe', 'johndoe@example.com', '2024-01-15'),
('Jane Smith', 'janesmith@example.com', '2024-02-22'),
('Emily Davis', 'emilydavis@example.com', '2024-03-10'),
('Michael Brown', 'michaelbrown@example.com', '2024-04-05'),
('Sarah Wilson', 'sarahwilson@example.com', '2024-05-18'),
('David Clark', 'davidclark@example.com', '2024-06-12'),
('Olivia Martin', 'oliviamartin@example.com', '2024-07-25'),
('Daniel Taylor', 'danieltaylor@example.com', '2024-08-01'),
('Lucas Lee', 'lucaslee@example.com', '2024-09-10'),
('Sophia Walker', 'sophiawalker@example.com', '2024-10-15'),
('Benjamin Harris', 'benjamin.harris@example.com', '2024-01-30'),
('Ava Thomas', 'ava.thomas@example.com', '2024-02-10'),
('Ethan Clark', 'ethan.clark@example.com', '2024-03-20'),
('Charlotte Lee', 'charlotte.lee@example.com', '2024-04-14'),
('Mason Scott', 'mason.scott@example.com', '2024-05-30');


create Table Instructors(
InstructorID INT PRIMARY KEY,
Instructor_FullName VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL UNIQUE,
Instructor_PhoneNum VARCHAR(55));

INSERT INTO Instructors (InstructorID, Instructor_FullName, Email, Instructor_PhoneNum)
VALUES
(1, 'Dr. John Smith', 'john.smith@example.com', '555-123-4567'),
(2, 'Prof. Emily Johnson', 'emily.johnson@example.com', '555-234-5678'),
(3, 'Dr. Michael Brown', 'michael.brown@example.com', '555-345-6789'),
(4, 'Dr. Sarah Davis', 'sarah.davis@example.com', '555-456-7890'),
(5, 'Prof. James Wilson', 'james.wilson@example.com', '555-567-8901'),
(6, 'Dr. Linda Moore', 'linda.moore@example.com', '555-678-9012'),
(7, 'Prof. David Taylor', 'david.taylor@example.com', '555-789-0123'),
(8, 'Dr. Lisa Anderson', 'lisa.anderson@example.com', '555-890-1234'),
(9, 'Prof. Robert Lee', 'robert.lee@example.com', '555-901-2345'),
(10, 'Dr. Karen Walker', 'karen.walker@example.com', '555-012-3456'),
(11, 'Prof. Richard Harris', 'richard.harris@example.com', '555-123-4568'),
(12, 'Dr. Susan Clark', 'susan.clark@example.com', '555-234-5679'),
(13, 'Prof. William Lewis', 'william.lewis@example.com', '555-345-6780'),
(14, 'Dr. Patricia Robinson', 'patricia.robinson@example.com', '555-456-7891'),
(15, 'Prof. Charles Martinez', 'charles.martinez@example.com', '555-567-8902');


SELECT * FROM Students;

SELECT * FROM Instructors;

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    Name_ VARCHAR(100) NOT NULL,
    Description_ TEXT NOT NULL,
    InstructorID INT,
    Duration INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID));
    
    INSERT INTO Course (CourseID, Name_, Description_, InstructorID, Duration)
    VALUES
    (1, 'Introduction to Programming', 'A beginner course in programming concepts and Python.', 1, 30),
(2, 'Data Structures and Algorithms', 'An intermediate course covering essential data structures and algorithms.', 2, 40),
(3, 'Database Management Systems', 'A comprehensive course on relational databases, SQL, and database design.', 3, 35),
(4, 'Web Development Fundamentals', 'Learn the basics of web development, HTML, CSS, and JavaScript.', 4, 45),
(5, 'Object-Oriented Programming', 'An advanced course in object-oriented design and programming using Java.', 5, 40),
(6, 'Software Engineering Principles', 'Covering software development methodologies and best practices.', 6, 50),
(7, 'Machine Learning with Python', 'Learn the foundations of machine learning algorithms and models using Python.', 7, 60),
(8, 'Mobile App Development', 'An introduction to developing Android and iOS applications.', 8, 55),
(9, 'Network Security', 'Learn about network vulnerabilities, encryption, and securing communication protocols.', 9, 50),
(10, 'Cloud Computing', 'An overview of cloud platforms, services, and cloud architecture fundamentals.', 10, 45),
(11, 'Artificial Intelligence', 'Explore the basics of AI, neural networks, and deep learning techniques.', 11, 60),
(12, 'Project Management in IT', 'Learn about managing IT projects using agile methodologies and tools.', 12, 30),
(13, 'Ethical Hacking and Cybersecurity', 'Learn ethical hacking techniques and tools to protect against cyber threats.', 13, 40),
(14, 'Big Data Analytics', 'A course focusing on processing large datasets and deriving insights using Big Data tools.', 14, 50),
(15, 'Advanced Web Development', 'Build complex web applications with modern frameworks like React and Node.js.', 15, 45);


SELECT * FROM Course;


CREATE TABLE Enrollment(
EnrollmentID INT PRIMARY KEY,
CourseID INT,
StudentID INT,
EnrollmentDate DATE,
Progress DECIMAL(7, 2),
FOREIGN KEY (CourseID) REFERENCES course(CourseID),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID));


ALTER TABLE Enrollment
DROP COLUMN Progress;


ALTER TABLE Enrollment
ADD Progress DECIMAL(10, 2);


ALTER TABLE Enrollment
DROP COLUMN Progress;

ALTER TABLE Enrollment
ADD Progress DECIMAL(10, 3);





INSERT INTO Enrollment (EnrollmentID, CourseID, StudentID, EnrollmentDate, Progress) 
VALUES
(1, 1, 101, '2024-08-01', 75.12),
(2, 2, 102, '2024-08-05', 80.25),
(3, 3, 103, '2024-09-01', 60.50),
(4, 4, 104, '2024-09-10', 85.00),
(5, 5, 105, '2024-08-15', 90.75),
(6, 6, 106, '2024-07-20', 50.00),
(7, 7, 107, '2024-09-01', 92.34),
(8, 8, 108, '2024-07-22', 65.10),
(9, 9, 109, '2024-08-10', 78.90),
(10, 10, 110, '2024-09-15', 88.50),
(11, 11, 111, '2024-08-30', 100.40),
(12, 12, 112, '2024-09-05', 95.00),
(13, 13, 113, '2024-08-12', 67.75),
(14, 14, 114, '2024-08-25', 81.20),
(15, 15, 115, '2024-07-30', 70.00);


SELECT * FROM Students;


INSERT INTO Enrollment (EnrollmentID, CourseID, StudentID, EnrollmentDate, Progress) 
VALUES
(1, 1, 1, '2024-08-01', 75.12),
(2, 2, 2, '2024-08-05', 80.25),
(3, 3, 3, '2024-09-01', 60.50),
(4, 4, 4, '2024-09-10', 85.00),
(5, 5, 5, '2024-08-15', 90.75),
(6, 6, 6, '2024-07-20', 50.00),
(7, 7, 7, '2024-09-01', 92.34),
(8, 8, 8, '2024-07-22', 65.10),
(9, 9, 9, '2024-08-10', 78.90),
(10, 10, 10, '2024-09-15', 88.50),
(11, 11, 11, '2024-08-30', 100.40),
(12, 12, 12, '2024-09-05', 95.00),
(13, 13, 13, '2024-08-12', 67.75),
(14, 14, 14, '2024-08-25', 81.20),
(15, 15, 15, '2024-07-30', 70.00);

SELECT * FROM Enrollment;

ALTER TABLE Course
ADD COLUMN Category VARCHAR(255);

SELECT * FROM COURSE;


SET SQL_SAFE_UPDATES = 0;


-----Add a column category to the course table to classify courses 
UPDATE Course
SET Category = CASE
WHEN Name_ LIKE '%Programming%' OR Name_ LIKE '%Development%' THEN 'Programming'
WHEN Name_ LIKE '%Data%' OR Name_ LIKE '%AI%' OR Name_ LIKE '%Machine%'  THEN 'Data science'
WHEN Name_ LIKE '%cybersecurity%' OR Name_ LIKE '%Networking%' OR Name_ LIKE '%Blockchain%'  THEN 'IT Security'
ELSE 'Other' END;

SELECT * FROM Course;



ALTER TABLE Course
DROP COLUMN Description_;

SELECT * FROM Course;


-------Update the Progress in the Enrollments table for a student who completed a course

UPDATE Enrollment
SET Progress = 100 
WHERE StudentID = (SELECT StudentID FROM Students WHERE FullName = 'Benjamin Harris');

SELECT * FROM Students WHERE Fullname = 'Benjamin Harris';



------Retrieve all courses in which a specific student is enrolled

SELECT Course.CourseID, Course.Name_, Course.Duration
FROM Course
INNER JOIN Enrollment ON Course.CourseID = Enrollment.CourseID
INNER JOIN Students ON Enrollment.StudentID = Students.StudentID
WHERE Students.FullName = 'David Clark';

-----Delete a student from the Students table.


DELETE FROM Students
WHERE FullName = 'Emily Davis';


DELETE FROM Enrollment
WHERE StudentID = 3;

DELETE FROM Students
WHERE StudentID = 3;




















