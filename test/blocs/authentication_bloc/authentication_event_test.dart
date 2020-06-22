import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppStarted test', () {
    final authEvent = AppStarted();
    expect(authEvent.props, []);
  });

  test('LoggedIn test', () {
    final loggedInEvent = LoggedIn();
    expect(loggedInEvent.props, []);
  });

  test('LoggedOut test', () {
    final loggedOutEvent = LoggedOut();
    expect(loggedOutEvent.props, []);
  });
}
