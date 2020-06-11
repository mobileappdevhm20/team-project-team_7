import 'package:auto_route/auto_route.dart';
import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:fitrack/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            ExtendedNavigator.of(context)
                .pushReplacementNamed(Routes.splashScreen);
          }
        },
        child: this,
      );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is a demo home screen"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {ExtendedNavigator.of(context).pushNamed(Routes.trackingScreen);},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
