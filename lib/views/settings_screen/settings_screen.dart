import 'package:auto_route/auto_route.dart';
import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:fitrack/components/custom_scaffold.dart';
import 'package:fitrack/components/red_button.dart';
import 'package:fitrack/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FiTrackScaffold(
      screenTitle: "Settings",
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is Authenticated) {
                ExtendedNavigator.of(context)
                    .pushReplacementNamed(Routes.homeScreen);
              } else {
                ExtendedNavigator.of(context)
                    .pushReplacementNamed(Routes.splashScreen);
              }
            },
            child: RedButton(
              buttonText: "Logout",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to log out?"),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          ExtendedNavigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      FlatButton(
                        onPressed: () {
                          final auth =
                              BlocProvider.of<AuthenticationBloc>(context);
                          auth.add(LoggedOut());
                        },
                        child: const Text('Log out'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
