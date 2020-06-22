import 'package:fitrack/blocs/login_bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LoginState isFormValid test', () {
    const loginStateInvalid = LoginState(
        isEmailValid: false,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);

    const loginStateValid = LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);

    expect(loginStateInvalid.isFormValid, false);
    expect(loginStateValid.isFormValid, true);
  });

  test('LoginState toString test', () {
    const isEmailValid = false;
    const isPasswordValid = true;
    const isSubmitting = true;
    const isSuccess = false;
    const isFailure = false;
    const loginStateInvalid = LoginState(
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
        isSubmitting: isSubmitting,
        isSuccess: isSuccess,
        isFailure: isFailure);

    const expectedString = '''
    LoginState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';

    expect(loginStateInvalid.toString(), expectedString);
  });
}
