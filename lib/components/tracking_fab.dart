import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/workout_bloc/bloc.dart';
import '../routes/router.gr.dart';

class TrackingFab extends StatelessWidget {
  const TrackingFab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
      if (state.isTracking) {
        Scaffold.of(context).hideCurrentSnackBar();
        return FloatingActionButton(
          onPressed: () {
            _finishWorkout(context);
          },
          tooltip: 'Finish workout',
          elevation: 2.0,
          child: Icon(Icons.stop),
        );
      } else if (state.isLoading) {
        return const FloatingActionButton(
          onPressed: null,
          tooltip: 'Waiting for Signal',
          elevation: 2.0,
          child: CircularProgressIndicator(backgroundColor: Colors.white,),
        );
      } else {
        return FloatingActionButton(
          onPressed: () {
            BlocProvider.of<WorkoutBloc>(context).add(const StartWorkout());
          },
          tooltip: 'Start workout',
          elevation: 2.0,
          child: Icon(Icons.play_arrow),
        );
      }
    });
  }

  void _finishWorkout(BuildContext context) {
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
                    ExtendedNavigator.of(context).pushNamedAndRemoveUntil(
                        Routes.trackingSummaryScreen,
                        (Route<dynamic> route) => false);
                  },
                  child: const Text('Yes'),
                ),
              ],
            ));
  }
}
