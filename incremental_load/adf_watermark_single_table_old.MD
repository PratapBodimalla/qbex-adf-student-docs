# ADF Incremental load using watermark (single table)

# Step 1: Set up source data

```SQL
create table data_source_table
(
    PersonID int,
    Name varchar(255),
    LastModifytime datetime
);

INSERT INTO data_source_table
(PersonID, Name, LastModifytime)
VALUES
(1, 'aaaa','9/1/2017 12:56:00 AM'),
(2, 'bbbb','9/2/2017 5:23:00 AM'),
(3, 'cccc','9/3/2017 2:36:00 AM'),
(4, 'dddd','9/4/2017 3:21:00 AM'),
(5, 'eeee','9/5/2017 8:06:00 AM');
```


# Step 2: Create watermark table

```SQL
create table watermarktable
(

TableName varchar(255),
WatermarkValue datetime,
);
```

# Step 3: Insert Initial Table into watermark table

```SQL
INSERT INTO watermarktable
VALUES ('data_source_table','1/1/2010 12:00:00 AM');

Select * from watermarktable;
```

# Step 4: Create stored procedure to update watermark table

```SQL
CREATE PROCEDURE usp_write_watermark @LastModifiedtime datetime, @TableName varchar(50)
AS

BEGIN

UPDATE watermarktable
SET [WatermarkValue] = @LastModifiedtime
WHERE [TableName] = @TableName

END

```

# Step 5: Build Pipeline with Lookup - Read - Update watermark


# Step 6: Validate / check watermark and update tables

```SQL
Select * from watermarktable;

INSERT INTO data_source_table
(PersonID, Name, LastModifytime)
VALUES
(6, 'aaaa',GETDATE());

update  data_source_table
set LastModifytime = GETDATE(),
Name = 'Pratap'
where PersonID = 1;

delete from data_source_table where  PersonID = 5;

select * from data_source_table;
```