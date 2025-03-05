import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editează Profilul")),
      body: Center(
        child: Text("Aici vei putea edita profilul tău."),
      ),
    );
  }
}
