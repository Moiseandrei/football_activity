import 'package:flutter/material.dart';
import '../widgets/liga_button.dart';
import '../widgets/auth_button.dart';
import '../widgets/close_app_button.dart';
import '../widgets/romania_text.dart';
import 'auth_team_page.dart';
import 'auth_player_page.dart';
import 'register_team_page.dart';
import 'register_player_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void _showAuthDialog(BuildContext context, String liga) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Opțiuni pentru $liga"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthButton(
                text: "Autentificare Echipa",
                onTap: () {
                  Navigator.pop(context);
                  _navigate(context, const AuthTeamPage());
                },
              ),
              const SizedBox(height: 10),
              AuthButton(
                text: "Autentificare Jucător",
                onTap: () {
                  Navigator.pop(context);
                  _navigate(context, const AuthPlayerPage());
                },
              ),
              const SizedBox(height: 20),
              AuthButton(
                text: "Înregistrare Echipa",
                onTap: () {
                  Navigator.pop(context);
                  _navigate(context, const RegisterTeamPage());
                },
              ),
              const SizedBox(height: 10),
              AuthButton(
                text: "Înregistrare Jucător",
                onTap: () {
                  Navigator.pop(context);
                  _navigate(context, const RegisterPlayerPage());
                },
              ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 80),
              LigaButton(
                liga: "Liga 4",
                onTap: () => _showAuthDialog(context, "Liga 4"),
              ),
              const SizedBox(height: 30),
              LigaButton(
                liga: "Liga 5",
                onTap: () => _showAuthDialog(context, "Liga 5"),
              ),
              const SizedBox(height: 30),
              LigaButton(
                liga: "Liga 6",
                onTap: () => _showAuthDialog(context, "Liga 6"),
              ),
              const Spacer(),
              const RomaniaText(),
              const SizedBox(height: 20),
              const CloseAppButton(),
            ],
          ),
        ],
      ),
    );
  }
}
