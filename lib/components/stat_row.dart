import 'package:flutter/material.dart';

class StatRow extends StatelessWidget {
  final String _leftText;
  final String _rightText;

  const StatRow(
      {Key key, @required String leftText, @required String rightText})
      : _leftText = leftText,
        _rightText = rightText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          _leftText,
          style: TextStyle(fontWeight: FontWeight.normal),
          textScaleFactor: 1.7,
        ),
        Text(
          _rightText,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
          textScaleFactor: 2.5,
        ),
      ],
    );
  }
}
