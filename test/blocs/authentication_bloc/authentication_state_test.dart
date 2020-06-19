import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Unitialized state test', () {
    final uninitialized = Uninitialized();
    expect(uninitialized.props, []);
  });

  test('Unauthenticated state test', () {
    final unauthenticated = Unauthenticated();
    expect(unauthenticated.props, []);
  });

  test('Authenticated state test', () {
    const displayname = "misterfit";
    const props = [displayname];
    const expectedString = 'Authenticated { displayName: $displayname }';
    const authenticated = Authenticated("misterfit");

    expect(authenticated.displayName, displayname);
    expect(authenticated.props, props);
    expect(authenticated.toString(), expectedString);
  });
}
