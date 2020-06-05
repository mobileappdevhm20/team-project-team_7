import 'package:auto_route/auto_route.dart';
import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:fitrack/components/red_button.dart';
import 'package:fitrack/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget implements AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is Authenticated) {
            ExtendedNavigator.of(context)
                .pushReplacementNamed(Routes.homeScreen);
          } else {
            ExtendedNavigator.of(context)
                .pushReplacementNamed(Routes.splashScreen);
          }
        },
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("WELCOME TO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(255, 255, 255, 1.0))),
                Text(
                  "FITRACK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 75,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(220, 50, 0, 1.0)),
                ),
                Text(
                  "GET FIT WITH FRIENDS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1.0)),
                ),
              ],
            ),
            Image.asset(
              'assets/images/png/fitrack-logocircle.png',
              height: 180,
            ),
            RedButton(
                buttonText: "Login",
                onPressed: () {
                  ExtendedNavigator.of(context).pushNamed(Routes.loginScreen);
                }),
            RedButton(
                buttonText: "Sign Up",
                onPressed: () {
                  ExtendedNavigator.of(context)
                      .pushNamed(Routes.registerScreen);
                })
          ],
        ),
      ),
    );
  }
}
