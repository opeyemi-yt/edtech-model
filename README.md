Below is a **detailed `README.md`** for the EdTech project, incorporating the requirements and SQL snippets you provided:

---

# EdTech Platform Database Project

**An efficient database system for managing courses, students, and enrollments in an EdTech platform.**

---

## Table of Contents

1. [Project Overview](#project-overview)  
2. [Database Design](#database-design)  
   - [Entities](#entities)  
   - [Schema](#schema)  
3. [Features](#features)  
4. [Setup Instructions](#setup-instructions)  
5. [SQL Operations](#sql-operations)  
   - [Data Definition Language (DDL)](#ddl-operations)  
   - [Data Manipulation Language (DML)](#dml-operations)  
6. [Sample Queries](#sample-queries)  
7. [Contributing](#contributing)  
8. [License](#license)

---

## Project Overview

The **EdTech Platform Database** is designed to efficiently manage the core aspects of an online education platform:
- Courses offered on the platform.
- Student details and their enrollment statuses.
- Tracking enrollment progress and course classifications.

This project includes:
- **SQL scripts** to create the database and tables.  
- Sample data for testing.  
- Examples of common database operations, such as updates, queries, and deletions.

---

## Database Design

### Entities

1. **Courses**:
   - Unique identifier: `CourseID`.
   - Name, Description, Instructor, and Duration (in weeks).
   - Classification using a `Category` column.

2. **Students**:
   - Unique identifier: `StudentID`.
   - Full Name, Email, and Registration Date.

3. **Enrollments**:
   - Tracks the relationship between students and courses.
   - Includes `EnrollmentID`, `CourseID`, `StudentID`, `EnrollmentDate`, and `Progress`.

### Schema

#### Students Table
```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    RegistrationDate DATE NOT NULL
);
```

#### Instructors Table (for completeness)
```sql
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    Instructor_FullName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Instructor_PhoneNum VARCHAR(55)
);
```

#### Courses Table
```sql
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    Name_ VARCHAR(100) NOT NULL,
    Category VARCHAR(255),
    InstructorID INT,
    Duration INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);
```

#### Enrollments Table
```sql
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    CourseID INT,
    StudentID INT,
    EnrollmentDate DATE,
    Progress DECIMAL(10, 3),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
```

---

## Features

- **Student Management**: Add, update, and delete student records.
- **Course Categorization**: Organize courses into categories (e.g., Programming, IT Security).
- **Progress Tracking**: Monitor student progress in each course.
- **Data Relationships**: Enforce relationships between courses, students, and enrollments.

---

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/edtech-platform-database.git
   ```
2. Open the project in your preferred SQL editor (e.g., MySQL Workbench).
3. Execute the `create_database.sql` file to initialize the database.
4. Run the scripts for creating tables and inserting sample data.

---

## SQL Operations

### DDL Operations

1. Add a `Category` column to classify courses:
   ```sql
   ALTER TABLE Course ADD COLUMN Category VARCHAR(255);
   ```

2. Drop the `Description` column from the Courses table:
   ```sql
   ALTER TABLE Course DROP COLUMN Description_;
   ```

### DML Operations

1. Update the progress of a student who completed a course:
   ```sql
   UPDATE Enrollment
   SET Progress = 100
   WHERE StudentID = (SELECT StudentID FROM Students WHERE FullName = 'Benjamin Harris');
   ```

2. Retrieve all courses a specific student is enrolled in:
   ```sql
   SELECT Course.CourseID, Course.Name_, Course.Duration
   FROM Course
   INNER JOIN Enrollment ON Course.CourseID = Enrollment.CourseID
   INNER JOIN Students ON Enrollment.StudentID = Students.StudentID
   WHERE Students.FullName = 'David Clark';
   ```

3. Delete a student and their enrollments:
   ```sql
   DELETE FROM Enrollment WHERE StudentID = 3;
   DELETE FROM Students WHERE StudentID = 3;
   ```

---

## Sample Queries

1. Fetch all students:
   ```sql
   SELECT * FROM Students;
   ```

2. Fetch all courses:
   ```sql
   SELECT * FROM Course;
   ```

3. Fetch all enrollments:
   ```sql
   SELECT * FROM Enrollment;
   ```

---
##  limitation
- Add more data points to make the database more robust in terms of analysis capacity
- For students that are less than 10, let's have a table called parent and attach parent_id to such students details
- Update the primary key columns in each table to include the `UNSIGNED` constraint, preventing the insertion of negative values.
- Stay tuned for part two of this project, which will explore and address additional limitations to further strengthen the database's data integrity.



## Contributing

We welcome contributions! Please:
1. Fork this repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature-branch-name
   ```
3. Commit your changes and submit a pull request.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

This README.md offers clarity on the scope and SQL operations of your EdTech database. Feel free to edit further based on additional project specifics.
