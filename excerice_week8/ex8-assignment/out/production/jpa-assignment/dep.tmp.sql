CREATE TABLE department (dept_name varchar(20), building varchar(15), budget
 numeric(12,2) check (budget > 0), primary key (dept_name) );