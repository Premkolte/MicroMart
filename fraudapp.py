import streamlit as st
import pandas as pd
import numpy as np
import pickle
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report, accuracy_score
import re

# Load the pre-trained model
model_path = "fraud.pkl"
with open(model_path, "rb") as file:
    model = pickle.load(file)

st.title("Fraud Detection App")

# Upload CSV file
uploaded_file = st.file_uploader("Upload a CSV file for testing", type=["csv"])

if uploaded_file is not None:
    # Read uploaded file
    df = pd.read_csv(uploaded_file)

    # Data Preprocessing for Real-Time Testing
    # --- Step 2: Handle Missing Data
    df = df.dropna(subset=["EVENT_LABEL"])

    # --- Step 3: Label Encode Target Variable (Only for alignment; target won't be used)
    if "EVENT_LABEL" in df.columns:
        label_encoder = LabelEncoder()
        df["EVENT_LABEL"] = label_encoder.fit_transform(df["EVENT_LABEL"])

    # --- Step 4: Feature Engineering
    # Extract Features from EVENT_TIMESTAMP
    if "EVENT_TIMESTAMP" in df.columns:
        df["EVENT_TIMESTAMP"] = pd.to_datetime(df["EVENT_TIMESTAMP"], errors="coerce")
        df["hour"] = df["EVENT_TIMESTAMP"].dt.hour
        df["day_of_week"] = df["EVENT_TIMESTAMP"].dt.dayofweek
        df["is_weekend"] = df["day_of_week"].apply(lambda x: 1 if x >= 5 else 0)

    # Email Address Features
    if "email_address" in df.columns:
        df["email_domain"] = df["email_address"].apply(lambda x: x.split('@')[-1] if pd.notna(x) else "unknown")
        df["email_length"] = df["email_address"].apply(len)

    # User Agent Features
    if "user_agent" in df.columns:
        df["is_mobile"] = df["user_agent"].apply(lambda x: 1 if "Mobile" in str(x) else 0)
        df["is_old_browser"] = df["user_agent"].apply(lambda x: 1 if re.search(r"Windows NT 5|Windows 98", str(x)) else 0)

    # Phone Number Features
    if "phone_number" in df.columns:
        df["phone_valid"] = df["phone_number"].apply(lambda x: 1 if re.match(r"^\(\d{3}\)\d{3}-\d{4}$", str(x)) else 0)

    # IP Address Features
    if "ip_address" in df.columns:
        df["ip_first_octet"] = df["ip_address"].apply(lambda x: int(x.split('.')[0]) if pd.notna(x) and '.' in x else np.nan)

    # Billing Address Features
    if "billing_address" in df.columns:
        df["address_length"] = df["billing_address"].apply(len)

    # Drop raw columns
    df = df.drop([ 
        "EVENT_TIMESTAMP",
        "user_agent",
        "email_address",
        "ip_address",
        "billing_address",
        "phone_number",
        "phone_valid"
    ], axis=1, errors="ignore")

    # One-Hot Encode Categorical Columns
    categorical_columns = ["email_domain", "billing_state"]
    for col in categorical_columns:
        if col in df.columns:
            df = pd.get_dummies(df, columns=[col], drop_first=True)

    # Ensure alignment with trained model features
    model_features = model.feature_names_in_
    missing_cols = [col for col in model_features if col not in df.columns]
    for col in missing_cols:
        df[col] = 0

    # Keep only the features used in the model
    df = df[model_features]

    # Perform Predictions
    predictions = model.predict(df)
    prediction_probs = model.predict_proba(df)[:, 1]  # Get probability of being fraud (class 1)

    # Add predictions to dataframe
    df["Predicted_LABEL"] = ["Fraud" if pred == 1 else "Non-Fraud" for pred in predictions]
    df["Prediction_Probability"] = prediction_probs

    # Display Prediction Results
    st.subheader("Prediction Results")
    st.write(df.head())

    # Show Evaluation Metrics (if true labels are available in uploaded data)
    if "EVENT_LABEL" in df.columns:
        accuracy = accuracy_score(df["EVENT_LABEL"], predictions)
        st.write(f"**Accuracy:** {accuracy:.2f}")
        st.write("**Classification Report:**")
        st.text(classification_report(df["EVENT_LABEL"], predictions))

    # Allow user to download results
    st.download_button(
        label="Download Prediction Results",
        data=df.to_csv(index=False).encode('utf-8'),
        file_name="prediction_results.csv",
        mime="text/csv"
    )
