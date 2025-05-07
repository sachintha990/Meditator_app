import 'package:flutter/material.dart';

class CustomExercises extends StatelessWidget {
  const CustomExercises({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Custom Exercises Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
