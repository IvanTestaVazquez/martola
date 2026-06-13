import 'package:flutter/material.dart';
import 'views/home/home_screen.dart';

void main() {
  runApp(const MartolaApp());
}

class MartolaApp extends StatelessWidget {
  const MartolaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MARTOLA',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}