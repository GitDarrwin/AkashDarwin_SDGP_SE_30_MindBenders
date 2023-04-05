# Serpientes Snake Detection Mobile Application (SDGP-SE-30-MindBenders)

Serpientes is a snake detection prototype that helps users detect venomous snakes using an AI-based image recognition model. The prototype is built using the Flutter framework for the frontend, Python Flask for the backend, and Firebase/Firestore for the database.

<h3>Technologies Used</h3>
  • Flutter<br>
  • Dart<br>
  • Firebase/Firestore<br>
  • InceptionV3 Image Processing Model<br>
  • Python Flask<br>
  • AWS EC2 Linux Server<br>

<h3>Features</h3>
The Serpientes prototype includes the following features:<br>
• Snake Detection - Users can upload an image of a snake to the app, which then runs it through the InceptionV3 image processing model to  determine whether it is a venomous snake or not.<br>
• Snake Safety Tips - The app provides users with tips on how to stay safe when encountering snakes.

<h3> Challenges </h3> 
During the implementation of the Serpientes prototype, we faced several challenges, including:<br>
Finding an accurate image processing model that could identify venomous snakes with a high level of accuracy.
Integrating the frontend with the backend using Python Flask.
Setting up the Firebase/Firestore database and ensuring that it could handle the volume of user data that we anticipated.

<h3>Solutions</h3>
To overcome these challenges, we took the following steps:<br>
We researched several image processing models and eventually settled on InceptionV3, which had a high level of accuracy in detecting venomous snakes.
We worked closely with the backend team to ensure that the frontend and backend were fully integrated and that data could be passed between the two without any issues.
We performed extensive load testing on the Firebase/Firestore database and optimized its performance to ensure that it could handle large volumes of user data.

<h3>Installation</h3>
To run the Serpientes prototype locally, follow these steps:
Clone the repository: git clone https://github.com/GitDarrwin/AkashDarwin_SDGP_SE_30_MindBenders.git
Install the required dependencies for the frontend and backend: flutter pub get and pip install -r requirements.txt
Configure the Firebase/Firestore database credentials in lib/services/firebase_service.dart
Run the backend server: python app.py
Run the frontend: flutter run

<h3/>Application Screen Shots</h3>

![Picsart_23-04-05_22-37-42-651](https://user-images.githubusercontent.com/90560618/230154436-b0a2264e-df99-4a75-86cb-4e68caa84f76.png)
![Picsart_23-04-05_22-40-07-988](https://user-images.githubusercontent.com/90560618/230154545-54599380-8427-4785-ae1d-3b5cf4797774.png)

<h3>Conclusion</h3>
The Serpientes snake detection prototype is a powerful tool for users who want to stay safe when encountering snakes. By leveraging AI-based image recognition, the app can accurately identify venomous snakes and provide users with useful tips on how to stay safe. With its sleek frontend, reliable backend, and robust database, the Serpientes prototype is a testament to the power of modern app development tools and techniques.
