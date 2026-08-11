import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/gardens_viewmodel.dart';

import 'views/home/home_screen.dart';

void main() {
  runApp(const MartolaApp());
}

class MartolaApp extends StatelessWidget {
  const MartolaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GardensViewModel(),
      child: MaterialApp(
        title: 'MARTOLA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
          ),
        ),
        home: const HomeScreen(),
      )
    );
  }
}