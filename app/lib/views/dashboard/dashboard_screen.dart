import 'package:flutter/material.dart';
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
                  },
                ),
                const SizedBox(height: 16),
                TasksCard(
                  tasksCount: 2,
                  onViewTasks: () {
                  },
                ),
                const SizedBox(height: 16),
                QuickActionsCard(
                  onAddTask: () {
                  },
                  onCreateGarden: () {
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