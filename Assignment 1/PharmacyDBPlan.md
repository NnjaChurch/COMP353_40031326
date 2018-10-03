COMP 353 Assignment 1 - Pharmacy Database Plan

TABLES:
---------------------------------------------------------------------
|	ATTRIBUTE 		|	TYPE		|	KEY TYPE			|	NECESSITY	|
---------------------------------------------------------------------
Patients(
	SIN				INT				PRIMARY KEY				NOT NULL
	first_name		VARCHAR(20)								NOT NULL
	last_name		VARCHAR(20)								NOT NULL
	address			VARCHAR(50)								NOT NULL
	age				INT										NOT NULL
	primary_doctor	INT				FOREIGN KEY (Doctors)	NOT NULL
);

Doctors(
	SIN				INT				PRIMARY KEY				NOT NULL
	first_name		VARCHAR(20)								NOT NULL
	last_name		VARCHAR(20)								NOT NULL
	specialty		VARCHAR(50)								NOT NULL
	experience		INT										NOT NULL
);

Company(
	company			VARCHAR(50)		PRIMARY KEY				NOT NULL
	phone			INT										NOT NULL
);

Drug(
	trade_name		VARCHAR(50)		PRIMARY KEY				NOT NULL
	formula			VARCHAR(100)							NOT NULL
	company			VARCHAR(50)		FOREIGN KEY (Company)	NOT NULL
);

Pharmacy(
	name			VARCHAR(50)		PRIMARY KEY				NOT NULL
	address			VARCHAR(50)								NOT NULL
	phone			INT										NOT NULL
);

Inventory(
);

Prescription(
	drug			VARCHAR(50)		PRIMARY KEY				NOT NULL
	patient_SIN		INT				FOREIGN KEY (Patient)	NOT NULL
	doctor_SIN		INT				FOREIGN KEY (Doctor)	NOT NULL
	date			DATE									NOT NULL
	quantity		INT										NOT NULL
);

RELATIONS:

- 	Every Patient must have one primary_doctor, but every Doctor can have
	mutltiple Patients. (Relation is M-1 between Patient and Doctor)
-	Every Drug is related to a Company, if the Company no longer exists,
	then every drug related to that company must be removed. (Relation is
	M-1 between Drug and Company)
-	Each Pharmacy can sell multiple Drugs, and has a price for each. The
	price for each Drug can be different per Pharmacy. (Relation is M-M
	between Pharmacy and Drugs)
-	