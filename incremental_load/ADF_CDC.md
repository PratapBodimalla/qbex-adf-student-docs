# ADF CDC (Change Data Capture)

## Step 1: Create Source Table

```SQL
CREATE TABLE Student_Source (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100),
    Age INT,
    Email VARCHAR(255)
);
```

## Step 2: Create Target Table

```SQL
CREATE TABLE Student_Target (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    City VARCHAR(100),
    Country VARCHAR(100),
    Age INT,
    Email VARCHAR(255)
);
```

## Step 3: Insert Data into Source Table

```SQL
INSERT INTO Student_Source (StudentID, StudentName, City, Country, Age, Email)
VALUES
(1, 'Amit Sharma', 'Delhi', 'India', 21, 'amit.sharma@example.com'),
(2, 'Priya Nair', 'Mumbai', 'India', 22, 'priya.nair@example.com'),
(3, 'Rahul Verma', 'Chennai', 'India', 20, 'rahul.verma@example.com'),
(4, 'Sneha Patil', 'Bangalore', 'India', 23, 'sneha.patil@example.com'),
(5, 'Vikas Gupta', 'Kolkata', 'India', 21, 'vikas.gupta@example.com');
```


## Step 4: Check Data in Source Table

```SQL
select * from Student_Source;
```

## Step 5: Check Data in Target Table

```SQL
select * from Student_Target;
```

## Step 6: Check if CDC is enabled on Database - 'Qbex'

```SQL
select name,is_cdc_enabled from sys.databases;
```


## Step 7: Enable CDC on Database - 'Qbex'

```SQL
EXEC sys.sp_cdc_enable_db
GO
```

## Step 8: Check if CDC is enabled on Database - 'Qbex'

```SQL
select name,is_cdc_enabled from sys.databases;
```

## Step 9: Check if CDC is enabled on Database Table - 'Student_Source'

```SQL
select name,is_tracked_by_cdc from sys.tables;
```

## Step 10: Enable CDC is on Database Table - 'Student_Source'

```SQL
EXEC sys.sp_cdc_enable_table
@source_schema = 'dbo',
@source_name = 'Student_Source',
@role_name = NULL,
@supports_net_changes = 1
```

## Step 11: Check if CDC is enabled on Database Table - 'Student_Source'

```SQL
select name,is_tracked_by_cdc from sys.tables;
```


## Step 12: Create CDC resource in ADF

