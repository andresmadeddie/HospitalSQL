-- DROP SCHEMA, RECREATED, AND USE IT
DROP SCHEMA IF EXISTS hospital;
CREATE SCHEMA hospital;
USE hospital;

-- CREATE TABLES
CREATE TABLE Person (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender ENUM('M', 'F', 'Other'),
    address VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(50)
);
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    person_id INT,
    specialization VARCHAR(50),
    license_number VARCHAR(20),
    hire_date DATE,
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);
CREATE TABLE Nurse (
    nurse_id INT PRIMARY KEY,
    person_id INT,
    shift ENUM('Day', 'Night', 'Evening'),
    hire_date DATE,
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    person_id INT,
    admission_date DATE,
    discharge_date DATE,
    medical_history TEXT,
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);
CREATE TABLE Management (
    management_id INT PRIMARY KEY,
    person_id INT,
    department VARCHAR(50),
    position VARCHAR(50),
    hire_date DATE,
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);
CREATE TABLE AdministrativeEmployee (
    admin_id INT PRIMARY KEY,
    person_id INT,
    department VARCHAR(50),
    hire_date DATE,
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);
CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    contact_person VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(50)
);
CREATE TABLE Equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(50),
    purchase_date DATE,
    warranty_end DATE,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);
CREATE TABLE MedicalSupplies (
    supply_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10, 2),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);
CREATE TABLE Appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appointment_date DATETIME,
    reason_for_visit VARCHAR(255),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- TRUNCATE ALL TABLES
-- SET FOREIGN_KEY_CHECKS = 0;
-- TRUNCATE TABLE Appointment;
-- TRUNCATE TABLE MedicalSupplies;
-- TRUNCATE TABLE Equipment;
-- TRUNCATE TABLE Supplier;
-- TRUNCATE TABLE AdministrativeEmployee;
-- TRUNCATE TABLE Management;
-- TRUNCATE TABLE Patient;
-- TRUNCATE TABLE Nurse;
-- TRUNCATE TABLE Doctor;
-- TRUNCATE TABLE Person;
-- SET FOREIGN_KEY_CHECKS = 1;

-- INSERT
-- Inserting into Person
INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Homer', 'Simpson', '1970-05-12', 'M', '742 Evergreen Terrace', '555-7334', 'homer.simpson@springfield.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Leela', 'Turanga', '2975-12-29', 'F', 'Planet Express HQ, New New York', '555-9876', 'leela@planetexpress.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Ada', 'Lovelace', '1815-12-10', 'F', '12 Analytical St', '555-3001', 'ada.lovelace@computing.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Neo', 'Anderson', '1964-03-11', 'M', 'Apartment 101, Matrix City', '555-1011', 'neo@matrix.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Tron', 'User', '1982-07-09', 'M', 'Grid Network, Mainframe City', '555-8762', 'tron@grid.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('John', 'Doe', '1980-05-15', 'M', '123 Elm St', '555-1234', 'jdoe@example.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Peter', 'Parker', '1975-08-10', 'M', '20 Ingram St', '555-6543', 'peter.parker@dailybugle.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Clark', 'Kent', '1945-02-28', 'M', '344 Clinton St', '555-9999', 'clark.kent@dailyplanet.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Diana', 'Prince', '1985-07-15', 'F', '17 Themyscira Way', '555-0001', 'diana.prince@justiceleague.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Bruce', 'Wayne', '1950-06-30', 'M', '1007 Mountain Drive', '555-4321', 'bruce.wayne@wayneenterprises.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Mario', 'Mario', '1985-03-10', 'M', 'Mushroom Kingdom', '555-3333', 'mario@mushroomkingdom.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Luigi', 'Mario', '1987-07-12', 'M', 'Mushroom Kingdom', '555-4444', 'luigi@mushroomkingdom.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Sonic', 'Hedgehog', '1991-05-01', 'M', 'Green Hill Zone', '555-5555', 'sonic@greenhill.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Yoda', 'Master', '896-05-01', 'M', 'Dagobah', '555-6666', 'yoda@jedi.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Gandalf', 'Grey', '1000-01-01', 'M', 'Middle Earth', '555-7777', 'gandalf@middleearth.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Hermione', 'Granger', '1985-09-19', 'F', 'Hogwarts', '555-8888', 'hermione@hogwarts.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Frodo', 'Baggins', '1985-09-22', 'M', 'The Shire', '555-9990', 'frodo@shire.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Bilbo', 'Baggins', '2890-09-22', 'M', 'The Shire', '555-9991', 'bilbo@shire.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('TChalla', 'Wakanda', '1980-04-10', 'M', 'Wakanda', '555-1122', 'tchalla@wakanda.com');

INSERT INTO Person (first_name, last_name, dob, gender, address, phone_number, email) 
VALUES ('Leia', 'Organa', '1990-09-21', 'F', 'Alderaan', '555-2211', 'leia@alderaan.com');



-- Inserting into Doctor
INSERT INTO Doctor (doctor_id, person_id, specialization, license_number, hire_date) 
VALUES (1, 1, 'Cardiology', 'LIC12345', '2010-06-01');

INSERT INTO Doctor (doctor_id, person_id, specialization, license_number, hire_date) 
VALUES (2, 2, 'Pediatrics', 'LIC67890', '2012-08-15');

INSERT INTO Doctor (doctor_id, person_id, specialization, license_number, hire_date) 
VALUES (3, 3, 'Neurology', 'LIC54321', '2018-04-20');

-- Inserting into Nurse
INSERT INTO Nurse (nurse_id, person_id, shift, hire_date) 
VALUES (1, 4, 'Day', '2015-03-10');

INSERT INTO Nurse (nurse_id, person_id, shift, hire_date) 
VALUES (2, 5, 'Night', '2016-07-22');

INSERT INTO Nurse (nurse_id, person_id, shift, hire_date) 
VALUES (3, 6, 'Evening', '2019-11-28');

-- Inserting into Patient
INSERT INTO Patient (patient_id, person_id, admission_date, discharge_date, medical_history) 
VALUES (1, 7, '2024-01-10', NULL, 'Diabetes Type 2');

INSERT INTO Patient (patient_id, person_id, admission_date, discharge_date, medical_history) 
VALUES (2, 8, '2024-02-15', '2024-02-20', 'Hypertension');

INSERT INTO Patient (patient_id, person_id, admission_date, discharge_date, medical_history) 
VALUES (3, 9, '2024-03-01', NULL, 'Asthma');

-- Inserting into Management
INSERT INTO Management (management_id, person_id, department, position, hire_date) 
VALUES (1, 10, 'Finance', 'CFO', '2008-09-01');

INSERT INTO Management (management_id, person_id, department, position, hire_date) 
VALUES (2, 11, 'IT', 'CTO', '2011-05-12');

INSERT INTO Management (management_id, person_id, department, position, hire_date) 
VALUES (3, 12, 'Operations', 'COO', '2019-01-15');

-- Inserting into Administrative Employee
INSERT INTO AdministrativeEmployee (admin_id, person_id, department, hire_date) 
VALUES (1, 13, 'Human Resources', '2020-02-18');

INSERT INTO AdministrativeEmployee (admin_id, person_id, department, hire_date) 
VALUES (2, 14, 'Accounting', '2021-03-05');

INSERT INTO AdministrativeEmployee (admin_id, person_id, department, hire_date) 
VALUES (3, 15, 'Legal', '2023-07-22');


-- Inserting into Supplier
INSERT INTO Supplier (name, contact_person, phone_number, email) 
VALUES ('MediSupply', 'Alice Green', '555-7890', 'alice@medisupply.com');

INSERT INTO Supplier (name, contact_person, phone_number, email) 
VALUES ('HealthGoods', 'Bob White', '555-4321', 'bob@healthgoods.com');

-- Inserting into Equipment
INSERT INTO Equipment (name, type, purchase_date, warranty_end, supplier_id) 
VALUES ('MRI Scanner', 'Imaging', '2022-05-05', '2025-05-05', 1);

-- Inserting into Medical Supplies
INSERT INTO MedicalSupplies (name, quantity, unit_price, supplier_id) 
VALUES ('Gloves', 1000, 0.50, 1);

-- Inserting into Appointment
INSERT INTO Appointment (doctor_id, patient_id, appointment_date, reason_for_visit) 
VALUES (1, 1, '2024-10-01 14:30:00', 'Routine Check-up');
-- Appointment 1

INSERT INTO Appointment (doctor_id, patient_id, appointment_date, reason_for_visit) 
VALUES (1, 2, '2024-10-05 10:00:00', 'Follow-up for Diabetes');

-- Appointment 2
INSERT INTO Appointment (doctor_id, patient_id, appointment_date, reason_for_visit) 
VALUES (2, 2, '2024-10-07 16:00:00', 'Flu Symptoms');

-- Appointment 3
INSERT INTO Appointment (doctor_id, patient_id, appointment_date, reason_for_visit) 
VALUES (2, 2, '2024-10-10 09:30:00', 'Blood Pressure Check');

-- UPDATE

-- Update a person’s address
UPDATE Person 
SET address = '456 Oak St' 
WHERE person_id = 1;

-- Update doctor’s specialization
UPDATE Doctor 
SET specialization = 'Neurology' 
WHERE doctor_id = 1;

-- Update nurse’s shift
UPDATE Nurse 
SET shift = 'Night' 
WHERE nurse_id = 1;

-- Update patient’s discharge date
UPDATE Patient 
SET discharge_date = '2024-10-02' 
WHERE patient_id = 1;

-- Update management position
UPDATE Management 
SET position = 'CEO' 
WHERE management_id = 1;

-- Update administrative employee's department
UPDATE AdministrativeEmployee 
SET department = 'Operations' 
WHERE admin_id = 1;

-- Update supplier’s contact person
UPDATE Supplier 
SET contact_person = 'Bob Blue' 
WHERE supplier_id = 1;

-- Update equipment’s warranty end date
UPDATE Equipment 
SET warranty_end = '2026-05-05' 
WHERE equipment_id = 1;

-- Update medical supply quantity
UPDATE MedicalSupplies 
SET quantity = 1200 
WHERE supply_id = 1;

-- Update appointment reason
UPDATE Appointment 
SET reason_for_visit = 'Follow-up on blood work' 
WHERE appointment_id = 1;

-- DELETE

-- Delete a person
DELETE FROM Person 
WHERE person_id = 20;

-- Delete an appointment
DELETE FROM Appointment 
WHERE appointment_id = 1;

-- Delete a doctor
DELETE FROM Doctor 
WHERE doctor_id = 3;

-- Delete a nurse
DELETE FROM Nurse 
WHERE nurse_id = 3;

-- Delete a patient
DELETE FROM Patient 
WHERE patient_id = 3;

-- Delete a management employee
DELETE FROM Management 
WHERE management_id = 3;

-- Delete an administrative employee
DELETE FROM AdministrativeEmployee 
WHERE admin_id = 3;

-- Delete a supplier
DELETE FROM Supplier 
WHERE supplier_id = 2;

-- Delete equipment
DELETE FROM Equipment 
WHERE equipment_id = 1;

-- Delete medical supplies
DELETE FROM MedicalSupplies 
WHERE supply_id = 1;

-- ALTER TABLE

-- Add a new column to the Person table for emergency contact
ALTER TABLE Person 
ADD emergency_contact VARCHAR(50);

-- Add a UNIQUE constraint to the license_number in Doctor table
ALTER TABLE Doctor 
ADD CONSTRAINT UNIQUE (license_number);

-- Drop the department column from the Management table
ALTER TABLE Management 
DROP COLUMN department;

-- Modify the name column in MedicalSupplies to increase the length
ALTER TABLE MedicalSupplies 
MODIFY name VARCHAR(100);

-- Add a foreign key to the Equipment table for the Supplier ID
ALTER TABLE Equipment 
ADD CONSTRAINT fk_supplier 
FOREIGN KEY (supplier_id) 
REFERENCES Supplier(supplier_id);

-- JOIN

SELECT p.first_name, p.last_name, d.specialization, n.shift, pat.admission_date, 
       m.position, a.department, s.name AS supplier_name, e.name AS equipment_name, 
       ms.name AS supply_name, app.appointment_date, app.reason_for_visit
FROM Person p
LEFT JOIN Doctor d ON p.person_id = d.person_id
LEFT JOIN Nurse n ON p.person_id = n.person_id
LEFT JOIN Patient pat ON p.person_id = pat.person_id
LEFT JOIN Management m ON p.person_id = m.person_id
LEFT JOIN AdministrativeEmployee a ON p.person_id = a.person_id
LEFT JOIN Appointment app ON pat.patient_id = app.patient_id
LEFT JOIN Equipment e ON app.doctor_id = d.doctor_id
LEFT JOIN Supplier s ON e.supplier_id = s.supplier_id
LEFT JOIN MedicalSupplies ms ON ms.supplier_id = s.supplier_id;

-- Left Join: Show all persons with their doctors if available
SELECT p.first_name, d.specialization
FROM Person p
LEFT JOIN Doctor d ON p.person_id = d.person_id;

-- Right Join: Show all equipment and their suppliers if available
SELECT e.name, s.name
FROM Equipment e
RIGHT JOIN Supplier s ON e.supplier_id = s.supplier_id;

-- Inner Join: Show doctors with their appointments
SELECT d.specialization, app.appointment_date
FROM Doctor d
INNER JOIN Appointment app ON d.doctor_id = app.doctor_id;

-- Outer Join: Patients and their appointments 
SELECT per.first_name, app.appointment_date
FROM Patient p
LEFT JOIN Person per ON p.person_id = per.person_id
LEFT JOIN Appointment app ON p.patient_id = app.patient_id
UNION
SELECT per.first_name, app.appointment_date
FROM Patient p
RIGHT JOIN Person per ON p.person_id = per.person_id
RIGHT JOIN Appointment app ON p.patient_id = app.patient_id;


-- Left Join: Nurses and their shifts
SELECT n.nurse_id, p.first_name, n.shift
FROM Nurse n
LEFT JOIN Person p ON n.person_id = p.person_id;

-- AGREGATE FUNCITONS

-- Count total doctors
SELECT COUNT(*) AS total_doctors 
FROM Doctor;

-- Count total patients
SELECT COUNT(*) AS total_patients 
FROM Patient;

-- Average equipment warranty duration
SELECT AVG(DATEDIFF(warranty_end, purchase_date)) AS avg_warranty_duration 
FROM Equipment;

-- Sum of medical supplies quantity
SELECT SUM(quantity) AS total_supplies 
FROM MedicalSupplies;

-- Maximum price of medical supplies
SELECT MAX(unit_price) AS max_price 
FROM MedicalSupplies;

-- Minimum price of medical supplies
SELECT MIN(unit_price) AS min_price 
FROM MedicalSupplies;

-- Total number of appointments by doctor
SELECT d.doctor_id, COUNT(app.appointment_id) AS total_appointments
FROM Doctor d
LEFT JOIN Appointment app ON d.doctor_id = app.doctor_id
GROUP BY d.doctor_id;

-- HAVING
-- Total appointments by doctor, only showing doctors with more than 5 appointments
SELECT d.doctor_id, COUNT(app.appointment_id) AS total_appointments
FROM Doctor d
LEFT JOIN Appointment app ON d.doctor_id = app.doctor_id
GROUP BY d.doctor_id
HAVING total_appointments > 5;

-- Count of patients admitted for more than 7 days
SELECT COUNT(patient_id) AS long_term_patients 
FROM Patient 
WHERE DATEDIFF(discharge_date, admission_date) > 7;

-- Doctors with average appointments time after '2024-01-01'
SELECT d.doctor_id, AVG(DATEDIFF(CURDATE(), app.appointment_date)) AS avg_days
FROM Doctor d
JOIN Appointment app ON d.doctor_id = app.doctor_id
WHERE app.appointment_date > '2024-01-01'
GROUP BY d.doctor_id
HAVING avg_days > 30;

-- Suppliers providing more than 500 medical supplies
SELECT s.name, SUM(ms.quantity) AS total_supplies
FROM Supplier s
JOIN MedicalSupplies ms ON s.supplier_id = ms.supplier_id
GROUP BY s.name
HAVING total_supplies > 0;  -- Specify a condition based on total supplies
