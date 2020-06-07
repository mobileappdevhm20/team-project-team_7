import 'package:meta/meta.dart';

@immutable
class WorkoutState {
  final double distance;
  final double currentSpeed;
  final double avgSpeed;
  final double maxSpeed;
  final DateTime beginning;
  final DateTime end;
  final double latitude;
  final double longitude;

  const WorkoutState({
    @required this.distance,
    @required this.currentSpeed,
    @required this.avgSpeed,
    @required this.maxSpeed,
    @required this.beginning,
    @required this.end,
    @required this.latitude,
    @required this.longitude,
  });

  factory WorkoutState.empty() {
    return WorkoutState(
      distance: 0.0,
      currentSpeed: 0.0,
      avgSpeed: 0.0,
      maxSpeed: 0.0,
      beginning: DateTime.now(),
      end: null,
      latitude: 0.0,
      longitude: 0.0,
    );
  }

  WorkoutState update(
      {double distance,
      double currentSpeed,
      double avgSpeed,
      double maxSpeed,
      DateTime beginning,
      DateTime end,
      double latitude,
      double longitude}) {
    return copyWith(
      distance: distance,
      currentSpeed: currentSpeed,
      avgSpeed: avgSpeed,
      maxSpeed: maxSpeed,
      beginning: beginning,
      end: end,
      latitude: latitude,
      longitude: longitude,
    );
  }

  WorkoutState copyWith(
      {double distance,
      double currentSpeed,
      double avgSpeed,
      double maxSpeed,
      DateTime beginning,
      DateTime end,
      double latitude,
      double longitude}) {
    return WorkoutState(
      distance: distance ?? this.distance,
      currentSpeed: currentSpeed ?? this.currentSpeed,
      avgSpeed: avgSpeed ?? this.avgSpeed,
      maxSpeed: maxSpeed ?? this.maxSpeed,
      beginning: beginning ?? this.beginning,
      end: end ?? this.end,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  String toString() {
    return '''
    WorkoutState {
      distance: $distance,
      currentSpeed: $currentSpeed,
      avgSpeed: $avgSpeed,
      maxSpeed: $maxSpeed,
      beginning: $beginning,
      end: $end,
      latitude: $latitude,
      longitude: $longitude,
    }''';
  }
}

@immutable
class WorkoutErrorState extends WorkoutState {

  const WorkoutErrorState();

  @override
  String toString() => 'Authenticated { WorkoutErrorState }';
}
