import 'package:fitrack/blocs/register_bloc/register_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RegisterState isFromValid test', () {
    const registerStateInvalid = RegisterState(
        isEmailValid: false,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isNameValid: true,
        isFailure: false);

    const registerStateValid = RegisterState(
        isEmailValid: true,
        isNameValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);

    expect(registerStateInvalid.isFormValid, false);
    expect(registerStateValid.isFormValid, true);
  });

  test('RegisterState toString test', () {
    const isEmailValid = false;
    const isPasswordValid = true;
    const isNameValid = true;
    const isSubmitting = true;
    const isSuccess = false;
    const isFailure = false;
    const registerState = RegisterState(
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
        isNameValid: isNameValid,
        isSubmitting: isSubmitting,
        isSuccess: isSuccess,
        isFailure: isFailure);

    const expectedString = '''
    RegisterState {
      isNameValid: $isNameValid,
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';

    expect(registerState.toString(), expectedString);
  });
}
