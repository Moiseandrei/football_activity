import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football Activity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _showAuthDialog(BuildContext context, String liga) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Opțiuni pentru $liga"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthButton(text: "Autentificare Echipa", onTap: () => _navigate(context, const AuthTeamPage())),
              const SizedBox(height: 10),
              AuthButton(text: "Autentificare Jucător", onTap: () => _navigate(context, const AuthPlayerPage())),
              const SizedBox(height: 20),
              AuthButton(text: "Înregistrare Echipa", onTap: () => _navigate(context, const RegisterTeamPage())),
              const SizedBox(height: 10),
              AuthButton(text: "Înregistrare Jucător", onTap: () => _navigate(context, const RegisterPlayerPage())),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Închide"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  void _navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/background.png"), fit: BoxFit.cover),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 80),
              LigaButton(liga: "Liga 4", onTap: () => _showAuthDialog(context, "Liga 4")),
              const SizedBox(height: 30),
              LigaButton(liga: "Liga 5", onTap: () => _showAuthDialog(context, "Liga 5")),
              const SizedBox(height: 30),
              LigaButton(liga: "Liga 6", onTap: () => _showAuthDialog(context, "Liga 6")),
              const Spacer(),
              const RomaniaText(),
              const SizedBox(height: 20),
              const CloseAppButton(), // Buton de închidere
            ],
          ),
        ],
      ),
    );
  }
}

// Widget pentru butoanele ligilor
class LigaButton extends StatelessWidget {
  final String liga;
  final VoidCallback onTap;
  const LigaButton({super.key, required this.liga, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: const Icon(Icons.sports_soccer, color: Colors.white),
        label: Text(liga, style: const TextStyle(color: Colors.white, fontSize: 20)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

// Widget pentru butoanele de autentificare și înregistrare
class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const AuthButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}

// Widget pentru textul ROMÂNIA
class RomaniaText extends StatelessWidget {
  const RomaniaText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("RO", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.blue)),
          Text("MÂ", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.yellow)),
          Text("NIA", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.red)),
        ],
      ),
    );
  }
}

// Widget pentru butonul de închidere a aplicației
class CloseAppButton extends StatelessWidget {
  const CloseAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40), // Ridică butonul mai sus
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
          onPressed: () {
            SystemNavigator.pop(); // Închide aplicația
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text("Închide App", style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}

// Pagini pentru autentificare și înregistrare
class AuthPage extends StatelessWidget {
  final String title;
  const AuthPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.green),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(decoration: const InputDecoration(labelText: "Email")),
                  const SizedBox(height: 10),
                  TextField(decoration: const InputDecoration(labelText: "Parolă"), obscureText: true),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$title realizată cu succes!")));
                    },
                    child: const Text("Autentificare"),
                  ),
                ],
              ),
            ),
          ),
          const CloseAppButton(), // Buton de închidere în toate paginile
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class RegisterPage extends AuthPage {
  const RegisterPage({super.key, required String title}) : super(title: title);
}

class AuthTeamPage extends AuthPage {
  const AuthTeamPage() : super(title: "Autentificare Echipa");
}

class AuthPlayerPage extends AuthPage {
  const AuthPlayerPage() : super(title: "Autentificare Jucător");
}

class RegisterTeamPage extends RegisterPage {
  const RegisterTeamPage() : super(title: "Înregistrare Echipa");
}

class RegisterPlayerPage extends RegisterPage {
  const RegisterPlayerPage() : super(title: "Înregistrare Jucător");
}
