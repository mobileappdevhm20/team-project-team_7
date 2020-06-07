import 'dart:developer';
import 'package:background_location/background_location.dart';
import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:fitrack/blocs/workout_bloc/workout_bloc.dart';
import 'package:fitrack/blocs/workout_bloc/workout_event.dart';
import 'package:fitrack/blocs/workout_bloc/workout_state.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/repositories/workout_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingView extends StatefulWidget {
  const TrackingView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TrackingViewState createState() => _TrackingViewState();
}

class _TrackingViewState extends State<TrackingView> {
  double meters = 0;
  double time = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                          .add(LoggedOut());
                })
          ],
        ),
        body: BlocListener<WorkoutBloc, WorkoutState>(
          listener: (context, state) {
            log(state.toString());
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '0',
                  style: Theme.of(context).textTheme.headline4,
                ),
                RaisedButton(
                    onPressed: () {
                      BlocProvider.of<WorkoutBloc>(context)
                          .add(const StartWorkout());
                    },
                    child: Text("Start Location Service")),
                RaisedButton(
                    onPressed: () {
                      BlocProvider.of<WorkoutBloc>(context)
                          .add(const EndWorkout());
                    },
                    child: Text("Stop Location Service")),
                const RaisedButton(
                    onPressed: null, child: Text("Get Current Location")),
              ],
            ),
          ),
        ),
    );
  }
}
