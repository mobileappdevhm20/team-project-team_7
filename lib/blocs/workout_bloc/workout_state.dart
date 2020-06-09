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
  final bool error;
  final bool isTracking;
  final bool isLoading;

  const WorkoutState({
    @required this.distance,
    @required this.currentSpeed,
    @required this.avgSpeed,
    @required this.maxSpeed,
    @required this.beginning,
    @required this.end,
    @required this.latitude,
    @required this.longitude,
    @required this.error,
    @required this.isTracking,
    @required this.isLoading,
  });

  factory WorkoutState.empty() {
    return WorkoutState(
      distance: 0.0,
      currentSpeed: 0.0,
      avgSpeed: 0.0,
      maxSpeed: 0.0,
      beginning: DateTime.now(),
      end: DateTime.now(),
      latitude: 0.0,
      longitude: 0.0,
      error: false,
      isTracking: false,
      isLoading: false,
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
      double longitude,
      bool error,
      bool isTracking,
      bool isLoading}) {
    return copyWith(
      distance: distance,
      currentSpeed: currentSpeed,
      avgSpeed: avgSpeed,
      maxSpeed: maxSpeed,
      beginning: beginning,
      end: end,
      latitude: latitude,
      longitude: longitude,
      error: error,
      isTracking: isTracking,
      isLoading: isLoading
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
      double longitude,
      bool error,
      bool isTracking,
      bool isLoading}) {
    return WorkoutState(
      distance: distance ?? this.distance,
      currentSpeed: currentSpeed ?? this.currentSpeed,
      avgSpeed: avgSpeed ?? this.avgSpeed,
      maxSpeed: maxSpeed ?? this.maxSpeed,
      beginning: beginning ?? this.beginning,
      end: end ?? this.end,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      error: error ?? this.error,
      isTracking: isTracking ?? this.isTracking,
      isLoading: isLoading ?? this.isLoading
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
      error: $error,
      isTracking: $isTracking,
      isLoading: $isLoading
    }''';
  }
}