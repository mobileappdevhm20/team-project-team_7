import 'dart:math';
import 'package:flutter/material.dart';

class CircleProgress extends CustomPainter{

  double currentProgress;
  double innerWidth;
  double outerWidth;
  Color outerColor;
  Color innerColor;

  CircleProgress(this.currentProgress, this.innerWidth, this.outerWidth, this.innerColor, this.outerColor);

  @override
  void paint(Canvas canvas, Size size) {

    //this is base circle
    final Paint outerCircle = Paint()
        ..strokeWidth = outerWidth
        ..color = outerColor
        ..style = PaintingStyle.stroke;

    final Paint completeArc = Paint()
      ..strokeWidth = innerWidth
      ..color = innerColor
      ..style = PaintingStyle.stroke
      ..strokeCap  = StrokeCap.round;

    final Offset center = Offset(size.width/2, size.height/2);
    final double radius = min(size.width/2,size.height/2) - 10;

    canvas.drawCircle(center, radius, outerCircle); // this draws main outer circle

    final double angle = 2 * pi * (currentProgress/100);

    canvas.drawArc(Rect.fromCircle(center: center,radius: radius), -pi/2, angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}