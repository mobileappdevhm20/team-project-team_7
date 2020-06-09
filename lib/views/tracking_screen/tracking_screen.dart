import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:fitrack/blocs/workout_bloc/workout_bloc.dart';
import 'package:fitrack/blocs/workout_bloc/workout_event.dart';
import 'package:fitrack/blocs/workout_bloc/workout_state.dart';
import 'package:fitrack/components/red_button.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/repositories/workout_repository.dart';
import 'package:fitrack/routes/router.gr.dart';
import 'package:fitrack/views/tracking_screen/stop_watch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tracking"),
      ),
      body: BlocListener<WorkoutBloc, WorkoutState>(
        listener: (context, state) {
          if (state.error) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Couldnt get GPS Permissions'),
                      Icon(Icons.error)
                    ],
                  ),
                  backgroundColor: Colors.red,
                ),
              );
          } else {
            log(state.toString());
          }
        },
        child: ListView(
          children: <Widget>[
            Center(child: 
            BlocBuilder<WorkoutBloc, WorkoutState>(
              builder: (context, state) {
                DateTime startTime;
                if (state.isTracking) {
                  startTime = state.beginning;
                } else {
                  startTime = DateTime.now();
                }
                return Clock(startTime: startTime, extraTime: DateTime.now(), isRunning: state.isTracking,);
               },),),
            Center(
              child: BlocBuilder<WorkoutBloc, WorkoutState>(
                  builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[Text("Stats:", style: TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 2.5,)],
                      ),
                      Divider(thickness: 1.0, height: 1.0, color: Theme.of(context).primaryColor,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text("Distance", style: TextStyle(fontWeight: FontWeight.normal), textScaleFactor: 1.7,),
                            Text("${state.distance.toStringAsFixed(2)} km", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold), textScaleFactor: 2.5,),                 
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text("Speed", style: TextStyle(fontWeight: FontWeight.normal), textScaleFactor: 1.7,),
                            Text("${state.currentSpeed.toStringAsFixed(2)} kmh", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold), textScaleFactor: 2.5,),                 
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text("Avg. Speed", style: TextStyle(fontWeight: FontWeight.normal), textScaleFactor: 1.7,),
                            Text("${state.avgSpeed.toStringAsFixed(2)} kmh", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold), textScaleFactor: 2.5,),                 
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text("Max. Speed", style: TextStyle(fontWeight: FontWeight.normal), textScaleFactor: 1.7,),
                            Text("${state.maxSpeed.toStringAsFixed(2)} kmh", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold), textScaleFactor: 2.5,),                 
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),
            Center(child: BlocBuilder<WorkoutBloc, WorkoutState>(
                builder: (context, state) {
              if (state.isTracking) {
                Scaffold.of(context).hideCurrentSnackBar();
                return RedButton(
                  buttonText: "Finish Workout",
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text("Finish your Workout?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    ExtendedNavigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    BlocProvider.of<WorkoutBloc>(context)
                                        .add(const EndWorkout());
                                    ExtendedNavigator.of(context).pushNamed(Routes.trackingSummaryScreen);
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            ));
                  },
                );
              } else if (state.isLoading) {
                return const CircularProgressIndicator();
              } else {
                return RedButton(
                  buttonText: "Start Workout",
                  onPressed: () {
                    BlocProvider.of<WorkoutBloc>(context)
                        .add(const StartWorkout());
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 999999),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Starting GPS '),
                              const CircularProgressIndicator()
                            ],
                          ),
                        ),
                      );
                  },
                );
              }
            })),
          ],
        ),
      ),
    );
  }
}
