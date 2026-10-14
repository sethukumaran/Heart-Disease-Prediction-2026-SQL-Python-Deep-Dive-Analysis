import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("heart_disease_prediction_2026.csv")

# 1. EDA
print(df.shape)
print(df.info())
print(df.describe(include="all").T)
print("Missing:", df.isna().sum().sum())
print("Duplicates:", df.duplicated().sum())

# 2. Target distribution
print(df["heart_disease"].value_counts())
print(df["heart_disease"].value_counts(normalize=True) * 100)

# 3. Business / clinical segmentation
categorical = ["sex","region","income_level","smoking_status","alcohol_intake",
               "physical_activity","resting_ecg","st_slope"]
binary = ["diabetes","hypertension","family_history","previous_heart_event",
          "exercise_angina","fasting_blood_sugar"]

for col in categorical + binary:
    print("\n", col)
    print(df.groupby(col)["heart_disease"].agg(["count","mean"]).assign(rate_pct=lambda x:x["mean"]*100))

# 4. Age / BMI / BP / cholesterol bands
bands = {
    "age":[28,39,49,59,69,81],
    "bmi":[14,18.5,25,30,35,55],
    "resting_bp":[79,120,130,140,160,201],
    "cholesterol":[99,200,240,280,401]
}
for col, bins in bands.items():
    b = pd.cut(df[col], bins=bins, right=False)
    print("\n", col)
    print(df.groupby(b, observed=True)["heart_disease"].agg(["count","mean"]).assign(rate_pct=lambda x:x["mean"]*100))

# 5. Major clinical risk-factor accumulation
risk_cols = ["diabetes","hypertension","family_history","previous_heart_event","exercise_angina"]
df["major_risk_factor_count"] = df[risk_cols].sum(axis=1)
print(df.groupby("major_risk_factor_count")["heart_disease"].agg(["count","mean"]).assign(rate_pct=lambda x:x["mean"]*100))

# 6. Correlations
print(df.select_dtypes("number").corr()["heart_disease"].sort_values(ascending=False))
