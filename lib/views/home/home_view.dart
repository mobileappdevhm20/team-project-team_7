import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/views/tracking_screen/tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  static const String route = "/";

  const HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.cancel), onPressed: () {
            RepositoryProvider.of<UserRepository>(context).signOut().then((_) => BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()));
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
        onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const TrackingView()));},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
