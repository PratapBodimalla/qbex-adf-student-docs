# Incremental Load using Watermark

### Table 1:
```sql
drop table if exists StudentMarks_id_d1;

CREATE TABLE StudentMarks_id_d1 (
    student_id INT,
    student_name VARCHAR(255),
    student_marks FLOAT,
    class INT,
    school VARCHAR(255)
);

insert into StudentMarks_id_d1
values (1001,'a',10,8,'gadium'),
(1002,'b',20,8,'gadium');

```


### Table 2:
```sql
drop table if exists StudentMarks_date_d1;
CREATE TABLE StudentMarks_date_d1 (
    student_id INT,
    student_name VARCHAR(255),
    student_marks FLOAT,
    class INT,
    school VARCHAR(255),
	CreatedDate DATE DEFAULT CAST(GETDATE() AS DATE),
	ModifiedDate DATE DEFAULT CAST(GETDATE() AS DATE)
);


insert into StudentMarks_date_d1
values (1001,'a',10,8,'gadium','2024-11-01', '2024-11-01'),
(1002,'b',20,8,'gadium','2024-11-01', '2024-11-01');

```


### Table 3:
```sql
drop table if exists StudentMarks_timestamp_d1;
CREATE TABLE StudentMarks_timestamp_d1 (
    student_id INT,
    student_name VARCHAR(255),
    student_marks FLOAT,
    class INT,
    school VARCHAR(255),
	created_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);


insert into StudentMarks_timestamp_d1
values (1001,'a',10,8,'gadium','2024-11-01 08:00:00', '2024-11-01 08:00:00'),
(1002,'b',20,8,'gadium','2024-11-01 14:00:00', '2024-11-01 14:00:00');

```
### check the data in all 3 tables:

```sql
select * from StudentMarks_id_d1;

select * from StudentMarks_date_d1;

select * from StudentMarks_timestamp_d1;
```
### Table 4: **Watermark Table**:
```sql
drop table water_mark_d1;

create table water_mark_d1
(
table_name varchar(255),
incremental_column varchar(255),
delta_value varchar(255),
delta_value_type varchar(50),
previous_delta_value varchar(255),
is_active integer,
safety_lower_limit integer
);

delete from  water_mark_d1;



insert into water_mark_d1 values
('StudentMarks_id_d1','student_id','0','INTEGER','0',1,0),
('StudentMarks_date_d1','ModifiedDate','0','DATE','2000-01-01',1,0),
('StudentMarks_timestamp_d1','modified_timestamp','0','DATETIME','2000-01-01 00:00:00',1,0);

```

### Create a procedure which updates the delta values

```sql
drop PROCEDURE UpdateWaterMarkAllTables;

CREATE PROCEDURE UpdateWaterMarkAllTables
AS
BEGIN
    -- Declare the variables needed
    DECLARE @TableName NVARCHAR(255);
    DECLARE @IDColumn NVARCHAR(255);
    DECLARE @Sql NVARCHAR(MAX);

    -- Declare the cursor
    DECLARE cur CURSOR FOR
    SELECT table_name, incremental_column
    FROM water_mark_d1
    WHERE is_active = 1;

    -- Open the cursor
    OPEN cur;

    -- Fetch the first row into the variables
    FETCH NEXT FROM cur INTO @TableName, @IDColumn;

    -- Loop through the rows
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Build the dynamic SQL for the UPDATE statement
        SET @Sql = N'UPDATE water_mark_d1
                     SET delta_value = CONVERT(VARCHAR, (SELECT MAX(' + @IDColumn + N') FROM ' + @TableName + N'), 120),
					     previous_delta_value = case when delta_value_type <> ''INTEGER'' AND delta_value = ''0'' then previous_delta_value else delta_value end
                     WHERE table_name = ''' + @TableName + N'''';

        -- Execute the dynamic SQL
        EXEC sp_executesql @Sql;

        -- Fetch the next row
        FETCH NEXT FROM cur INTO @TableName, @IDColumn;
    END;

    -- Close and deallocate the cursor
    CLOSE cur;
    DEALLOCATE cur;
END;
GO


exec UpdateWaterMarkAllTables;
```

### Build the pipeline 

### for delta records

```sql
insert into StudentMarks_id_d1
values (1003,'c',10,8,'gadium'),
(1004,'d',20,8,'gadium');

insert into StudentMarks_date_d1 (student_id, student_name, student_marks, class, school)
values (1003,'a',10,8,'gadium'),
(1004,'b',20,8,'gadium');

update StudentMarks_date_d1
set student_name = 'aa',
ModifiedDate = CAST(GETDATE() AS DATE)
where student_id = 1001;


insert into StudentMarks_timestamp_d1 (student_id, student_name, student_marks, class, school)
values (1003,'a',10,8,'gadium'),
(1004,'b',20,8,'gadium');

update StudentMarks_timestamp_d1
set student_name = 'bb',
modified_timestamp = CURRENT_TIMESTAMP
where student_id = 1002;

select * from StudentMarks_id_d1;

select * from StudentMarks_date_d1;

select * from StudentMarks_timestamp_d1;

```

### Copy function dynamic sql

```sql
@concat('select * from ',item().table_name, ' where ', item().incremental_column , ' > ''', item().previous_delta_value , ''' and ', item().incremental_column , ' <= ''', item().delta_value,'''')
```

### Hierarchy folder structure
```
@{formatDateTime(utcNow(),'yyyy')} / @{formatDateTime(utcNow(),'MM')}/@{formatDateTime(utcNow(),'dd')}
```