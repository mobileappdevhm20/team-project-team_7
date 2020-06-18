import 'package:flutter/material.dart';

class WorkoutFab extends StatelessWidget {
  const WorkoutFab();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onWorkoutButtonPressed,
      tooltip: 'Start workout',
      elevation: 2.0,
      child: Icon(Icons.fitness_center),
    );
  }

  void _onWorkoutButtonPressed() {
    //TODO REDIRECT TO WORKOUT
  }
}
