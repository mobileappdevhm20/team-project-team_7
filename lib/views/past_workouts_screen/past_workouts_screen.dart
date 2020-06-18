import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitrack/components/custom_scaffold.dart';
import 'package:fitrack/components/past_workout_card.dart';
import 'package:fitrack/components/workout_fab.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/repositories/workout_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PastWorkoutsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FiTrackScaffold(
      screenTitle: "Past Workouts",
      showBottomNavigationBar: true,
      fabButton: const WorkoutFab(),
      body: FutureBuilder(
        future: RepositoryProvider.of<UserRepository>(context).getCurrentUID(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder<QuerySnapshot>(
              stream: RepositoryProvider.of<WorkoutRepository>(context)
                  .getWorkoutStream(snapshot.data as String),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot2) {
                if (snapshot2.hasError) {
                  return Text('Error: ${snapshot2.error}');
                }
                switch (snapshot2.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator(),);
                  default:
                    return ListView(
                      children: snapshot2.data.documents
                          .map((DocumentSnapshot document) {
                        return PastWorkoutCard(timestamp: document['date'] as Timestamp, durationInSeconds: document['durationInSeconds'] as int, 
                        avgSpeed: document['avgSpeed'] as double, maxSpeed: document['maxSpeed'] as double, distance: document['distance'] as double, id: document.documentID,);
                      }).toList()..sort((a,b) => b.timestamp.compareTo(a.timestamp))
                    );
                }
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
