# Heart-Disease-Prediction-2026-SQL-Python-Deep-Dive-Analysis

## 1. Project Overview
This project performs an end-to-end exploratory and business-level analysis of a 100,000-row heart disease dataset. Python is used for EDA, statistical profiling and visualization, while SQL is used to reproduce the major segmentation and KPI outputs.

> **Important:** This is an analytical dataset, not a clinical diagnostic tool. Associations in the data should not be interpreted as medical causation.

## 2. Objectives
- Profile data quality and structure.
- Understand the distribution of heart disease outcomes.
- Identify the strongest demographic, lifestyle and clinical associations.
- Segment patients by age, blood pressure, cholesterol and lifestyle.
- Quantify how multiple major risk factors accumulate.
- Produce business-ready insights and visualizations.

## 3. Dataset
- Rows: 100,000
- Columns: 27
- Missing values: 0
- Duplicate rows: 0
- Heart disease prevalence: 46.08%

## 4. Key Findings
1. Heart disease is present in **46.08%** of records.
2. Age shows a strong positive relationship with the outcome (correlation ≈ **0.458**). The observed disease rate rises from **11.7%** among ages 28–38 to **83.9%** among ages 69–80.
3. Hypertension is a major segmentation variable: disease rate is **64.0%** with hypertension versus **30.2%** without it.
4. Diabetes is also strongly associated: **71.3%** disease rate among patients with diabetes versus **43.0%** without diabetes.
5. Previous heart events show a very high observed rate (**76.5%**), although this variable may overlap conceptually with the target and should be reviewed carefully before predictive modeling.
6. Exercise angina has a large observed difference: **72.0%** versus **37.1%** without it.
7. Current smokers show a higher observed disease rate (**57.4%**) than never smokers (**43.1%**).
8. Sedentary patients have a higher observed rate (**53.1%**) than very active patients (**38.4%**).
9. Downsloping ST slope has an observed rate of **58.6%**, compared with **37.3%** for upsloping.
10. Risk-factor accumulation is highly differentiated: patients with 0 of the five major binary clinical risk factors have a **21.1%** observed rate, versus **93.1%** with four factors.

## 5. EDA Process
- Shape, schema and data types
- Missing-value audit
- Duplicate audit
- Descriptive statistics
- Categorical distributions
- Target balance
- Numeric correlation analysis
- Risk segmentation
- Age/BMI/BP/cholesterol bands
- Multi-risk-factor analysis

## 6. Business / Decision Outputs
### High-priority segments
- Older populations
- Hypertension and diabetes segments
- Patients with exercise angina
- Patients with prior heart events
- Patients accumulating multiple clinical risk factors
- Current smokers and sedentary groups

### Potential use cases
- Preventive-care outreach prioritization
- Population health segmentation
- Risk-monitoring dashboards
- Healthcare analytics portfolio projects
- Feature selection for a later predictive modeling exercise

## 7. SQL Analysis
`sql/business_analysis.sql` contains queries for:
- Outcome KPIs
- Clinical risk factors
- Lifestyle segmentation
- Age bands
- Blood-pressure bands
- Risk-factor accumulation

## 8. Python Analysis
`python/analysis.py` contains reproducible EDA and business analysis logic.

## 9. Visualizations
The `visualizations/` folder contains:
- Target distribution
- Age vs outcome
- Smoking-status disease rate
- Physical-activity disease rate
- Resting ECG disease rate
- ST-slope disease rate
- Correlation heatmap
- Age-band disease rate
- Risk-factor accumulation

## 10. Conclusion
The analysis shows that heart disease outcomes are strongly differentiated by age and several clinical indicators, especially hypertension, diabetes, exercise angina, prior heart events and the accumulation of multiple risk factors. Lifestyle variables such as smoking and physical activity also show meaningful differences. From an analytics perspective, the most actionable approach is to combine demographic, clinical and lifestyle segmentation rather than relying on a single variable.

For a production predictive model, the next step should include train/test separation, leakage review, preprocessing, baseline logistic regression, tree-based models, ROC-AUC/PR-AUC, calibration, threshold analysis and model explainability. Clinical validation would be required before any real-world use.

