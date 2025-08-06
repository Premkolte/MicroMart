import streamlit as st
import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import r2_score, mean_squared_error
from sklearn.model_selection import train_test_split

# Function to preprocess the uploaded data
def preprocess_data(file):
    # Load the dataset
    df = pd.read_csv(file)

    # Parse the 'date' column into datetime format
    df['date'] = pd.to_datetime(df['date'], format='%d-%m-%Y')

    # Extract time-based features
    df['year'] = df['date'].dt.year
    df['month'] = df['date'].dt.month
    df['day'] = df['date'].dt.day

    # Create lag features (e.g., sales from previous months)
    df['lag_1'] = df['quantity'].shift(1)
    df['lag_3'] = df['quantity'].shift(3)

    # Drop rows with NaN values after feature engineering
    df = df.dropna()

    # Features and target variable
    X = df[['year', 'month', 'day', 'lag_1', 'lag_3']]
    y = df['quantity']

    return X, y, df

# Loan eligibility prediction based on sales prediction (Mocked)
def predict_loan_eligibility(sales_prediction):
    # Simple eligibility rule: if predicted sales > 1000, eligible for loan
    if sales_prediction > 1000:
        return "Eligible for Loan"
    else:
        return "Not Eligible for Loan"

# Streamlit app
st.title("Sales Prediction with Loan Eligibility")
st.write("Upload your sales data CSV to test the model and check loan eligibility.")

# File uploader
uploaded_file = st.file_uploader("Upload CSV file", type=["csv"])

if uploaded_file is not None:
    try:
        # Preprocess the uploaded file
        X, y, df = preprocess_data(uploaded_file)

        # Display data info
        st.write("### Data Preview:")
        st.write(df.head())

        # Train-Test split
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

        # Train the model
        model = RandomForestRegressor(n_estimators=100, random_state=42)
        model.fit(X_train, y_train)

        # Make predictions
        y_pred = model.predict(X_test)

        # Calculate R² score and MSE
        r2 = r2_score(y_test, y_pred)
        mse = mean_squared_error(y_test, y_pred)

        # Display results
        st.write("### Model Performance:")
        st.write(f"R² Score: {r2:.2f}")
    

        # Allow user to test with custom inputs
        st.write("### Predict on New Data")
        year = st.number_input("Enter Year", min_value=int(df['year'].min()), max_value=int(df['year'].max()), value=int(df['year'].min()))
        month = st.slider("Select Month", 1, 12, 1)
        day = st.slider("Select Day", 1, 31, 1)
        lag_1 = st.number_input("Enter Lag 1 Value", min_value=0.0)
        lag_3 = st.number_input("Enter Lag 3 Value", min_value=0.0)

        # Prepare the input data for prediction
        input_data = pd.DataFrame({
            'year': [year],
            'month': [month],
            'day': [day],
            'lag_1': [lag_1],
            'lag_3': [lag_3]
        })

        # Make sales prediction
        sales_prediction = model.predict(input_data)
        st.write(f"Predicted Sales Quantity: {sales_prediction[0]:.2f}")

        # Predict loan eligibility based on sales prediction
        loan_eligibility = predict_loan_eligibility(sales_prediction[0])
        st.write(f"Loan Eligibility: {loan_eligibility}")

    except Exception as e:
        st.error(f"Error processing file: {e}")
