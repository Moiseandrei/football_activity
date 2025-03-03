import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fotbal Ligii',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fundal imagine (teren fotbal)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Conținut principal
          Column(
            children: [
              const SizedBox(height: 80), // Ridică butoanele și textul

              // Butoane pentru ligi
              Column(
                children: [
                  LigaButton(liga: "Liga 4"),
                  const SizedBox(height: 50), // Spațiu mai mare între butoane
                  LigaButton(liga: "Liga 5"),
                  const SizedBox(height: 50),
                  LigaButton(liga: "Liga 6"),
                ],
              ),

              // Spațiu flexibil pentru mutarea ROMÂNIA mai sus
              const Spacer(),

              // Text "ROMÂNIA" în culorile drapelului (poziționat mai sus și mai mare)
              Padding(
                padding: const EdgeInsets.only(bottom: 100), // Ridicat mai sus
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("RO", style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.blue)),
                    Text("MÂ", style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.yellow)),
                    Text("NIA", style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ),
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
  const LigaButton({super.key, required this.liga});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, // Lățime mai mare pentru butoane
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LigaPage(liga: liga),
            ),
          );
        },
        icon: const Icon(Icons.sports_soccer, color: Colors.white),
        label: Text(
          liga,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

// Pagina pentru fiecare ligă
class LigaPage extends StatelessWidget {
  final String liga;
  const LigaPage({super.key, required this.liga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(liga),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          "Bine ai venit în $liga!",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
