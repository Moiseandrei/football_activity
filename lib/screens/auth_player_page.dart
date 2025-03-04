import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPlayerPage extends StatefulWidget {
  const AuthPlayerPage({super.key});

  @override
  _AuthPlayerPageState createState() => _AuthPlayerPageState();
}

class _AuthPlayerPageState extends State<AuthPlayerPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Autentificare reușită!")),
      );
      // Navighează la ecranul principal după autentificare
      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Eroare: ${e.toString()}")),
      );
    }
  }

  Future<void> _register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Înregistrare reușită!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Eroare la înregistrare: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Autentificare Jucător")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Parolă"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              child: const Text("Autentificare"),
            ),
            TextButton(
              onPressed: _register,
              child: const Text("Nu ai cont? Înregistrează-te"),
            ),
          ],
        ),
      ),
    );
  }
}
