-- Heart Disease Business Analysis

-- 1. Overall outcome
SELECT heart_disease, COUNT(*) AS patients,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct
FROM heart_disease
GROUP BY heart_disease;

-- 2. Key clinical risk factors
SELECT 'hypertension' AS factor, hypertension AS status,
       COUNT(*) AS patients,
       ROUND(100.0 * AVG(CAST(heart_disease AS DECIMAL(10,4))), 2) AS disease_rate_pct
FROM heart_disease GROUP BY hypertension
UNION ALL
SELECT 'diabetes', diabetes, COUNT(*),
       ROUND(100.0 * AVG(CAST(heart_disease AS DECIMAL(10,4))), 2)
FROM heart_disease GROUP BY diabetes
UNION ALL
SELECT 'previous_heart_event', previous_heart_event, COUNT(*),
       ROUND(100.0 * AVG(CAST(heart_disease AS DECIMAL(10,4))), 2)
FROM heart_disease GROUP BY previous_heart_event
UNION ALL
SELECT 'exercise_angina', exercise_angina, COUNT(*),
       ROUND(100.0 * AVG(CAST(heart_disease AS DECIMAL(10,4))), 2)
FROM heart_disease GROUP BY exercise_angina;

-- 3. Lifestyle segmentation
SELECT smoking_status, physical_activity,
       COUNT(*) AS patients,
       ROUND(100.0 * AVG(CAST(heart_disease AS DECIMAL(10,4))),2) AS disease_rate_pct
FROM heart_disease
GROUP BY smoking_status, physical_activity
ORDER BY disease_rate_pct DESC;

-- 4. Age segmentation
SELECT CASE
         WHEN age < 39 THEN '<39'
         WHEN age < 49 THEN '39-48'
         WHEN age < 59 THEN '49-58'
         WHEN age < 69 THEN '59-68'
         ELSE '69+'
       END AS age_band,
       COUNT(*) AS patients,
       ROUND(100.0 * AVG(CAST(heart_disease AS DECIMAL(10,4))),2) AS disease_rate_pct
FROM heart_disease
GROUP BY CASE
         WHEN age < 39 THEN '<39'
         WHEN age < 49 THEN '39-48'
         WHEN age < 59 THEN '49-58'
         WHEN age < 69 THEN '59-68'
         ELSE '69+'
       END
ORDER BY MIN(age);

-- 5. BP / cholesterol risk
SELECT CASE WHEN resting_bp < 120 THEN '<120'
            WHEN resting_bp < 130 THEN '120-129'
            WHEN resting_bp < 140 THEN '130-139'
            WHEN resting_bp < 160 THEN '140-159'
            ELSE '160+' END AS bp_band,
       COUNT(*) AS patients,
       ROUND(100.0 * AVG(CAST(heart_disease AS DECIMAL(10,4))),2) AS disease_rate_pct
FROM heart_disease GROUP BY
CASE WHEN resting_bp < 120 THEN '<120' WHEN resting_bp < 130 THEN '120-129'
     WHEN resting_bp < 140 THEN '130-139' WHEN resting_bp < 160 THEN '140-159' ELSE '160+' END;

-- 6. Risk-factor accumulation
WITH x AS (
 SELECT *, diabetes + hypertension + family_history +
          previous_heart_event + exercise_angina AS risk_factor_count
 FROM heart_disease
)
SELECT risk_factor_count, COUNT(*) AS patients,
       ROUND(100.0 * AVG(CAST(heart_disease AS DECIMAL(10,4))),2) AS disease_rate_pct
FROM x GROUP BY risk_factor_count ORDER BY risk_factor_count;
