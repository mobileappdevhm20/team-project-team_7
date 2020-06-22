import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class StartWorkout extends WorkoutEvent {

  const StartWorkout();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'StartWorkout';
}

class EndWorkout extends WorkoutEvent {

  const EndWorkout();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'EndWorkout';
}

class LocationEvent extends WorkoutEvent {
  final double longitude;
  final double latitude;

  const LocationEvent({
    @required this.longitude,
    @required this.latitude,
  });

  @override
  List<Object> get props => [longitude, latitude];

  @override
  String toString() => 'WorkoutLocationEvent: lat: $latitude, long: $longitude';
}

class ResetWorkout extends WorkoutEvent {

  const ResetWorkout();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ResetWorkout';
}
