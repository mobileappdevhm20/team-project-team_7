import 'dart:async';
import 'dart:math';
import 'package:background_location/background_location.dart';
import 'package:bloc/bloc.dart';
import 'package:fitrack/blocs/workout_bloc/workout_event.dart';
import 'package:fitrack/blocs/workout_bloc/workout_state.dart';

import 'bloc.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {

  WorkoutBloc() : super(WorkoutState.empty());

  @override
  Stream<WorkoutState> mapEventToState(WorkoutEvent event) async* {
    if (event is LocationEvent) {
      yield* _mapLocationEventToState(event.latitude, event.longitude);
    } else if (event is StartWorkout) {
      yield* _mapStartWorkoutToState();
    } else if (event is EndWorkout) {
      yield* _mapEndWorkoutToState();
    } else if (event is ResetWorkout) {
      yield* _mapResetWorkoutToState();
    }
  }

  Stream<WorkoutState> _mapStartWorkoutToState() async* {
    
    yield state.update(isLoading: true);

    var granted = false;
    await BackgroundLocation.getPermissions(
      onGranted: () {
        granted = true;
      },
      onDenied: () {
        granted = false;
      },
    );
    
    if (granted) {
      await BackgroundLocation.stopLocationService();
      await BackgroundLocation.startLocationService();
      final location = await BackgroundLocation().getCurrentLocation();

      yield state.update(
          beginning: DateTime.now(),
          end: DateTime.now(),
          latitude: location.latitude,
          longitude: location.longitude,
          avgSpeed: 0.0,
          currentSpeed: 0.0,
          distance: 0.0,
          maxSpeed: 0.0,
          error: false,
          isTracking: true,
          isLoading: false);
      BackgroundLocation.getLocationUpdates((location) {
        add(LocationEvent(
            latitude: location.latitude, longitude: location.longitude));
      });
    } else {
      yield state.update(error: true, isTracking: false, isLoading: false);
    }
    
  }

  Stream<WorkoutState> _mapLocationEventToState(
      double latitude, double longitude) async* {
    final now = DateTime.now();

    final double distance = distanceInMBetweenEarthCoordinates(
            state.latitude, state.longitude, latitude, longitude)
        .abs();
    final double newDistance = state.distance + distance;

    final double kmh =
        (newDistance / state.beginning.difference(now).inSeconds.abs()) * 3.6;

    // This is also in kmh
    double maxSpeed;
    final int msDifference = state.end.difference(now).inMilliseconds.abs();
    final double currentSpeed =
        ((distance / (msDifference / 1000)) * 3.6).abs();
    if (currentSpeed > state.maxSpeed) {
      maxSpeed = currentSpeed;
    } else {
      maxSpeed = state.maxSpeed;
    }

    yield state.update(
        end: now,
        latitude: latitude,
        longitude: longitude,
        distance: newDistance,
        avgSpeed: kmh,
        maxSpeed: maxSpeed,
        currentSpeed: currentSpeed);
  }

  Stream<WorkoutState> _mapEndWorkoutToState() async* {
    yield state.update(isTracking: false);
    BackgroundLocation.stopLocationService();
  }

  Stream<WorkoutState> _mapResetWorkoutToState() async* {
    yield WorkoutState.empty();
  }
}

double degreesToRadians(double degrees) {
  return degrees * pi / 180;
}

/// Taken from https://stackoverflow.com/a/365853 */
double distanceInMBetweenEarthCoordinates(
    double lat1, double lon1, double lat2, double lon2) {
  const int earthRadiusm = 6371000;

  final double dLat = degreesToRadians(lat2 - lat1);
  final double dLon = degreesToRadians(lon2 - lon1);

  final double latitude1 = degreesToRadians(lat1);
  final double latitude2 = degreesToRadians(lat2);

  final a = sin(dLat / 2) * sin(dLat / 2) +
      sin(dLon / 2) * sin(dLon / 2) * cos(latitude1) * cos(latitude2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return earthRadiusm * c;
}
