CREATE DATABASE CollegeSystem;

-- Department first
CREATE TABLE Department(
    DeptID VARCHAR(6) PRIMARY KEY,
    DeptName VARCHAR(20)
);

-- Faculty references Department
CREATE TABLE Faculty(
    FId CHAR(5) PRIMARY KEY,
    Name VARCHAR(20),
    DeptID VARCHAR(6),
    Salary INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Subject references Faculty
CREATE TABLE Subject(
    SubID CHAR(4) PRIMARY KEY,
    SubName VARCHAR(15),
    FId CHAR(5),
    FOREIGN KEY (FId) REFERENCES Faculty(FId)
);

-- Course
CREATE TABLE Course(
    CourseID CHAR(5) PRIMARY KEY,
    CourseName VARCHAR(20),
    Duration INT
);


CREATE TABLE Courses(
    DeptID VARCHAR(6),
    CourseID CHAR(5),
    PRIMARY KEY (DeptID, CourseID),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


CREATE TABLE Exam(
    ExamCode VARCHAR(6) PRIMARY KEY,
    Time CHAR(5),
    Date DATE,
    Room VARCHAR(4),
    DeptID VARCHAR(6),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Hostel
CREATE TABLE Hostel(
    HostelID CHAR(6) PRIMARY KEY,
    Name VARCHAR(15),
    Address VARCHAR(15),
    State VARCHAR(15),
    PinCode VARCHAR(10),
    NoSeats INT
);


CREATE TABLE Student(
    SId CHAR(8) PRIMARY KEY,
    FName VARCHAR(20),
    LName VARCHAR(20),
    DOB DATE,
    Address VARCHAR(50),
    ExamCode VARCHAR(6),
    CourseID CHAR(5),
    DeptID VARCHAR(6),
    HostelID CHAR(6),
    FOREIGN KEY (ExamCode) REFERENCES Exam(ExamCode),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    FOREIGN KEY (HostelID) REFERENCES Hostel(HostelID)
);


CREATE TABLE Subjects(
    SId CHAR(8),
    SubID CHAR(4),
    PRIMARY KEY (SId, SubID),
    FOREIGN KEY (SId) REFERENCES Student(SId),
    FOREIGN KEY (SubID) REFERENCES Subject(SubID)
);
