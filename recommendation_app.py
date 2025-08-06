import streamlit as st
import tensorflow as tf
import pandas as pd
import numpy as np
from sklearn.preprocessing import MinMaxScaler

# Build Recommendation Model
class RecommendationModel(tf.keras.Model):
    def __init__(self, num_items, num_orgs, embedding_dim=50):
        super(RecommendationModel, self).__init__()
        self.item_embedding = tf.keras.layers.Embedding(num_items, embedding_dim)
        self.org_embedding = tf.keras.layers.Embedding(num_orgs, embedding_dim)
        self.dense1 = tf.keras.layers.Dense(128, activation='relu')
        self.dense2 = tf.keras.layers.Dense(64, activation='relu')
        self.output_layer = tf.keras.layers.Dense(1, activation='sigmoid')
    
    def call(self, inputs):
        item_vector = self.item_embedding(inputs['item_id'])
        org_vector = self.org_embedding(inputs['org_id'])
        combined = tf.concat([item_vector, org_vector], axis=-1)
        x = self.dense1(combined)
        x = self.dense2(x)
        return self.output_layer(x)

# Load and preprocess uploaded CSV
def preprocess_data(file):
    data = pd.read_csv(file)
    if 'item' not in data.columns or 'org' not in data.columns or 'quantity' not in data.columns:
        st.error("Uploaded CSV must contain 'item', 'org', and 'quantity' columns.")
        return None
    
    data['item_id'] = data['item'].astype("category").cat.codes
    data['org_id'] = data['org'].astype("category").cat.codes

    scaler = MinMaxScaler()
    data['quantity_normalized'] = scaler.fit_transform(data[['quantity']])
    return data

# Test recommendation function
def recommend_items(model, data, org_id, top_n=5):
    num_items = data['item_id'].nunique()
    org_vector = np.array([org_id] * num_items)
    item_vector = np.arange(num_items)
    predictions = model.predict({'item_id': item_vector, 'org_id': org_vector})
    top_items = np.argsort(-predictions.flatten())[:top_n]
    return data[data['item_id'].isin(top_items)]['item'].unique()

# Streamlit App
st.title("Product Recommendation System with Test File")

# Upload model test CSV
uploaded_file = st.file_uploader("Upload a CSV file to test the model", type=["csv"])

if uploaded_file:
    data = preprocess_data(uploaded_file)
    
    if data is not None:
        # Initialize model with the uploaded data
        num_items = data['item_id'].nunique()
        num_orgs = data['org_id'].nunique()
        model = RecommendationModel(num_items=num_items, num_orgs=num_orgs)
        
        # Compile the model (can load weights if pre-trained weights are available)
        model.compile(optimizer='adam', loss='mse', metrics=['mae'])
        st.success("Model initialized successfully!")
        
        # Select Organization ID and Top N recommendations
        org_id = st.selectbox("Select Organization ID", data['org_id'].unique())
        top_n = st.slider("Number of Recommendations", min_value=1, max_value=10, value=5)

        # Generate Recommendations
        if st.button("Recommend"):
            recommended_items = recommend_items(model, data, org_id, top_n)
            st.write("Recommended Items:")
            for item in recommended_items:
                st.write(f"- {item}")
