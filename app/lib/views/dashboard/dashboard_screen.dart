import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('DashboardScreen construída');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel principal'),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            ],
          ),
        ),
      )
    );
  }
}