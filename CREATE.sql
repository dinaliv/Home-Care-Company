CREATE DATABASE test;
USE test;
CREATE TABLE Client(
	clientID INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dataOfBirth DATE NOT NULL,
    phoneNumber CHAR(10) NOT NULL,
    postalCode CHAR(6) NOT NULL,
    city VARCHAR(20),
    street VARCHAR(100),
    clientType ENUM('Senior', 'Disabled') NOT NULL,
    PRIMARY KEY(clientID)
    
);
CREATE TABLE Illness (
    illnessID INT AUTO_INCREMENT ,
    clientID INT,
    illness VARCHAR(100)NOT NULL,
    PRIMARY KEY(illnessID),
    FOREIGN KEY(clientID) REFERENCES Client(clientID)
);

CREATE TABLE Medication(
	prescriptionNO  INT AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    dosage VARCHAR(10) ,
    frequency VARCHAR(100),
    illnessID INT,
    PRIMARY KEY(prescriptionNO),
    FOREIGN KEY (illnessID) REFERENCES Illness(illnessID)
);

CREATE TABLE Billing (
	billingID INT AUTO_INCREMENT,
	clientID INT,
	billingDate DATE NOT NULL,
    amount INT NOT NULL,
    status VARCHAR(30) NOT NULL,
    PRIMARY KEY(billingID)
    );
CREATE TABLE Emergency(
	emergencyID INT AUTO_INCREMENT,
    clientID INT,
	name VARCHAR(100) NOT NULL,
    phone CHAR(10) NOT NULL,
    relationship VARCHAR(50) NOT NULL,
    PRIMARY KEY(emergencyID),
    FOREIGN KEY(clientID) REFERENCES Client(clientID) 
    );
    
CREATE TABLE Nurse(
	licenseNO INT,
    nurseID INT UNIQUE,
    name VARCHAR(50) NOT NULL,
    dateOfBirth DATE NOT NULL,
    phoneNO VARCHAR(10) NOT NULL,
    PRIMARY KEY(licenseNO)
    );
CREATE TABLE Report(
	reportID INT AUTO_INCREMENT,
    nurseID INT,
    clientID INT ,
    healthCondition VARCHAR(200) NOT NULL,
    startService DATETIME,
    endService DATETIME,
    serviceProvided VARCHAR(200),
    date DATE,
    PRIMARY KEY(reportID),
    FOREIGN KEY(nurseID) REFERENCES Nurse(nurseID),
    FOREIGN KEY(clientID) REFERENCES Client(clientID)
    
);    
CREATE TABLE Contract(
	contractID INT AUTO_INCREMENT,
    clientID INT,
    startDate DATETIME,
    endDate DATETIME,
    PRIMARY KEY(contractID),
    foreign key (clientID) REFERENCES Client(clientID)
    );
    
CREATE TABLE Substitute(
    nurseID INT,
    substituteNurseID INT,
    startDate DATE,
    endDate DATE,
    PRIMARY KEY(nurseID, substituteNurseID),
    FOREIGN KEY(nurseID) REFERENCES Nurse(nurseID),
    FOREIGN KEY(substituteNurseID) REFERENCES Nurse(nurseID)
);

    


	


    
