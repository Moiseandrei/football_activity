import 'package:flutter/material.dart';
import '../screens/auth_team_page.dart';
import '../screens/auth_player_page.dart';
import '../screens/register_team_page.dart';
import '../screens/register_player_page.dart';

class LigaButton extends StatelessWidget {
  final String liga;
  final VoidCallback onTap; // Am adăugat onTap

  const LigaButton({super.key, required this.liga, required this.onTap});

  void _showAuthDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Opțiuni pentru $liga"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildButton(context, "Autentificare Echipa", const AuthTeamPage()),
              const SizedBox(height: 10),
              _buildButton(context, "Autentificare Jucător", const AuthPlayerPage()),
              const SizedBox(height: 20),
              _buildButton(context, "Înregistrare Echipa", const RegisterTeamPage()),
              const SizedBox(height: 10),
              _buildButton(context, "Înregistrare Jucător", const RegisterPlayerPage()),
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

  Widget _buildButton(BuildContext context, String text, Widget page) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton.icon(
        onPressed: onTap, // Am înlocuit _showAuthDialog cu onTap
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
