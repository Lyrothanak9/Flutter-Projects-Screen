import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthButtonCircle extends StatefulWidget {
  final String? image;
  const AuthButtonCircle({super.key, this.image});

  @override
  State<AuthButtonCircle> createState() => _AuthButtonCircleState();
}

class _AuthButtonCircleState extends State<AuthButtonCircle> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {

      },
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        side: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 1),
        padding: const EdgeInsets.all(16.0),
      ),
      child: Image.network(
          widget.image!, scale: 3,
      ),
    );
  }
}
