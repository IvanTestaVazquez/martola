import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas pendentes'),
      ),
      body: const Center(
        child: Text('Lista de tarefas pendentes'),
      ),
    );
  }
}