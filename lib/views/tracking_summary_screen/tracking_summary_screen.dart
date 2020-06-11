import 'package:auto_route/auto_route.dart';
import 'package:fitrack/blocs/save_workout_bloc/workout_db_bloc.dart';
import 'package:fitrack/blocs/workout_bloc/workout_bloc.dart';
import 'package:fitrack/blocs/workout_bloc/workout_state.dart';
import 'package:fitrack/components/red_button.dart';
import 'package:fitrack/components/stat_row.dart';
import 'package:fitrack/models/work_out.dart';
import 'package:fitrack/routes/router.gr.dart';
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
    return  
    Scaffold (
      appBar: AppBar(
        title: const Text("Summary"),
      ),
      body: BlocListener<WorkoutDBBloc, WorkoutDBState>(
        listener: (context, state) {
          if (state is Error) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(state.message.toString()), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state is Saving) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Saving Workout...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state is Success) {
          ExtendedNavigator.of(context)
              .pushReplacementNamed(Routes.pastWorkoutsScreen);
        }
        },
        child:      
      ListView(
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
                    StatRow(
                      leftText: "Duration",
                      rightText: state.beginning.difference(state.end)
                              .abs()
                              .toString()
                              .replaceAll(RegExp(r'\.[0-9]*'), ''),
                    ),
                    StatRow(
                      leftText: "Distance",
                      rightText: "${state.distance.toStringAsFixed(2)} km"
                    ),
                    StatRow(
                      leftText: "Avg. Speed",
                      rightText: "${state.avgSpeed.toStringAsFixed(2)} kmh"
                    ),
                    StatRow(
                      leftText: "Max. Speed",
                      rightText: "${state.maxSpeed.toStringAsFixed(2)} kmh"
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
                        state.maxSpeed,
                        state.beginning);
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
      ),
    );
  }
}
