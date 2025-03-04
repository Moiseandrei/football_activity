import 'package:flutter/material.dart';

class Liga5Screen extends StatelessWidget {
  const Liga5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liga 5")),
      body: const Center(
        child: Text("Bine ai venit în Liga 5!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
