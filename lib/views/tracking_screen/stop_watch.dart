import 'package:fitrack/components/circle_progress.dart';
import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  final DateTime startTime;
  final DateTime extraTime;
  final bool isRunning;

  const Clock(
      {Key key,
      @required this.startTime,
      @required this.extraTime,
      @required this.isRunning})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Stream<DateTime> clock;
    if (isRunning) {
      clock =
          Stream<DateTime>.periodic(const Duration(seconds: 1), (count) {
        return extraTime.add(Duration(seconds: count));
      });
    } else {
      clock = null;
    }
    return StreamBuilder<DateTime>(
      stream: clock,
      builder: (context, snapshot) {
        Duration timerValue;
        double indicatorValue;
        if (snapshot.hasData && isRunning) {
          timerValue = startTime.difference(snapshot.data).abs();
          indicatorValue = ((timerValue.inSeconds % 60) / (60)) * 100;
        } else {
          timerValue = const Duration();
          indicatorValue = 0.0;
        }
        

        return Center(
            child: CustomPaint(
              foregroundPainter: CircleProgress(indicatorValue, 8, 6, Theme.of(context).accentColor, Colors.grey),
              child: Container(
                width: 250,
                height: 250,
                child: Center(
                  child: Text(
                    "${(timerValue.inHours).toString().padLeft(2, '0')}:${(timerValue.inMinutes % 60).toString().padLeft(2, '0')}:${(timerValue.inSeconds % 60).toString().padLeft(2, '0')}",
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold),
                    textScaleFactor: 3.5,
                  ),
                ),
              ),
            ),
          );
      }, 
    );
  }
}
