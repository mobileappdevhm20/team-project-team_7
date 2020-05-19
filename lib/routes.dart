import 'package:flutter/material.dart';
import 'package:fitrack/views/home/HomeView.dart';

RouteFactory getRoute() {
  return (settings) {
    //Get arguments to screen
    final Map<String, dynamic> arguments = settings.arguments;

    Widget screen;
    switch (settings.name) {
      case HomeView.ROUTE:
        screen = HomeView(title: "Test");
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
