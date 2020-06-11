part of 'workout_db_bloc.dart';

abstract class WorkoutDBState extends Equatable {
  const WorkoutDBState();

  @override
  List<Object> get props => [];
}
class Uninitialized extends WorkoutDBState {}

class Success extends WorkoutDBState {}

class Error extends WorkoutDBState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}

class Saving extends WorkoutDBState {}