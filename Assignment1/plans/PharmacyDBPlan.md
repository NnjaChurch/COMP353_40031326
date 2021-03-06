COMP 353 Assignment 1 - Pharmacy Database Plan

TABLES:
-----------------------------------------------------------------------------
|	ATTRIBUTE 		|	TYPE		|	KEY TYPE			|	NECESSITY	|
-----------------------------------------------------------------------------
Patient(
	sin_number		INT										NOT NULL
	patient_name	VARCHAR(50)		PRIMARY KEY				NOT NULL
	address			VARCHAR(50)								NOT NULL
	age				INT										NOT NULL
	primary_doctor	VARCHAR(50)		FOREIGN KEY (Doctors)	NOT NULL
);

Doctor(
	sin_number		INT										NOT NULL
	doctor_name		VARCHAR(50)		PRIMARY KEY				NOT NULL
	specialty		VARCHAR(50)								NOT NULL
	experience		INT										NOT NULL
);

Company(
	company_name	VARCHAR(50)		PRIMARY KEY				NOT NULL
	phone_number	VARCHAR(20)								NOT NULL
);

Drug(
	trade_name		VARCHAR(50)		PRIMARY KEY				NOT NULL
	formula			VARCHAR(100)							NOT NULL
	company_name	VARCHAR(50)		FOREIGN KEY (Company)	NOT NULL
);

Pharmacy(
	pharmacy_name	VARCHAR(50)		PRIMARY KEY				NOT NULL
	address			VARCHAR(50)								NOT NULL
	phone_number	VARCHAR(20)								NOT NULL
);

Product(
	drug			VARCHAR(50)		PRIMARY KEY				NOT NULL
	sold_at			VARCHAR(50)		FOREIGN KEY (Pharmacy)	NOT NULL
	company_name	VARCHAR(50)		FOREIGN KEY (Company)	NOT NULL
	price			DOUBLE									NOT NULL
);

Prescription(
	drug			VARCHAR(50)		FOREIGN KEY (Drug)		NOT NULL
	patient_name	VARCHAR(50)		FOREIGN KEY (Patient)	NOT NULL
	doctor_name		VARCHAR(50)		FOREIGN KEY (Doctor)	NOT NULL
	(drug, patient_name, doctor_name) PRIMARY KEY
	given_date		DATE									NOT NULL
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

RELATIONS AND CONSTRAINTS:

- 	Every Patient can visit multiple doctors, and every Doctor can have
	mutltiple Patients. (Relation is M-M between Patient and Doctor)
-	Every Drug is related to a Company, if the Company no longer exists,
	then every drug related to that company must be removed. (Relation is
	M-1 between Drug and Company)
-	Each Pharmacy can sell multiple Products, and has a price for each. The
	price for each Product can be different per Pharmacy. Each Product consists
	of one Drug at a certain price. (Relation is 1-M between Drug and Product,
	and 1-M between Pharmacy and Product. In this case Product is the intermediary
	between Drug and Pharmacy)
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