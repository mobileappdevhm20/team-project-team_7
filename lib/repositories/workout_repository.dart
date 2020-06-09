import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitrack/models/Workout.dart';

class WorkoutRepository {
  
  final Firestore _firestore;

  WorkoutRepository({Firestore firestore})
      : _firestore = firestore ?? Firestore.instance;

  Future<DocumentReference> saveWorkout(String uid, Workout workout) {
    return _firestore.collection("users").document(uid).collection("workouts").add(workout.toJson());
  }
}