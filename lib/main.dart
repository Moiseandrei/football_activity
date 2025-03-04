import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:football_activity/providers/auth_provider.dart';
import 'package:football_activity/screens/home_page.dart';

void main() {
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
      home: const HomePage(),  // 🚀 Verifică să fie `HomePage()`
    );
  }
}
