import 'package:fitrack/components/custom_scaffold.dart';
import 'package:fitrack/components/workout_fab.dart';
import 'package:fitrack/views/home_screen/components/quote.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FiTrackScaffold(
      screenTitle: "Home",
      body: Center(
        child: QuoteWidget(),
      ),
      showBottomNavigationBar: true,
      fabButton: WorkoutFab(),
    );
  }
}
