import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/database_service.dart';
import 'services/weather_service.dart';
import 'services/geocoding_service.dart';

import 'repositories/garden_repository.dart';
import 'repositories/garden_plant_repository.dart';
import 'repositories/plant_species_repository.dart';
import 'repositories/plant_evolution_record_repository.dart';
import 'repositories/garden_layout_repository.dart';
import 'repositories/task_repository.dart';

import 'repositories/sqlite/sqlite_garden_repository.dart';
import 'repositories/sqlite/sqlite_garden_plant_repository.dart';
import 'repositories/sqlite/sqlite_plant_species_repository.dart';
import 'repositories/sqlite/sqlite_plant_evolution_record_repository.dart';
import 'repositories/sqlite/sqlite_garden_layout_repository.dart';
import 'repositories/sqlite/sqlite_task_repository.dart';

import 'repositories/weather_repository.dart';
import 'repositories/open_weather/open_weather_repository.dart';

import 'repositories/geocoding_repository.dart';
import 'repositories/open_weather/open_weather_geocoding_repository.dart';

import 'viewmodels/gardens_viewmodel.dart';
import 'viewmodels/plant_species_viewmodel.dart';
import 'viewmodels/plants_viewmodel.dart';
import 'viewmodels/plant_evolution_viewmodel.dart';
import 'viewmodels/weather_viewmodel.dart';
import 'viewmodels/geocoding_viewmodel.dart';
import 'viewmodels/garden_layout_viewmodel.dart';
import 'viewmodels/tasks_viewmodel.dart';

import 'views/home/home_screen.dart';


Future<void> main() async {
   const apiKey = String.fromEnvironment(
    'OPENWEATHER_API_KEY',
  );

  final weatherService = WeatherService(
    apiKey: apiKey,
  );
  final geocodingService = GeocodingService(
    apiKey: apiKey,
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
  final gardenLayoutRepository = SQLiteGardenLayoutRepository(
    databaseService: databaseService
  );
  final taskRepository = SQLiteTaskRepository(
    databaseService: databaseService
  );
  final weatherRepository = OpenWeatherRepository(
    weatherService: weatherService,
  );
  final geocodingRepository = OpenWeatherGeocodingRepository(
    geocodingService: geocodingService,
  );
  
  
  runApp(
    MartolaApp(
      gardenRepository: gardenRepository,
      plantSpeciesRepository: plantSpeciesRepository,
      gardenPlantRepository: gardenPlantRepository,
      plantEvolutionRecordRepository: plantEvolutionRecordRepository,
      weatherRepository: weatherRepository,
      geocodingRepository: geocodingRepository,
      gardenLayoutRepository: gardenLayoutRepository,
      taskRepository: taskRepository,
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
    required this.geocodingRepository,
    required this.gardenLayoutRepository,
    required this.taskRepository,
  });

  final GardenRepository gardenRepository;
  final PlantSpeciesRepository plantSpeciesRepository;
  final GardenPlantRepository gardenPlantRepository;
  final PlantEvolutionRecordRepository plantEvolutionRecordRepository;
  final GardenLayoutRepository gardenLayoutRepository;
  final TaskRepository taskRepository;

  final WeatherRepository weatherRepository;
  final GeocodingRepository geocodingRepository;

  
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
          create: (context) => GardenLayoutViewModel(
          gardenLayoutRepository: gardenLayoutRepository,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => TasksViewModel(
          repository: taskRepository,
          )..loadTasks(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherViewModel(
          weatherRepository: weatherRepository,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => GeocodingViewModel(
          geocodingRepository: geocodingRepository,
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