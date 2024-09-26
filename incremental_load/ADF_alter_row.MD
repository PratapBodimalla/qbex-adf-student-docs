```SQL
CREATE TABLE Student_Source_dflow (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100),
    Age INT,
    Email VARCHAR(255)
);

INSERT INTO Student_Source_dflow (StudentID, StudentName, City, Country, Age, Email)
VALUES
(1, 'Amit Sharma', 'Delhi', 'India', 21, 'amit.sharma@example.com'),
(2, 'Priya Nair', 'Mumbai', 'India', 22, 'priya.nair@example.com'),
(3, 'Rahul Verma', 'Chennai', 'India', 20, 'rahul.verma@example.com'),
(4, 'Sneha Patil', 'Bangalore', 'India', 23, 'sneha.patil@example.com'),
(5, 'Vikas Gupta', 'Kolkata', 'India', 21, 'vikas.gupta@example.com');


CREATE TABLE Student_Target_dflow (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100),
    Age INT,
    Email VARCHAR(255)
);


select * from Student_Target_dflow;


INSERT INTO Student_Source_dflow (StudentID, StudentName, City, Country, Age, Email)
VALUES
(6, 'Amit Sharma', 'Delhi', 'India', 21, 'amit.sharma@example.com');

delete from Student_Source_dflow where StudentID = 1;

```