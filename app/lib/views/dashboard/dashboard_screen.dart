import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/gardens_viewmodel.dart';
import '../../viewmodels/tasks_viewmodel.dart';
import '../../models/garden.dart';

import '../gardens/gardens_screen.dart';
import '../gardens/create_garden_screen.dart';
import '../tasks/tasks_screen.dart';
import '../tasks/create_task_screen.dart';

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
    
    final gardenCount = context.select<GardensViewModel, int>(
      (viewModel) => viewModel.gardens.length);
    final tasksCount = context.select<TasksViewModel, int>(
      (viewModel) => viewModel.pendingTasksCount);

    final gardenCard = GardenCard(
        gardenCount: gardenCount,
        onViewGardens: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const GardensScreen(),
            ),
          );
        },
      );

    final tasksCard = TasksCard(
        tasksCount: tasksCount,
        onViewTasks: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TasksScreen(),
            ),
          );
        },
      );

    final quickActionsCard = QuickActionsCard(
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
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel principal'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 800;

              if (!isWide) {
                return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [                
                              gardenCard,                              
                              const SizedBox(height: 16),
                              tasksCard,
                              const SizedBox(height: 16),
                              quickActionsCard,
                            ],
                          ),
                    );            
              }

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: gardenCard,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: tasksCard,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    quickActionsCard,
                  ],
                ),
              );
            },
          ),
        )
      )
    );
  }
}