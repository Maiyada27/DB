CREATE DATABASE HospitalDB;

-- Department
CREATE TABLE Department (
    Dept_id CHAR(5) PRIMARY KEY,
    Dept_name VARCHAR(50),
    head_dr_id CHAR(5)
);

-- Doctor
CREATE TABLE Doctor (
    Dr_id CHAR(5) PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(50),
    Dept_id CHAR(5),
    FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

-- Patient
CREATE TABLE Patient (
    Pat_id CHAR(5) PRIMARY KEY,
    name VARCHAR(50),
    dob DATE,
    blood_group VARCHAR(5),
    gender CHAR(1),
    contact_info VARCHAR(50)
);

-- Appointment
CREATE TABLE Appointment (
    App_id CHAR(6) PRIMARY KEY,
    Pat_id CHAR(5),
    Dr_id CHAR(5),
    Date DATE,
    Time TIME,
    Status VARCHAR(20),
    FOREIGN KEY (Pat_id) REFERENCES Patient(Pat_id),
    FOREIGN KEY (Dr_id) REFERENCES Doctor(Dr_id)
);

-- Medical Record 
CREATE TABLE MedicalRecord (
    Record_id CHAR(6) PRIMARY KEY,
    diagnosis VARCHAR(100),
    treatment VARCHAR(100),
    App_id CHAR(6) UNIQUE,
    FOREIGN KEY (App_id) REFERENCES Appointment(App_id)
);

-- Billing 
CREATE TABLE Billing (
    Bill_id CHAR(6) PRIMARY KEY,
    Payment_status VARCHAR(20),
    App_id CHAR(6) UNIQUE,
    FOREIGN KEY (App_id) REFERENCES Appointment(App_id)
);

-- Service
CREATE TABLE Service (
    Service_id CHAR(5) PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(30),
    price DECIMAL(10,2)
);

-- App_Services 
CREATE TABLE App_Services (
    App_id CHAR(6),
    Service_id CHAR(5),
    PRIMARY KEY (App_id, Service_id),
    FOREIGN KEY (App_id) REFERENCES Appointment(App_id),
    FOREIGN KEY (Service_id) REFERENCES Service(Service_id)
);
