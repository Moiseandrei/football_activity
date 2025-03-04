import 'package:flutter/material.dart';

class RomaniaText extends StatelessWidget {
  const RomaniaText({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [Colors.blue, Colors.yellow, Colors.red],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds);
      },
      child: Text(
        "ROMÂNIA",
        style: const TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Trebuie să fie alb pentru ShaderMask
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
