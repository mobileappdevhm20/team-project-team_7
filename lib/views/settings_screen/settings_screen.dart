import 'package:fitrack/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FiTrackScaffold(
      screenTitle: "Settings",
      body: Center(
        child: Text('This is the settings page'),
      ),
    );
  }
}
