import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'dashboard_page.dart';
import 'register_team_page.dart'; // Importă pagina de înregistrare a echipei

class AuthTeamPage extends StatefulWidget {
  const AuthTeamPage({super.key});

  @override
  _AuthTeamPageState createState() => _AuthTeamPageState();
}

class _AuthTeamPageState extends State<AuthTeamPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _login() async {
    User? user = await _authService.loginUser(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Autentificare eșuată! Verifică datele introduse.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Autentificare Echipă")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Parolă"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Autentificare"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterTeamPage()),
                );
              },
              child: const Text("Nu ai cont? Înregistrează-te"),
            ),
          ],
        ),
      ),
    );
  }
}
