import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/gardens_viewmodel.dart';
import '../../viewmodels/weather_viewmodel.dart';
import '../../models/garden.dart';

import '../gardens/gardens_screen.dart';
import '../gardens/create_garden_screen.dart';
import '../tasks/tasks_screen.dart';
import '../tasks/create_task_screen.dart';

import '../../widgets/weather_card.dart';
import './widgets/garden_card.dart';
import './widgets/tasks_card.dart';
import './widgets/quick_actions_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState(); 
}

class _DashboardScreenState extends State<DashboardScreen>{

  @override
  void initState() {
    super.initState();

     
  }

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = context.watch<WeatherViewModel>();
    final weatherData = weatherViewModel.weatherData;

    final gardenCount = context.select<GardensViewModel, int>(
      (viewModel) => viewModel.gardens.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel principal'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (weatherViewModel.isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else if (weatherViewModel.errorMessage != null)
                  Text(
                    weatherViewModel.errorMessage!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                else if (weatherData != null)
                  WeatherCard(
                    temperature: weatherData.temperature,
                    condition: weatherData.description,
                    location: weatherData.city,
                  )
                else
                  Text(
                    'Non hai datos meteorolóxicos',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ,
                const SizedBox(height: 16),
                GardenCard(
                  gardenCount: gardenCount,
                  onViewGardens: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const GardensScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                TasksCard(
                  tasksCount: 2,
                  onViewTasks: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TasksScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                QuickActionsCard(
                  onAddTask: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreateTaskScreen(),
                      ),
                    );
                  },
                  onCreateGarden: () async {
                    await Navigator.of(context).push<Garden>(
                      MaterialPageRoute(
                        builder: (context) => const CreateGardenScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}