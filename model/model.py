import pandas as pd
import numpy as np
import tensorflow as tf
from keras.preprocessing.image import ImageDataGenerator
from keras.applications.inception_v3 import InceptionV3
from keras.layers import Dense, GlobalAveragePooling2D
from keras.models import Model
from keras import regularizers
from keras.callbacks import EarlyStopping

# Load and preprocess data
train_df = pd.read_csv('dataset/Csv/train.csv')
test_df = pd.read_csv('dataset/Csv/test.csv')

train_datagen = ImageDataGenerator(rescale=1./255, shear_range=0.2, zoom_range=0.2, horizontal_flip=True, rotation_range=20, vertical_flip=True)
test_datagen = ImageDataGenerator(rescale=1./255, rotation_range=20, vertical_flip=True)

train_generator = train_datagen.flow_from_directory('dataset/train/', target_size=(224, 224), batch_size=32, class_mode='categorical')
test_generator = test_datagen.flow_from_directory('dataset/test/', target_size=(224, 224), batch_size=32, class_mode='categorical')

# Load pre-trained model
base_model = InceptionV3(weights='imagenet', include_top=False)

# Add custom layers
x = base_model.output
x = GlobalAveragePooling2D()(x)
x = Dense(1024, activation='relu', kernel_regularizer=regularizers.l2(0.01))(x)
x = Dense(1024, activation='relu', kernel_regularizer=regularizers.l2(0.01))(x)
predictions = Dense(135, activation='softmax')(x)

model = Model(inputs=base_model.input, outputs=predictions)

# Fine-tune pre-trained layers
for layer in model.layers[:249]:
    layer.trainable = False
for layer in model.layers[249:]:
    layer.trainable = True

# Adjust learning rate
adam = tf.keras.optimizers.Adam(learning_rate=0.0001)

# Compile model
model.compile(optimizer=adam, loss='categorical_crossentropy', metrics=['accuracy'])

# Early stopping
es = EarlyStopping(monitor='val_loss', mode='min', verbose=1, patience=5)

# Train model
history = model.fit(train_generator, epochs=50, validation_data=test_generator, callbacks=[es])

# Print accuracy
print('Final training accuracy:', history.history['accuracy'][-1])
print('Final validation accuracy:', history.history['val_accuracy'][-1])

#continue only the rest of the code Evaluate model on test data
test_loss, test_acc = model.evaluate(test_generator)
print('Test accuracy:', test_acc)

# Save model
model.save('model.h5')

# Plot training and validation accuracy
import matplotlib.pyplot as plt

acc = history.history['accuracy']
val_acc = history.history['val_accuracy']
loss = history.history['loss']
val_loss = history.history['val_loss']

epochs_range = range(len(acc))

plt.figure(figsize=(12, 8))
plt.subplot(2, 2, 1)
plt.plot(epochs_range, acc, label='Training Accuracy')
plt.plot(epochs_range, val_acc, label='Validation Accuracy')
plt.legend(loc='lower right')
plt.title('Training and Validation Accuracy')

plt.subplot(2, 2, 2)
plt.plot(epochs_range, loss, label='Training Loss')
plt.plot(epochs_range, val_loss, label='Validation Loss')
plt.legend(loc='upper right')
plt.title('Training and Validation Loss')
plt.show()