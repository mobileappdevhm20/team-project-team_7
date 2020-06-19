import 'package:fitrack/components/custom_scaffold.dart';
import 'package:fitrack/components/workout_fab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FiTrackScaffold(
      screenTitle: "Home",
      body: Center(
        child: Text('This is the home screen'),
      ),
      showBottomNavigationBar: true,
      fabButton: WorkoutFab(),
    );
  }
}
