import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String logoCircleAsset = 'assets/images/fitrack-logocircle.svg';
final Widget logoCircle = SvgPicture.asset(
  logoCircleAsset,
  color: Colors.red,
  semanticsLabel: 'A red up arrow'
);