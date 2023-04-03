from keras.models import load_model
from PIL import Image
from flask import Flask, request, jsonify
import numpy as np

# Load saved model
model = load_model('model.h5')


app = Flask(__name__)

# Define endpoint for receiving image
@app.route('/predict', methods=['POST'])
def predict():
    # Get image from POST request
    file = request.files['image']
    
    # Load image and convert to NumPy array
    img = Image.open(file)
    img = img.resize((224, 224))
    img_array = np.array(img)
    img_array = np.expand_dims(img_array, axis=0)
    img_array = img_array.astype('float32') / 255.

    # Make prediction
    prediction = model.predict(img_array)

    # Convert prediction to class label and confidence level
    predicted_class = np.argmax(prediction)
    confidence_level = np.max(prediction)
    print(confidence_level," ",predicted_class)

    # Return JSON response
    response = {'predicted_class': int(predicted_class), 'confidence_level': float(confidence_level)}
    return jsonify(response)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8501, debug=True)
