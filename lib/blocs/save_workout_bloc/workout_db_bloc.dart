import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitrack/models/work_out.dart';
import 'package:fitrack/repositories/workout_repository.dart';
import 'package:meta/meta.dart';

part 'workout_db_event.dart';
part 'workout_db_state.dart';

class WorkoutDBBloc extends Bloc<WorkoutDBEvent, WorkoutDBState> {
  final WorkoutRepository _workoutRepository;

  WorkoutDBBloc({@required WorkoutRepository workoutRepository})
      : assert(workoutRepository != null),
        _workoutRepository = workoutRepository,
        super(Uninitialized());

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
    yield Saving();
    try {
      await _workoutRepository.saveWorkout(event.workout);
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
