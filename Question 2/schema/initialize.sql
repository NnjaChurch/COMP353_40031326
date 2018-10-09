DROP DATABASE department_db_40031326;

CREATE DATABASE department_db_40031326;
USE department_db_40031326;

CREATE TABLE employee(
	eid INT PRIMARY KEY,
	ename VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	salary DOUBLE NOT NULL
);

CREATE TABLE department(
	did INT PRIMARY KEY,
	budget DOUBLE NOT NULL,
	manager_id INT NOT NULL,
	FOREIGN KEY (manager_id) REFERENCES employee(eid)
);

CREATE TABLE works(
	eid INT NOT NULL,
	FOREIGN KEY (eid) REFERENCES employee(eid),
	did INT NOT NULL,
	FOREIGN KEY (did) REFERENCES department(did),
	PRIMARY KEY (eid, did),
	hours_per_week INT NOT NULL
);
