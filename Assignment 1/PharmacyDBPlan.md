COMP 353 Assignment 1 - Pharmacy Database Plan

TABLES:
-----------------------------------------------------------------------------
|	ATTRIBUTE 		|	TYPE		|	KEY TYPE			|	NECESSITY	|
-----------------------------------------------------------------------------
Patient(
	SIN				INT				PRIMARY KEY				NOT NULL
	patient_name	VARCHAR(50)								NOT NULL
	address			VARCHAR(50)								NOT NULL
	age				INT										NOT NULL
	primary_doctor	INT				FOREIGN KEY (Doctors)	NOT NULL
);

Doctor(
	SIN				INT				PRIMARY KEY				NOT NULL
	doctor_name		VARCHAR(20)								NOT NULL
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
	patient_name	VARCHAR(50)		FOREIGN KEY (Patient)	NOT NULL
	doctor_name		VARCHAR(50)		FOREIGN KEY (Doctor)	NOT NULL
	date			DATE									NOT NULL
	quantity		INT										NOT NULL
);

Contract(
	pharmacy_name	VARCHAR(50)		FOREIGN KEY (Pharmacy)	NOT NULL
	company_name	VARCHAR(50)		FOREIGN KEY (Company)	NOT NULL
	(pharmacy_name, company_name)	PRIMARY KEY
	start_date		DATE									NOT NULL
	end_date		DATE									NOT NULL
	text			VARCHAR(500)							NOT NULL
	supervisor		VARCHAR(50)								NOT NULL
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
-	Doctors can perscribe one or more Drugs for several Patients, and a
	Patient can obtain Perscriptions from several Doctors. (Relation is
	1-M between Doctor and Perscription and M-1 between Perscription and
	Patient. In this case Perscription is the intermediary between Patient
	and Doctor)
-	Each Drug can only be perscribed once per patient, so if mutiple
	Perscriptions exist for a Patient, only the most recent is recorded.
-	A Complany can Contract with several Pharmacies, and a Pharmacy can
	Contract with several Companies. (Relation is 1-M between Company and
	Contract, and M-1 between Contact and Pharmacy. In this case Contract is
	the intermediary between Company and Contract)
-	Pharmacies appoint a Supervisor for each Contract, and each Contract must
	have a Supervisor, but the Supervisor can change.