### Tumbling Window Script

```SQL


CREATE TABLE SourceSalesData (
    SalesOrder VARCHAR(10),
    CreatedDate DATE,
    Customer VARCHAR(10),
    Amount INT
);

INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S001', '2013-01-01', 'C1', 100);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S002', '2013-01-11', 'C2', 200);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S003', '2014-01-01', 'C3', 300);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S004', '2014-01-11', 'C4', 400);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S005', '2015-01-01', 'C5', 500);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S006', '2015-01-11', 'C6', 600);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S007', '2016-01-01', 'C7', 700);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S008', '2016-01-11', 'C8', 800);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S009', '2017-01-01', 'C9', 900);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S010', '2017-01-11', 'C10', 1000);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S011', '2018-01-01', 'C11', 1100);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S012', '2018-01-11', 'C12', 1200);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S013', '2019-01-01', 'C13', 1300);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S014', '2019-01-11', 'C14', 1400);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S015', '2020-01-01', 'C15', 1500);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S016', '2020-01-11', 'C16', 1600);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S017', '2021-01-01', 'C17', 1700);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S018', '2021-01-11', 'C18', 1800);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S019', '2022-01-01', 'C19', 1900);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S020', '2022-01-11', 'C20', 2000);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S021', '2023-01-01', 'C21', 2100);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S022', '2023-01-11', 'C22', 2200);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S023', '2024-01-01', 'C23', 2300);
INSERT INTO SourceSalesData (SalesOrder, CreatedDate, Customer, Amount) VALUES ('S024', '2024-01-11', 'C24', 2400);


SELECT * 
FROM SourceSalesData
WHERE CreatedDate <= CONVERT(DATE, '2013-01-01', 23);

```

```scala
@trigger().outputs.windowStartTime
@trigger().outputs.windowEndTime
@trigger().scheduledTime
@trigger().startTime
```


```sql
Dynamic query
@concat('SELECT * 
FROM SourceSalesData
WHERE CreatedDate >= CONVERT(DATE, ''',formatDateTime(pipeline().parameters.p_window_start_time,'yyyy-MM-dd'),''', 23)',
'and CreatedDate < CONVERT(DATE, ''',formatDateTime(pipeline().parameters.p_window_end_time,'yyyy-MM-dd'),''', 23)')
```


```python

2013-01-01T11:05:00Z
```