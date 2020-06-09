part of 'workout_db_bloc.dart';

abstract class WorkoutDBEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SaveWorkout extends WorkoutDBEvent {
  final Workout workout;

  SaveWorkout({
    @required this.workout
  });

  @override
  List<Object> get props => [workout];

  @override
  String toString() => 'SaveWorkout: : ${workout.toJson()}';
}

class DeleteWorkout extends WorkoutDBEvent {
  final int id;

  DeleteWorkout(this.id);
  
  @override
  List<Object> get props => [id];
}