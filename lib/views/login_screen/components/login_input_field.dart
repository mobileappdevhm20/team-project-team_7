import 'package:fitrack/theme.dart';
import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final TextEditingController _controller;
  final String Function(String) _validator;
  final String _hintText;
  final bool _obscureText;
  final IconData _icon;

  const LoginField(
      {Key key,
      @required TextEditingController controller,
      String Function(String) validator, @required String hintText, bool obscureText, IconData icon})
      : _controller = controller,
        _validator = validator,
        _hintText = hintText,
        _obscureText = obscureText,
        _icon = icon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0x1F070707),
        prefixIcon: Icon(_icon, color: myTheme.canvasColor),
        hintText: _hintText,
        hintStyle: const TextStyle(color: Color(0xD8F1F1F1)),
      ),
      obscureText: _obscureText ?? false,
      autovalidate: true,
      autocorrect: false,
      validator: _validator,
    );
  }
}
