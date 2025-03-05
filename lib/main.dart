import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // 🔥 Inițializează Firebase
import 'package:football_activity/screens/auth_player_page.dart';
import 'package:football_activity/screens/auth_team_page.dart';
import 'package:football_activity/screens/edit_profile_page.dart';
import 'package:football_activity/screens/profile_menu_page.dart';
import 'package:football_activity/screens/statistics_page.dart';
import 'package:provider/provider.dart';
import 'package:football_activity/providers/auth_provider.dart';
import 'package:football_activity/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 🔄 Asigură inițializarea corectă
  await Firebase.initializeApp(); // 🚀 Inițializează Firebase

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Football Activity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 📌 Verifică autentificarea și redirecționează către pagina corectă
      home: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return authProvider.isAuthenticated
              ? const ProfileMenuPage(userType: "player") // 🔀 Dacă e autentificat, du-l la meniu
              : const HomePage(); // 🔀 Altfel, du-l la pagina principală
        },
      ),
      routes: {
        "/auth_player": (context) => const AuthPlayerPage(),
        "/auth_team": (context) => const AuthTeamPage(),
        "/profile_menu": (context) => const ProfileMenuPage(userType: "player"),
        "/edit_profile": (context) => const EditProfilePage(),
        "/view_statistics": (context) => const StatisticsPage(),
      },
    );
  }
}
