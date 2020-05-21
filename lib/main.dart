import 'package:flutter/material.dart';
import 'package:fitrack/routes.dart';
import 'package:fitrack/views/home/home_view.dart';
import 'package:fitrack/theme.dart';

void main() {
  runApp(FiTrackApp());
}

class FiTrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FiTrack',
      theme: getTheme(),
      initialRoute: HomeView.route,
      onGenerateRoute: getRoute(),
    );
  }
}
