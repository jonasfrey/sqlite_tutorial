# howto
## start sqlite3 binary 
```
sqlite3
```

## "use database ...", open or reopen database 

```sql
.open university.db
```
or
```sql
sqlite3 university.db
```

## show available shemas / tables 
```sql
.tables
```

## select table / show table content /entries /rows /data
```sql 
select * from course
```

## show beautified / formatted data 
```sql
sqlite> .headers on -- for output with column names
sqlite> .mode column -- for padded output
sqlite> select * from meetings 
```

## wtf , why this `...>`, your command is not terminated, just enter a semicolon ';' and press enter to terminate it 
```sql 
select * from table
```

## clear the screen 
```sql 
.shell clear 
```

## show the schema / tables structure / model 
```
.schema tablename
```