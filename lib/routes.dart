import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/views/login_screen/login_screen.dart';
import 'package:fitrack/views/register_screen/register_screen.dart';
import 'package:fitrack/views/splash_screen/splash_screen.dart';
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
      case SplashScreen.route:
        screen = SplashScreen();
        break;
      case LoginScreen.route:
        screen = LoginScreen();
        break;
      case RegisterScreen.route:
        screen = const RegisterScreen();
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
