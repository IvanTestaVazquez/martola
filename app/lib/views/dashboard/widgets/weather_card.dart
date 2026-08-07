import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.temperature,
    required this.condition,
    required this.location,
  });

  final int temperature;
  final String condition;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.wb_sunny, 
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  location,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],),
            const SizedBox(height: 8),
            Text('$temperature °C', style: Theme.of(context).textTheme.headlineMedium),
            Text(condition),
          ],)
        )
    );
  }
}