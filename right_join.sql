use 61r;

CREATE TABLE Doctors1 (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50),
    experience INT,
    department VARCHAR(50)
);
INSERT INTO Doctors1 (doctor_id, doctor_name, specialization, experience, department)
VALUES
(1, 'Dr. Smith', 'Cardiologist', 10, 'Cardiology'),
(2, 'Dr. John', 'Neurologist', 8, 'Neurology'),
(3, 'Dr. Alex', 'Dermatologist', 6, 'Skin'),
(4, 'Dr. Mary', 'Orthopedic', 12, 'Bone'),
(5, 'Dr. Rahul', 'Pediatrician', 7, 'Child Care');


CREATE TABLE Appointments1 (
    appointment_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    doctor_id INT,
    appointment_date DATE,
    fees DECIMAL(10,2),
    FOREIGN KEY (doctor_id) REFERENCES Doctors1(doctor_id)
);

INSERT INTO Appointments1 (appointment_id, patient_name, doctor_id, appointment_date, fees)
VALUES
(101, 'Alice', 1, '2024-01-02', 500),
(102, 'Bob', 2, '2024-01-03', 600),
(103, 'Charlie', 2, '2024-01-05', 600),
(104, 'David', NULL, '2024-01-06', 700), 
(105, 'Emma', 3, '2024-01-07', 400),
(106, 'Frank', NULL, '2024-01-09', 350);

--  Write a query to display all doctors and their corresponding appointment details using RIGHT 
-- JOIN. 
select Doctors1.doctor_name, Appointments1.appointment_id
from Doctors1
right join  Appointments1
using(doctor_id);

--  Show each doctor’s name along with the patient’s name. Include doctors who have no 
-- appointments. 
select doctor_name,patient_name
from Doctors1
right join Appointments1
using(doctor_id);

--   Retrieve doctor name, specialization, and appointment date for all doctors, even those without 
-- patients. 
select doctor_name, specialization, appointment_date
from Appointments1
right join Doctors1
using(doctor_id);

-- Find the list of doctors who don’t have any appointments yet.
select Doctors1.doctor_name
from Appointments1
right join Doctors1
using(doctor_id)
where Appointments1.doctor_id is null;

--   Display each doctor’s name and the total number of appointments they have (include 0 if none).
select doctor_name, count( Appointments1.doctor_id) as appoint_count
from Appointments1
right join Doctors1
using(doctor_id)
group by doctor_name;

--   Show the total fees collected by each doctor (display 0 if no fees were collected).
select doctor_name, sum(Appointments1.fees) as t_fees
from Doctors1
right join Appointments1
using(doctor_id)
group by doctor_name;

--  List all doctors and the patients they treated, ordered by doctor name. 
select doctor_name, patient_name
from Appointments1
right join Doctors1
using(doctor_id)
group by doctor_name, patient_name
order by doctor_name;

-- Display doctor name, specialization, and average fee charged per doctor. 
select doctor_name, specialization, avg(Appointments1.fees)
from Doctors1
right join Appointments1
using(doctor_id)
group by  doctor_name, specialization;

--  Find doctors whose average consultation fee is greater than ₹500. 
select doctor_name, avg(fees) as average_fee
from Doctors1
right join Appointments1
using(doctor_id)
where  fees > 500
group by doctor_name;

--   Show all doctor names with their department and total number of distinct patients.
select doctor_name, count(patient_name) as patients
from Doctors1
right join Appointments1
using(doctor_id)
group by doctor_name;

-- List doctors who have treated at least two unique patients. 
select doctor_name, count(Appointments1.doctor_id) as patient_count
from Doctors1
right join Appointments1
using(doctor_id)
group by doctor_name
having patient_count >=1;

--  Display each department and total revenue generated from its doctors (include departments 
-- with no revenue).
select department, doctor_name, sum(fees) as fee_from_doctor
from Appointments1
right join Doctors1
using(doctor_id)
group by department, doctor_name;

--  Retrieve each doctor’s name and their most recent appointment date (if any).
select doctor_name, appointment_date, patient_name
from Appointments1
right join Doctors1
using(doctor_id) 
group by doctor_name, appointment_date, patient_name
order by appointment_date desc;

--  Show all doctors, replacing missing patient names with "No Patient".
select doctor_name, ifnull(patient_name, "no patient") as patient_name
from Appointments1
right join Doctors1
using(doctor_id);

--  Find the total number of appointments, ensuring that doctors without appointments are also 
-- included.
select doctor_name, count(patient_name) as total_appoint
from Appointments1
right join Doctors1
using(doctor_id)
group by doctor_name;
