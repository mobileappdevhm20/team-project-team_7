class Workout {
  final double distance;
  final int durationInSeconds;
  final double avgSpeed;
  final double maxSpeed;
  final DateTime date;

  Workout(
      this.distance,
      this.durationInSeconds,
      this.avgSpeed,
      this.maxSpeed,
      this.date
      );

  Map<String, dynamic> toJson() => {
    'distance': distance,
    'durationInSeconds': durationInSeconds,
    'avgSpeed': avgSpeed,
    'maxSpeed': maxSpeed,
    'date': date,
  };
}