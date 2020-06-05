import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:fitrack/views/splash_screen/splash_screen.dart';
import 'package:fitrack/views/register_screen/register_screen.dart';
import 'package:fitrack/views/login_screen/login_screen.dart';
import 'package:fitrack/views/home_screen/home_screen.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  SplashScreen splashScreen;

  @CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500)
  RegisterScreen registerScreen;

  @CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500)
  LoginScreen loginScreen;

  @CustomRoute(
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 500)
  HomeScreen homeScreen;
}
