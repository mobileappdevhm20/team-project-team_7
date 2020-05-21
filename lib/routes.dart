import 'package:flutter/material.dart';
import 'package:fitrack/views/home/home_view.dart';

RouteFactory getRoute() {
  return (settings) {
    //Get arguments to screen
    //final Map<String, dynamic> arguments =
    //    settings.arguments as Map<String, dynamic>;

    Widget screen;
    switch (settings.name) {
      case HomeView.route:
        screen = const HomeView(title: "Test");
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
