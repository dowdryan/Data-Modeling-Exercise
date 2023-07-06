
DROP DATABASE IF EXISTS med_center;
CREATE DATABASE med_center;
\c med_center


CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    patient_name VARCHAR(15)
);
CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    doctor_name VARCHAR(15)
);
CREATE TABLE conditions (
    id SERIAL PRIMARY KEY,
    medical_condition VARCHAR(15)
);
CREATE TABLE patients_info (
    id SERIAL PRIMARY KEY,
    patient_name INTEGER REFERENCES patients(id),
    name_of_doctor INTEGER REFERENCES doctors(id),
    diagnosed_condition INTEGER REFERENCES conditions(id)
);


INSERT INTO patients (patient_name)
VALUES 
    ('Pat'),
    ('Tient');
INSERT INTO doctors (doctor_name) 
VALUES 
    ('Doc'), 
    ('Tor');
INSERT INTO conditions (medical_condition)
VALUES 
    ('Cold'),
    ('Arthritis');
INSERT INTO patients_info (patient_name, name_of_doctor, diagnosed_condition)
VALUES 
    (1, 1, 1),
    (1, 2, 2);

SELECT * FROM public.patients LIMIT 2;
SELECT * FROM public.doctors LIMIT 2;
SELECT * FROM public.conditions LIMIT 2;


SELECT patients_info.id, patients.patient_name, conditions.medical_condition, doctors.doctor_name
    FROM patients_info
        JOIN patients ON patients_info.patient_name = patients.id
        JOIN conditions ON patients_info.diagnosed_condition = conditions.id
        JOIN doctors ON patients_info.name_of_doctor = doctors.id;