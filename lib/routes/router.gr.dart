// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fitrack/views/splash_screen/splash_screen.dart';
import 'package:fitrack/views/register_screen/register_screen.dart';
import 'package:fitrack/views/login_screen/login_screen.dart';
import 'package:fitrack/views/home_screen/home_screen.dart';
import 'package:fitrack/views/settings_screen/settings_screen.dart';

abstract class Routes {
  static const splashScreen = '/';
  static const registerScreen = '/register-screen';
  static const loginScreen = '/login-screen';
  static const homeScreen = '/home-screen';
  static const settingsScreen = '/settings-screen';
  static const all = {
    splashScreen,
    registerScreen,
    loginScreen,
    homeScreen,
    settingsScreen,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashScreen().wrappedRoute(context),
          settings: settings,
        );
      case Routes.registerScreen:
        if (hasInvalidArgs<RegisterScreenArguments>(args)) {
          return misTypedArgsRoute<RegisterScreenArguments>(args);
        }
        final typedArgs =
            args as RegisterScreenArguments ?? RegisterScreenArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RegisterScreen(key: typedArgs.key).wrappedRoute(context),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          transitionDuration: const Duration(milliseconds: 500),
        );
      case Routes.loginScreen:
        if (hasInvalidArgs<LoginScreenArguments>(args)) {
          return misTypedArgsRoute<LoginScreenArguments>(args);
        }
        final typedArgs =
            args as LoginScreenArguments ?? LoginScreenArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginScreen(key: typedArgs.key).wrappedRoute(context),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          transitionDuration: const Duration(milliseconds: 500),
        );
      case Routes.homeScreen:
        if (hasInvalidArgs<HomeScreenArguments>(args)) {
          return misTypedArgsRoute<HomeScreenArguments>(args);
        }
        final typedArgs = args as HomeScreenArguments ?? HomeScreenArguments();
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              HomeScreen(key: typedArgs.key),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          transitionDuration: const Duration(milliseconds: 500),
        );
      case Routes.settingsScreen:
        if (hasInvalidArgs<SettingsScreenArguments>(args)) {
          return misTypedArgsRoute<SettingsScreenArguments>(args);
        }
        final typedArgs =
            args as SettingsScreenArguments ?? SettingsScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SettingsScreen(key: typedArgs.key),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//RegisterScreen arguments holder class
class RegisterScreenArguments {
  final Key key;
  RegisterScreenArguments({this.key});
}

//LoginScreen arguments holder class
class LoginScreenArguments {
  final Key key;
  LoginScreenArguments({this.key});
}

//HomeScreen arguments holder class
class HomeScreenArguments {
  final Key key;
  HomeScreenArguments({this.key});
}

//SettingsScreen arguments holder class
class SettingsScreenArguments {
  final Key key;
  SettingsScreenArguments({this.key});
}
