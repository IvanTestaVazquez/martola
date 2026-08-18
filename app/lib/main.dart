import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/database_service.dart';
import 'repositories/sqlite_garden_repository.dart';
import 'repositories/sqlite_garden_plant_repository.dart';
import 'repositories/sqlite_plant_species_repository.dart';
import 'repositories/sqlite_plant_evolution_record_repository.dart';

import 'services/weather_service.dart';
import 'repositories/open_weather_repository.dart';

import 'viewmodels/gardens_viewmodel.dart';
import 'viewmodels/plant_species_viewmodel.dart';
import 'viewmodels/plants_viewmodel.dart';
import 'viewmodels/plant_evolution_viewmodel.dart';
import 'viewmodels/weather_viewmodel.dart';

import 'views/home/home_screen.dart';


Future<void> main() async {
   const apiKey = String.fromEnvironment(
    'OPENWEATHER_API_KEY',
  );

  final databaseService = DatabaseService();
  
  final gardenRepository = SQLiteGardenRepository(
    databaseService: databaseService,
  );

  final plantSpeciesRepository =
      SQLitePlantSpeciesRepository(
    databaseService: databaseService,
  );

  final gardenPlantRepository =
      SQLiteGardenPlantRepository(
    databaseService: databaseService,
  );

  final plantEvolutionRecordRepository =
      SQLitePlantEvolutionRecordRepository(
    databaseService: databaseService,
  );

  final weatherService = WeatherService(
    apiKey: apiKey,
  );

  final weatherRepository = OpenWeatherRepository(
    weatherService: weatherService,
  );
  
  runApp(
    MartolaApp(
      gardenRepository: gardenRepository,
      plantSpeciesRepository: plantSpeciesRepository,
      gardenPlantRepository: gardenPlantRepository,
      plantEvolutionRecordRepository: plantEvolutionRecordRepository,
      weatherRepository: weatherRepository,
    ),
  );
}

class MartolaApp extends StatelessWidget {
  const MartolaApp({
    super.key,
    required this.gardenRepository,
    required this.gardenPlantRepository,
    required this.plantSpeciesRepository,
    required this.plantEvolutionRecordRepository,
    required this.weatherRepository,
    });

  final SQLiteGardenRepository gardenRepository;
  final SQLitePlantSpeciesRepository plantSpeciesRepository;
  final SQLiteGardenPlantRepository gardenPlantRepository;
  final SQLitePlantEvolutionRecordRepository plantEvolutionRecordRepository;
  
  final OpenWeatherRepository weatherRepository;

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GardensViewModel(
          repository: gardenRepository,
          )..loadGardens(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlantSpeciesViewModel(
          plantSpeciesRepository: plantSpeciesRepository,
          )..loadSpecies(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlantsViewModel(
          gardenPlantRepository: gardenPlantRepository,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => PlantEvolutionViewModel(
          plantEvolutionRecordRepository: plantEvolutionRecordRepository,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherViewModel(
          weatherRepository: weatherRepository,
          ),
        ),
      ]
      ,
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