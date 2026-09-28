
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String? title;
  final String? route;
  const Button({super.key, required this.title, this.route});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, widget.route!);
          },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size.fromHeight(50),
        ),
        child: Text(
          widget.title!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
    );
  }
}
