import 'package:app/repositories/garden_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/database_service.dart';
import 'repositories/sqlite_garden_repository.dart';

import 'viewmodels/gardens_viewmodel.dart';

import 'views/home/home_screen.dart';


void main() {
  final databaseService = DatabaseService();
  
  final gardenRepository = SQLiteGardenRepository(
    databaseService: databaseService,
  );
  
  runApp(
    MartolaApp(
      gardenRepository: gardenRepository,      
    ),
  );
}

class MartolaApp extends StatelessWidget {
  const MartolaApp({
    super.key,
    required this.gardenRepository,
    });

  final SQLiteGardenRepository gardenRepository;
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GardensViewModel(
        repository: gardenRepository,
      )..loadGardens(),
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