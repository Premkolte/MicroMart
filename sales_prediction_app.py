import streamlit as st
import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import r2_score
from sklearn.model_selection import train_test_split

# Function to load and preprocess the data
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
    df['lag_2'] = df['quantity'].shift(2)

    # Drop rows with NaN values after feature engineering
    df = df.dropna()

    # Features and target variable
    X = df[['item', 'month', 'lag_1', 'lag_2']]
    y = df['quantity']
    X = pd.get_dummies(X, columns=['item', 'month'])

    return X, y, df

# Streamlit app
st.title("Sales Prediction with Random Forest")
st.write("Upload your sales data CSV to test the model.")

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

        # Calculate R² score
        r2 = r2_score(y_test, y_pred)

        # Display results
        st.write("### Model Performance:")
        st.write(f"R² Score: {r2:.2f}")

        # Allow user to test with custom inputs
        st.write("### Predict on New Data")
        item = st.selectbox("Select Item", options=df['item'].unique())
        month = st.slider("Select Month", 1, 12, 1)
        lag_1 = st.number_input("Enter Lag 1 Value", min_value=0.0)
        lag_2 = st.number_input("Enter Lag 2 Value", min_value=0.0)

        # Prepare the input data
        input_data = pd.DataFrame({
            'item': [item],
            'month': [month],
            'lag_1': [lag_1],
            'lag_2': [lag_2]
        })
        input_data = pd.get_dummies(input_data, columns=['item', 'month'])
        input_data = input_data.reindex(columns=X.columns, fill_value=0)

        # Make prediction
        prediction = model.predict(input_data)
        st.write(f"Predicted Quantity: {prediction[0]:.2f}")

    except Exception as e:
        st.error(f"Error processing file: {e}")
