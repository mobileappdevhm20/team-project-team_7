import 'package:fitrack/blocs/register_bloc/register_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('EmailChanged Event test', () {
    const newEmail = "thisismynewemail@mail.com";
    const props = [newEmail];
    const expectedString = 'EmailChanged { email: $newEmail }';

    const emailChangedEvent = EmailChanged(email: newEmail);
    expect(emailChangedEvent.email, newEmail);
    expect(emailChangedEvent.props, props);
    expect(emailChangedEvent.toString(), expectedString);
  });

  test('PasswordChanged Event test', () {
    const newPassword = "newpassword";
    const props = [newPassword];
    const expectedString = 'PasswordChanged { password: $newPassword }';

    const passwordChangedEvent = PasswordChanged(password: newPassword);
    expect(passwordChangedEvent.password, newPassword);
    expect(passwordChangedEvent.props, props);
    expect(passwordChangedEvent.toString(), expectedString);
  });

  test('NameChanged Event test', () {
    const newName = "mynameis";
    const props = [newName];
    const expectedString = 'NameChanged { name: $newName }';

    const nameChangedEvent = NameChanged(name: newName);
    expect(nameChangedEvent.name, newName);
    expect(nameChangedEvent.props, props);
    expect(nameChangedEvent.toString(), expectedString);
  });

  test('Submitted Event test', () {
    const email = "thisisyemail@hehe.com";
    const password = "1234";
    const name = "Donald Dumb";
    const props = [email, password, name];
    const expectedString =
        'Submitted { email: $email, password: $password, name: $name }';

    const submittedEvent =
        Submitted(email: email, password: password, name: name);

    expect(submittedEvent.email, email);
    expect(submittedEvent.name, name);
    expect(submittedEvent.password, password);
    expect(submittedEvent.props, props);
    expect(submittedEvent.toString(), expectedString);
  });
}
