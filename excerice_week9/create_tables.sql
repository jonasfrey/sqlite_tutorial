
CREATE TABLE employee (
	ss_num INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	address TEXT NOT NULL,
);

CREATE TABLE car (
	license INTEGER PRIMARY KEY,
	model TEXT NOT NULL,
);

CREATE TABLE sold (
	employee_ss_num INTEGER NOT NULL,
	car_license INTEGER NOT NULL,
	price FLOAT NOT NULL,
	date DATE NOT NULL,
    FOREIGN KEY (car_license)
       REFERENCES car (car_license)
    FOREIGN KEY (employee_ss_num)
       REFERENCES employee (employee_ss_num) 
);

CREATE TABLE repair_job (
	id INTEGER PRIMARY KEY,
	description TEXT NOT NULL,
);

CREATE TABLE repairs (
	car_license INTEGER NOT NULL,
	repair_job_id INTEGER NOT NULL,
    FOREIGN KEY (car_license)
       REFERENCES car (car_license)
    FOREIGN KEY (repair_job_id)
       REFERENCES repair_job (repair_job_id)
);

CREATE TABLE does (
	employee_ss_num INTEGER NOT NULL,
	repair_job_id INTEGER NOT NULL,
    FOREIGN KEY (employee_ss_num)
       REFERENCES employee (employee_ss_num) 
    FOREIGN KEY (repair_job_id)
       REFERENCES repair_job (repair_job_id)
);

CREATE TABLE replaces (
	employee_ss_num INTEGER NOT NULL,
    FOREIGN KEY (employee_ss_num)
       REFERENCES employee (employee_ss_num) 
);