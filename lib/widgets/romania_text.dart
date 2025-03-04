import 'package:flutter/material.dart';

class RomaniaText extends StatelessWidget {
  const RomaniaText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "ROMÂNIA",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue.shade700,
      ),
    );
  }
}
