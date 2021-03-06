import 'dart:ui';

import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final String _buttonText;

  const RedButton(
      {Key key, VoidCallback onPressed, @required String buttonText})
      : _onPressed = onPressed,
        _buttonText = buttonText,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 120,
      height: 40,
      textTheme: ButtonTextTheme.primary,
      child: RaisedButton(
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: _onPressed,
        child: Text(_buttonText.toUpperCase(), 
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2
          ),),
      ),
    );
  }
}
