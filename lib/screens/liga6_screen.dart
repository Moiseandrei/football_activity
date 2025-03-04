import 'package:flutter/material.dart';

class Liga6Screen extends StatelessWidget {
  const Liga6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liga 6")),
      body: const Center(
        child: Text("Bine ai venit în Liga 6!", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
