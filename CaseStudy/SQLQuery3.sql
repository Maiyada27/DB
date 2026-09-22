INSERT INTO DEPARTMENT (D_NO, DName, ManagerID, hiredate)
VALUES  ('1', 'Headquarters', NULL, '1981-06-19'),
       ('2', 'Marketing', NULL, '1998-01-01'),
       ('3', 'Finance', NULL, '2005-03-15'),
       ('4', 'Administration', NULL, '1995-01-01'),
       ('5', 'Research', NULL, '1988-05-22');

INSERT INTO EMPLOYEE (SSN, FName, LName, Gn, BD, DNum, SupervisorID, Salary)
VALUES ('123456789', 'John', 'Smith', 'M', '1965-01-09', '5', '333445555', 30000),
       ('333445555', 'Franklin', 'Wong', 'M', '1955-12-08', '5', '888665555', 40000),
       ('999887777', 'Alicia', 'Zelaya', 'F', '1968-07-19', '4', '987654321', 25000),
       ('987654321', 'Jennifer', 'Wallace', 'F', '1941-06-20', '4', '888665555', 43000),
       ('888665555', 'James', 'Borg', 'M', '1937-11-10', '1', NULL, 55000);


UPDATE DEPARTMENT
SET ManagerID = '888665555'
WHERE D_NO = '1';

UPDATE DEPARTMENT
SET ManagerID = '987654321'
WHERE D_NO = '2';

UPDATE DEPARTMENT
SET ManagerID = '999887777'
WHERE D_NO = '3';

UPDATE DEPARTMENT
SET ManagerID = '987654321'
WHERE D_NO = '4';

UPDATE DEPARTMENT
SET ManagerID = '333445555'
WHERE D_NO = '5';    

INSERT INTO DEPT_LOCATIONS (DNum, location)
VALUES ('1', 'Muscat'), 
       ('2', 'Dubai'),
       ('3', 'Riyadh'),
       ('4', 'Manama'),
       ('5', 'Doha');

INSERT INTO PROJECT(PNum, Pname, Location, City, DNum)
VALUES ('1', 'ProductX', 'Muscat', 'Muscat', '5'),
       ('2', 'ProductY', 'Dubai', 'Dubai', '5'),
       ('3', 'ProductZ', 'Riyadh', 'Riyadh', '5'),
       ('10', 'Computerization', 'Manama', 'Manama', '4'),
       ('20', 'Reorganization', 'Doha', 'Doha', '1');

INSERT INTO WORKS_ON (PNum, EmployeeID, WorkingHours)
VALUES 
('1', '123456789', 32.5),  
('2', '123456789', 7.5),  
('2', '333445555', 10.0),  
('3', '333445555', 10.0), 
('10', '999887777', 10.0); 

INSERT INTO DEPENDENT (SSN, DName, Gn, BD)
VALUES 
('333445555', 'Alice', 'F', '1986-04-05'),
('333445555', 'Theodore', 'M', '1983-10-25'),
('333445555', 'Joy', 'F', '1958-05-03'),
('987654321', 'Abner', 'M', '1942-02-28'),
('123456789', 'Michael', 'M', '1988-01-04');
