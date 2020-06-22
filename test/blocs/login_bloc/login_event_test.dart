import 'package:fitrack/blocs/login_bloc/login_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('EmailChanged test', () {
    const mail = "newemail@email.com";
    const props = [mail];
    const expectedString = "EmailChanged { email :$mail }";
    const emailChangedEvent = EmailChanged(email: mail);

    expect(emailChangedEvent.email, mail);
    expect(emailChangedEvent.props, props);
    expect(emailChangedEvent.toString(), expectedString);
  });

  test('PasswordChanged test', () {
    const password = "mynewpassword";
    const props = [password];
    const expectedString = "PasswordChanged { password: $password }";
    const passwordChangedEvent = PasswordChanged(password: password);

    expect(passwordChangedEvent.password, password);
    expect(passwordChangedEvent.props, props);
    expect(passwordChangedEvent.toString(), expectedString);
  });

  test('Submitted test', () {
    const password = "mypw";
    const email = "myemail@google.com";
    const props = [email, password];
    const expectedString = "Submitted { email: $email, password: $password }";

    const submittedEvent = Submitted(email: email, password: password);

    expect(submittedEvent.password, password);
    expect(submittedEvent.email, email);
    expect(submittedEvent.props, props);
    expect(submittedEvent.toString(), expectedString);
  });

  test('LoginWithCredentialsPressed test', () {
    const password = "mypw";
    const email = "myemail@google.com";
    const props = [email, password];
    const expectedString =
        "LoginWithCredentialsPressed { email: $email, password: $password }";

    const loginWithCredentialsPressedEvent =
        LoginWithCredentialsPressed(email: email, password: password);

    expect(loginWithCredentialsPressedEvent.password, password);
    expect(loginWithCredentialsPressedEvent.email, email);
    expect(loginWithCredentialsPressedEvent.props, props);
    expect(loginWithCredentialsPressedEvent.toString(), expectedString);
  });
}
