import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:fitrack/blocs/save_workout_bloc/workout_db_bloc.dart';
import 'package:fitrack/blocs/workout_bloc/workout_bloc.dart';
import 'package:fitrack/blocs/workout_bloc/workout_event.dart';
import 'package:fitrack/blocs/workout_bloc/workout_state.dart';
import 'package:fitrack/components/red_button.dart';
import 'package:fitrack/models/Workout.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/repositories/workout_repository.dart';
import 'package:fitrack/routes/router.gr.dart';
import 'package:fitrack/views/tracking_screen/stop_watch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingSummaryScreen extends StatefulWidget {
  const TrackingSummaryScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TrackingSummaryScreenState createState() => _TrackingSummaryScreenState();
}

class _TrackingSummaryScreenState extends State<TrackingSummaryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: BlocBuilder<WorkoutBloc, WorkoutState>(
                builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Your Summary:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textScaleFactor: 2.5,
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Duration",
                          style: TextStyle(fontWeight: FontWeight.normal),
                          textScaleFactor: 1.7,
                        ),
                        Text(
                          (state.beginning.difference(state.end))
                              .abs()
                              .toString()
                              .replaceAll(RegExp(r'\.[0-9]*'), ''),
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          textScaleFactor: 2.5,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Distance",
                          style: TextStyle(fontWeight: FontWeight.normal),
                          textScaleFactor: 1.7,
                        ),
                        Text(
                          "${state.distance.toStringAsFixed(2)} km",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          textScaleFactor: 2.5,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Avg. Speed",
                          style: TextStyle(fontWeight: FontWeight.normal),
                          textScaleFactor: 1.7,
                        ),
                        Text(
                          "${state.avgSpeed.toStringAsFixed(2)} kmh",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          textScaleFactor: 2.5,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Max. Speed",
                          style: TextStyle(fontWeight: FontWeight.normal),
                          textScaleFactor: 1.7,
                        ),
                        Text(
                          "${state.maxSpeed.toStringAsFixed(2)} kmh",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          textScaleFactor: 2.5,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
          Center(
            child: Column(
              children: <Widget>[
                RedButton(
                  buttonText: "Save Workout",
                  onPressed: () {
                    final state = BlocProvider.of<WorkoutBloc>(context).state;
                    final Workout workout = Workout(
                        state.distance,
                        state.beginning.difference(state.end).abs().inSeconds,
                        state.avgSpeed,
                        state.maxSpeed);
                    BlocProvider.of<WorkoutDBBloc>(context)
                        .add(SaveWorkout(workout: workout));
                  },
                ),
                RedButton(
                  buttonText: "Continue without saving",
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text("Continue without saving"),
                              content: const Text(
                                  "Are you sure? Your Workout will not be saved if you continue!"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    ExtendedNavigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    ExtendedNavigator.of(context)
                                        .pushNamed(Routes.homeScreen);
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            ));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
