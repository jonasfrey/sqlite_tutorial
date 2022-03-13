

# install 
```
sudo apt install sqlite3
```

# enter db 
```
sqlite3 test_db
```
# quit / exit db 
```sqlite
ctrl+d 
```

# create table 
```sqlite
create table names (
    n_id primary key,
    name varchar(32)
)
```

# show tables 
```sql
--  note , we dont need a semicolon to finish this command';' 
.tables
```

# sqlite comment 
```sql
# hashtag at start of line or 
-- double dash 
```
# double dash yey! 
![https://i.makeagif.com/media/6-04-2015/sAXJCA.gif](https://i.makeagif.com/media/6-04-2015/sAXJCA.gif)



# show values / show table content 
```sql
sqlite> .headers on -- for output with column names
sqlite> .mode column -- for padded output
sqlite> select * from meetings
```
output
```
n_id  s_name         s_location            
----  -------------  ----------------------
1     Grafted Scion  Chapel of Anticipation
2     Margit         Stormhill
```

# main differences mysql and sqlite 

|.NO.|MySQL|SQLite|
|---|---|---|
|1.|Developed by Oracle on May 1995.|Developed By D. Richard Hipp on August 2000.|
|2.|MySQL is developed in C and C++ languages.|SQLite is developed only in C language.|
|3.|MySQL requires a database server for its functioning. Hence, it follows client/server| architecture.|SQLite does not require a server to run. Hence, it is serverless.
|4.|It can handle multiple connections simultaneously.|It can handle only one connection at a| time.
|5.|It is highly scalable and can handle a large volume of data very efficiently.|It can handle| only small set of data if the volume of data increased its performance degrades.
|6.|It requires large space in the memory for its functioning (approx 600 Mb).|It requires only| some KBs of space as it is very lightweight approx (250Kb-300Kb).
|7.|MySQL supports multiple user environment.|SQLite does not support multiple user environment.|
|8.|It also supports XML format.|It does not supports XML format.|


# online sql editor / fiddle / playground / try / practice / 
https://www.w3schools.com/sql/trysql.asp?filename=trysql_asc