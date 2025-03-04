import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Înregistrare utilizator
  Future<User?> registerUser(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Salvăm utilizatorul în Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
      });

      return userCredential.user;
    } catch (e) {
      print("Eroare la înregistrare: $e");
      return null;
    }
  }

  // Autentificare utilizator
  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Eroare la autentificare: $e");
      return null;
    }
  }

  // Deconectare utilizator
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
