import 'package:flutter/material.dart';

import '../../models/garden.dart';

import '../gardens/gardens_screen.dart';
import '../gardens/create_garden_screen.dart';
import '../tasks/tasks_screen.dart';
import '../tasks/create_task_screen.dart';

import './widgets/weather_card.dart';
import './widgets/garden_card.dart';
import './widgets/tasks_card.dart';
import './widgets/quick_actions_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                WeatherCard(
                  temperature: 28,
                  condition: "Ceo despexado",
                  location: "Ourense",
                ),
                const SizedBox(height: 16),
                GardenCard(
                  gardenCount: 2,
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
                    final garden = await Navigator.of(context).push<Garden>(
                      MaterialPageRoute(
                        builder: (context) => const CreateGardenScreen(),
                      ),
                    );

                    debugPrint('Resultado: ${garden?.name}');
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