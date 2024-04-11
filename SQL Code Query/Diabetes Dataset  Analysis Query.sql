-- Select the whole Table
select *
from diabetes_prediction_dataset

-- Select top 5 records
Select top 5 *
from diabetes_prediction_dataset

-- Look for missing values
select *
from diabetes_prediction_dataset
Where 'gender, age, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes' is null



-- BASIC DATA SUMMARIES

-- Gender Count
SELECT gender, COUNT(gender) AS gender_count
FROM diabetes_prediction_dataset
GROUP BY gender
ORDER BY gender asc;

-- Age group Count
WITH AgeGroups AS (
    SELECT *,
        CASE
            WHEN TRY_CAST(age AS DECIMAL(10, 2)) BETWEEN 0 AND 9 THEN 'child'
            WHEN TRY_CAST(age AS DECIMAL(10, 2)) BETWEEN 10 AND 19 THEN 'teenager'
            WHEN TRY_CAST(age AS DECIMAL(10, 2)) BETWEEN 20 AND 29 THEN 'young'
            WHEN TRY_CAST(age AS DECIMAL(10, 2)) BETWEEN 30 AND 49 THEN 'middle age'
            WHEN TRY_CAST(age AS DECIMAL(10, 2)) > 50 THEN 'old'
            ELSE NULL
        END AS age_group
    FROM diabetes_prediction_dataset
    WHERE age IS NOT NULL
)
SELECT age_group, COUNT(age_group) AS agegroup_count
FROM AgeGroups
GROUP BY age_group
ORDER BY age_group ASC;

-- hypertension count
SELECT hypertension, COUNT(hypertension) AS hypertension_count 
FROM diabetes_prediction_dataset
GROUP BY hypertension
ORDER BY hypertension asc;

-- heart disease Count
SELECT heart_disease, COUNT(heart_disease) AS heartdisease_count 
FROM diabetes_prediction_dataset
GROUP BY heart_disease
ORDER BY heart_disease asc;

-- Smoking Count
SELECT smoking_history, COUNT(smoking_history) AS smokinghistory_count 
FROM diabetes_prediction_dataset
GROUP BY smoking_history
ORDER BY smoking_history asc;

-- Diabetes Count
SELECT diabetes, COUNT(diabetes) AS diabetes_count
FROM diabetes_prediction_dataset
GROUP BY diabetes
ORDER BY diabetes asc;


