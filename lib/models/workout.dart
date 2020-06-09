class Workout {
  final double distance;
  final int durationInSeconds;
  final double avgSpeed;
  final double maxSpeed;


  Workout(
      this.distance,
      this.durationInSeconds,
      this.avgSpeed,
      this.maxSpeed,
      );

  Map<String, dynamic> toJson() => {
    'distance': distance,
    'durationInSeconds': durationInSeconds,
    'avgSpeed': avgSpeed,
    'maxSpeed': maxSpeed,
  };
}