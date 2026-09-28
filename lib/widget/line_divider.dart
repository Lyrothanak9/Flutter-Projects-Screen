import 'package:flutter/material.dart';

class lineDivider extends StatelessWidget {
  const lineDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          // Left divider line
          Expanded(
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
              endIndent: 12, // Space between the line and the "Or" text
            ),
          ),

          // Center text
          Text(
            'Or',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[400],
            ),
          ),

          // Right divider line
          Expanded(
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
              indent: 12, // Space between the "Or" text and the line
            ),
          ),
        ],
    );
  }
}