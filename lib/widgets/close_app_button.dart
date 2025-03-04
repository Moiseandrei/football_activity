import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CloseAppButton extends StatelessWidget {
  const CloseAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          SystemNavigator.pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text("Închide App", style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
