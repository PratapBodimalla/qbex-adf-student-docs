# ADF Auto Incremental Extraction

# Step 1: Create Table "Student_logs"

```SQL
CREATE TABLE Student_logs (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100),
    Age INT,
    Email VARCHAR(255),
    Created_Timestamp DATETIME DEFAULT GETDATE(),
    Update_Timestamp DATETIME DEFAULT GETDATE()
);

```

# Step 2: Insert some historical data

```SQL
INSERT INTO Student_logs (StudentID, StudentName, City, Country, Age, Email, Created_Timestamp, Update_Timestamp)
VALUES
(1, 'Amit Sharma', 'Delhi', 'India', 21, 'amit.sharma@example.com', '2023-05-15 10:30:00', '2024-09-17 15:45:00'),
(2, 'Priya Nair', 'Mumbai', 'India', 22, 'priya.nair@example.com', '2023-06-20 14:20:00', '2024-09-17 15:45:00'),
(3, 'Rahul Verma', 'Chennai', 'India', 20, 'rahul.verma@example.com', '2023-07-10 09:50:00', '2024-09-17 15:45:00'),
(4, 'Sneha Patil', 'Bangalore', 'India', 23, 'sneha.patil@example.com', '2023-04-12 11:15:00', '2024-09-17 15:45:00'),
(5, 'Vikas Gupta', 'Kolkata', 'India', 21, 'vikas.gupta@example.com', '2023-08-01 08:25:00', '2024-09-17 15:45:00');
```

# Step 3: Build the Data Flow with Incremental Column


# Step 4: trigger the initial load

# Step 5: Update the source table

```SQL

-- Update Record
update Student_logs
set StudentName = 'Pratap Singh'
where StudentID = 1;

-- Delete Record
delete from  Student_logs where StudentID = 5;

-- Insert Record
INSERT INTO Student_logs (StudentID, StudentName, City, Country, Age, Email)
VALUES
(7, 'Amit Sharma', 'Delhi', 'India', 21, 'amit.sharma@example.com');

-- Check Changes
select * from Student_logs
```

# Step 6: Observe the Check Point

# Step 7: Trigger Delta Load