import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'statistics_page.dart';

class ProfileMenuPage extends StatelessWidget {
  final String userType; // "player" sau "team"

  const ProfileMenuPage({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meniu Profil - ${userType == "player" ? "Jucător" : "Echipă"}")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bine ai venit în meniul profilului!",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                );
              },
              child: const Text("Editează Profilul"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StatisticsPage()),
                );
              },
              child: const Text("Vezi Statistici"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/login");
              },
              child: const Text("Deconectare"),
            ),
          ],
        ),
      ),
    );
  }
}
