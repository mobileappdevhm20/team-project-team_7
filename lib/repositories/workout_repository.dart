import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitrack/models/work_out.dart';

class WorkoutRepository {
  
  final Firestore _firestore;
  final FirebaseAuth _firebaseAuth;


  WorkoutRepository({Firestore firestore, FirebaseAuth firebaseAuth})
      : _firestore = firestore ?? Firestore.instance,
      _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<DocumentReference> saveWorkout(Workout workout) {
    return _firebaseAuth.currentUser().then((value) => _firestore.collection("users").document(value.uid).collection("workouts").add(workout.toJson()));
  }

  Future<void> deleteWorkout(String id) {
    return _firebaseAuth.currentUser().then((value) => _firestore.collection("users").document(value.uid).collection("workouts").document(id).delete());
  }

  Stream<QuerySnapshot> getWorkoutStream(String uid) {
    return  _firestore.collection("users").document(uid).collection("workouts").snapshots();
    // map((snapshot) {
    //   return snapshot.documents
    //       .map((doc) => Workout(doc.data['distance'] as double, doc.data['durationInSeconds'] as int, doc.data['avgSpeed'] as double, doc.data['maxSpeed'] as double))
    //       .toList();
    // });
  }

  Future<void> updateWorkout(String uid, String id, Workout update) {
    return _firebaseAuth.currentUser().then((value) => _firestore.collection("users").document(value.uid).collection("workouts").document(id).updateData(update.toJson()));
  }
}