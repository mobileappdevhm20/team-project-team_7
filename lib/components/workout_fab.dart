import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes/router.gr.dart';

class WorkoutFab extends StatelessWidget {
  const WorkoutFab();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {_onWorkoutButtonPressed(context);},
      tooltip: 'Start workout',
      elevation: 2.0,
      child: Icon(Icons.fitness_center),
    );
  }

  void _onWorkoutButtonPressed(BuildContext context) {
    ExtendedNavigator.of(context).pushNamed(Routes.trackingScreen);
  }
}
