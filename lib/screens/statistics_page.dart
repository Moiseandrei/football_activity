import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Statistici")),
      body: Center(
        child: Text("Aici vei putea vedea statisticile tale."),
      ),
    );
  }
}
