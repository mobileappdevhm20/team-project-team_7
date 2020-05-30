import 'package:fitrack/blocs/login_bloc/login_bloc.dart';
import 'package:fitrack/components/red_button.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/views/login_screen/login_screen.dart';
import 'package:fitrack/views/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  static const route = "/splash_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: RepositoryProvider.of<UserRepository>(context)),
        child: Center(
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
                  Navigator.of(context).pushNamed(LoginScreen.route);
                }),
            RedButton(
                buttonText: "Sign Up",
                onPressed: () {
                  Navigator.of(context).pushNamed(RegisterScreen.route);
                })
          ],
        )),
      ),
    );
  }
}
