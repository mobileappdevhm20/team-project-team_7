import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitrack/models/Workout.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/repositories/workout_repository.dart';
import 'package:meta/meta.dart';

part 'workout_db_event.dart';
part 'workout_db_state.dart';

class WorkoutDBBloc
    extends Bloc<WorkoutDBEvent, WorkoutDBState> {
  final UserRepository _userRepository;
  final WorkoutRepository _workoutRepository;

  WorkoutDBBloc({@required UserRepository userRepository, @required WorkoutRepository workoutRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        _workoutRepository = workoutRepository;

  @override
  WorkoutDBState get initialState => Uninitialized();

  @override
  Stream<WorkoutDBState> mapEventToState(
    WorkoutDBEvent event,
  ) async* {
    if (event is SaveWorkout) {
      yield* _mapSaveWorkoutToState(event);
    } else if (event is DeleteWorkout) {
      yield* _mapDeleteWorkoutToState();
    } 
  }

  Stream<WorkoutDBState> _mapSaveWorkoutToState(SaveWorkout event) async* {
    final uid = await _userRepository.getCurrentUID();
    try {
      await _workoutRepository.saveWorkout(uid, event.workout);
      yield Success();
    } catch (_) {
      yield const Error("Could not save workout");
    }
  }

  Stream<WorkoutDBState> _mapDeleteWorkoutToState() async* {
    //final uid = await _userRepository.getCurrentUID();
    yield Success();
  }

  
}
