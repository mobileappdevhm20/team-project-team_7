import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitrack/repositories/workout_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PastWorkoutCard extends StatelessWidget {
  final Timestamp timestamp;
  final int durationInSeconds;
  final double avgSpeed;
  final double maxSpeed;
  final double distance;
  final String id;

  const PastWorkoutCard(
      {@required this.timestamp,
      @required this.durationInSeconds,
      @required this.avgSpeed,
      @required this.maxSpeed,
      @required this.distance,
      @required this.id});

  @override
  Widget build(BuildContext context) {
    DateTime start;
    final Duration duration = Duration(seconds: durationInSeconds ?? 0);
    if (timestamp != null) {
      start = timestamp.toDate();
    } else {
      start = DateTime(DateTime.now().year);
    }

    return Card(
        elevation: 1.0,
        shadowColor: Colors.greenAccent,
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(DateFormat('EEEE d.M.y, HH:mm').format(start), style: TextStyle(fontWeight: FontWeight.bold, wordSpacing: 5, letterSpacing: 1, color: Colors.grey[700]),),
                      ]),
                  const Padding(padding: EdgeInsets.all(1.8)),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("${(duration.inHours).toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}", style: TextStyle(fontWeight: FontWeight.w600 ,wordSpacing: 5, letterSpacing: 1, color: Theme.of(context).primaryColor), textScaleFactor: 1.5,)
                      ]),
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                  IconButton(icon: Icon(Icons.delete), color: Colors.red, onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: const Text("Delete Workout"),
                              content: const Text(
                                  "Are you sure you want to delete this Workout?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    ExtendedNavigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    RepositoryProvider.of<WorkoutRepository>(context).deleteWorkout(id);
                                    ExtendedNavigator.of(context).pop();
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            ));
                  },
                  )
                ],)
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                          Text("Distance", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[700]),),
                          Text("${(distance/1000).toStringAsFixed(2)} km", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[700]),),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                          Text("Average Speed", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[700]),),
                          Text("${avgSpeed.toStringAsFixed(2)} kmh", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[700]),),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                          Text("Max Speed", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey[700]),),
                          Text("${maxSpeed.toStringAsFixed(2)} kmh", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[700]),),
                    ],
                  ),
                  // Text("avgSpeed: ${avgSpeed.toStringAsFixed(2)} kmh", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[700]),),
                  // Text("maxSpeed: ${maxSpeed.toStringAsFixed(2)} kmh", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[700]),),
                ],
              )
            ],
          ),
        ),
    );
  }
}
