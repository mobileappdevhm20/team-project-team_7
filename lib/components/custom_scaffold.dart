import 'package:fitrack/components/bottom_navigation.dart';
import 'package:flutter/material.dart';

class FiTrackScaffold extends StatelessWidget {
  const FiTrackScaffold(
      {@required this.screenTitle,
      @required this.body,
      this.showBottomNavigationBar = false,
      this.fabButton});

  final String screenTitle;
  final Widget body;
  final Widget fabButton;
  final bool showBottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screenTitle,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevation: 4.0,
      ),
      backgroundColor: Colors.white,
      body: body,
      bottomNavigationBar:
          showBottomNavigationBar ? FiTrackBottomAppBar() : null,
      floatingActionButton: fabButton,
      floatingActionButtonLocation: showBottomNavigationBar
          ? FloatingActionButtonLocation.endDocked
          : FloatingActionButtonLocation.endFloat,
    );
  }
}
