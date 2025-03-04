import 'package:flutter/material.dart';

class Liga4Screen extends StatelessWidget {
  const Liga4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liga 4")),
      body: const Center(
        child: Text("Bine ai venit în Liga 4!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
