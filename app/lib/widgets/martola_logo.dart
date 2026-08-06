import 'package:flutter/material.dart';

class MartolaLogo extends StatelessWidget {
  const MartolaLogo({
    super.key,
    this.showSubtitle = true,
  });

  final bool showSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.eco,
          size: 64,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 16),
        Text(
          'MARTOLA',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        if (showSubtitle) ...[
          const SizedBox(height: 16),
          Text(
            'Xestión intelixente de hortas e xardíns',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ],
    );
  }
}