DROP DATABASE pharmacy_db_40031326;

CREATE DATABASE pharmacy_db_40031326;
USE pharmacy_db_40031326;


CREATE TABLE doctor(
	sin_number INT NOT NULL,
	doctor_name VARCHAR(50) PRIMARY KEY,
	specialty VARCHAR(50) NOT NULL,
	experience INT NOT NULL
);

CREATE TABLE patient(
	sin_number INT NOT NULL,
	patient_name VARCHAR(50) PRIMARY KEY,
	address VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	primary_doctor VARCHAR(50) NOT NULL,
	FOREIGN KEY (primary_doctor) REFERENCES doctor(doctor_name)
);


CREATE TABLE company(
	company_name VARCHAR(50) PRIMARY KEY,
	phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE drug(
	trade_name VARCHAR(50) PRIMARY KEY,
	formula VARCHAR(100) NOT NULL,
	company_name VARCHAR(50) NOT NULL,
	FOREIGN KEY (company_name) REFERENCES company(company_name)
);

CREATE TABLE pharmacy(
	pharmacy_name VARCHAR(50) PRIMARY KEY,
	address VARCHAR(50) NOT NULL,
	phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE product(
	drug VARCHAR(50) PRIMARY KEY,
	sold_at VARCHAR(50) NOT NULL,
	FOREIGN KEY (sold_at) REFERENCES pharmacy(pharmacy_name),
	company_name VARCHAR(50) NOT NULL,
	FOREIGN KEY (company_name) REFERENCES company(company_name),
	price DOUBLE NOT NULL
);

CREATE TABLE perscription(
	drug VARCHAR(50) NOT NULL,
	FOREIGN KEY (drug) REFERENCES drug(trade_name),
	patient_name VARCHAR(50) NOT NULL,
	FOREIGN KEY (patient_name) REFERENCES patient(patient_name),
	doctor_name VARCHAR(50) NOT NULL,
	FOREIGN KEY (doctor_name) REFERENCES doctor(doctor_name),
	PRIMARY KEY (drug, patient_name, doctor_name),
	given_date DATE NOT NULL,
	quantity INT NOT NULL
);

CREATE TABLE contract(
	pharmacy_name VARCHAR(50) NOT NULL,
	FOREIGN KEY (pharmacy_name) REFERENCES pharmacy(pharmacy_name),
	company_name VARCHAR(50) NOT NULL,
	FOREIGN KEY (company_name) REFERENCES company(company_name),
	PRIMARY KEY(pharmacy_name, company_name),
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	text VARCHAR(500) NOT NULL,
	supervisor VARCHAR(50) NOT NULL
);
	
	
