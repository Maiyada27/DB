CREATE DATABASE Airline;

-- Airport
CREATE TABLE Airport (
    airport_code CHAR(5) PRIMARY KEY,
    city VARCHAR(30),
    state VARCHAR(30),
    name VARCHAR(50)
);

-- Airplane Type
CREATE TABLE AirplaneType (
    TypeName VARCHAR(30) PRIMARY KEY,
    company VARCHAR(50),
    max_seats INT
);

-- Airplane
CREATE TABLE Airplane (
    airplane_id CHAR(10) PRIMARY KEY,
    total_seats INT,
    TypeName VARCHAR(30),
    FOREIGN KEY (TypeName) REFERENCES AirplaneType(TypeName)
);

-- Flight
CREATE TABLE Flight (
    flight_id CHAR(10) PRIMARY KEY,
    airline VARCHAR(50),
    weekdays VARCHAR(20),
    restriction VARCHAR(100)
);

-- Fare
CREATE TABLE Fare (
    flight_id CHAR(10),
    amount DECIMAL(10,2),
    PRIMARY KEY (flight_id),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);

-- Flight Leg
CREATE TABLE FlightLeg (
    flight_id CHAR(10),
    leg_no INT,
    dep_airport CHAR(5),
    arr_airport CHAR(5),
    scheduled_dep_time TIME,
    scheduled_arr_time TIME,
    PRIMARY KEY (flight_id, leg_no),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id),
    FOREIGN KEY (dep_airport) REFERENCES Airport(airport_code),
    FOREIGN KEY (arr_airport) REFERENCES Airport(airport_code)
);

-- Leg Instance
CREATE TABLE LegInstance (
    flight_id CHAR(10),
    leg_no INT,
    date DATE,
    dep_time TIME,
    arr_time TIME,
    available_seats INT,
    airplane_id CHAR(10),
    PRIMARY KEY (flight_id, leg_no, date),
    FOREIGN KEY (flight_id, leg_no) REFERENCES FlightLeg(flight_id, leg_no),
    FOREIGN KEY (airplane_id) REFERENCES Airplane(airplane_id)
);

-- Customer
CREATE TABLE Customer (
    customer_id CHAR(8) PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15)
);

-- Reservation
CREATE TABLE Reservation (
    leg_no INT,
    flight_id CHAR(10),
    date DATE,
    seat_no INT,
    customer_id CHAR(8),
    PRIMARY KEY (leg_no, flight_id, date, seat_no),
    FOREIGN KEY (flight_id, leg_no, date) REFERENCES LegInstance(flight_id, leg_no, date),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);