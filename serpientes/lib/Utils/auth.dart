import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  //creating new instance of firebase aluth

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    //you can also store the user in Database
  }

  Future<void> resetpassword(String email) async {
    await _auth.sendPasswordResetEmail(
      email: email,
    );
    //you can also store the user in Database
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
