import 'package:flutter/material.dart';

class LigaButton extends StatelessWidget {
  final String liga;
  final VoidCallback onTap;
  const LigaButton({super.key, required this.liga, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton.icon(
        onPressed: onTap,
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
