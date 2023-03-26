import numpy as np
from keras.models import load_model
from keras.utils import load_img, img_to_array

# Load saved model
model = load_model('my_model2_two_inception3withbigaugmentation.h5')

# Load and preprocess image
img = load_img('Green_pit_viper.jpeg', target_size=(224, 224))
img_array = img_to_array(img)
img_array = np.expand_dims(img_array, axis=0)
img_array /= 255.

# Make prediction
prediction = model.predict(img_array)

# Print predicted class and confidence level
predicted_class = np.argmax(prediction)
confidence_level = np.max(prediction)
print('Predicted class:', predicted_class)
print('Confidence level:', confidence_level)
