USE diabetes;
-- Retrieve the Patient_id and ages of all patients
SELECT Patient_id, age
FROM diabetes_prediction;

--Select all females patients who are older than 40
SELECT *
FROM diabetes_prediction
WHERE gender= "Female" AND age >40;

--Calculate the average BMI of Patients
SELECT AVG(bmi)
FROM diabetes_prediction;

--List Patient in descending order of blood glucose levels
SELECT Patient_id
FROM diabetes_prediction
ORDER BY blood_glucose_level DESC;

--Find patients who have hypertension and diabetes
SELECT EmployeeName, Patient_id 
FROM diabetes_prediction
WHERE hypertension=1 AND diabetes=1;

--Determine the number of patient with heart disease
SELECT COUNT(Patient_id)
FROM diabetes_prediction 
WHERE heart_disease = 1;

--Group patient by smoking history and count how many smokers and nonsmokers there are
SELECT smoking_history, COUNT(*) AS no_of_patients
FROM diabetes_prediction
GROUP BY smoking_history;

SELECT
CASE
    WHEN smoking_history IN ("current", "ever", "former") THEN "Smoker"
	WHEN smoking_history IN ("never") THEN "Non-Smoker"
	ELSE "Unknown"
	END AS "smoking_category", 
COUNT(*) AS no_of_patients
FROM diabetes_prediction
GROUP BY smoking_history;

--Retrieve the Patient_ids of patients who have a BMI greater than 
the average BMI.
SELECT Patient_id
FROM diabetes_prediction
WHERE bmi > (SELECT AVG(bmi) FROM diabetes_prediction);

--Find the patient with the highest HbA1c level and the patient 
with the lowest HbA1clevel.

SELECT EmployeeName, Patient_id, HbA1c_level
FROM diabetes_prediction
WHERE HbA1c_level = (SELECT MAX(HbA1c_level) FROM diabetes_prediction)
UNION
SELECT EmployeeName, Patient_id, HbA1c_level
FROM diabetes_prediction
WHERE HbA1c_level = (SELECT MIN(HbA1c_level) FROM diabetes_prediction);

--Calculate the age of patients in years (assuming the current date as of now).

SELECT EmployeeName, Patient_id,
YEAR (NOW())-age AS birth_year,
YEAR (NOW())-YEAR(NOW()) + age AS current_age
FROM diabetes_prediction;

--Update the smoking history of patients who are older than 50 to "Ex-smoker".

SET SQL_SAFE_UPDATES=0;
UPDATE diabetes_prediction
SET smoking_history = "Ex- Smoker"
WHERE age>50;

SELECT EmployeeName, Patient_id, age
FROM diabetes_prediction
WHERE age>50;

--Insert a new patient into the database with sample data.

INSERT INTO diabetes_prediction(EmployeeName, Patient_id, gender, age, hypertension, 
heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes)
VALUES
("Ishu Pathak", "PT110011", "Female", 24, 0, 0, "never", 26.32, 5.7, 92, 0);

SELECT * FROM diabetes_prediction
WHERE Patient_id = "PT110011";

--Delete all patients with heart disease from the database.

DELETE FROM diabetes_prediction
WHERE heart_disease = 1;

SELECT * FROM diabetes_prediction
WHERE heart_disease = 1;

--Create a view that displays the Patient_ids, ages, and BMI of patients.

CREATE VIEW patientinfo AS
SELECT Patient_id, age, bmi
FROM diabetes_prediction;

SELECT * FROM diabetes_prediction;

