import 'package:flutter/material.dart';

import '../../models/garden.dart';

import 'garden_details_screen.dart';

import 'widgets/garden_list_item.dart';

class GardensScreen extends StatelessWidget {
  const GardensScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const List<Garden> gardens = [
      Garden(
        id: '1',
        name: 'Horta casa',
        location: 'Ourense',
        area: 40.0,
      ),
      Garden(
        id: '2',
        name: 'Horta aldea',
        location: 'Amoeiro',
        area: 800.0,
      ),
      Garden(
        id: '3',
        name: 'Horta Mexide',
        location: 'Mexide',
        area: 120.0,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('As miñas hortas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: gardens.length,
          itemBuilder: (context, index) {
            final garden = gardens[index];
            return GardenListItem(
              garden: garden,
              onTap: (garden) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GardenDetailsScreen(
                      garden: garden,
                    ),
                  ),
                );
              },
            );
          },
        )
      )
    );
  }
}