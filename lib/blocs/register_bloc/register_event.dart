import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends RegisterEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class NameChanged extends RegisterEvent {
  final String name;

  const NameChanged({@required this.name});

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'PasswordChanged { password: $name }';
}

class Submitted extends RegisterEvent {
  final String email;
  final String password;
  final String name;

  const Submitted({
    @required this.email,
    @required this.password,
    @required this.name,
  });

  @override
  List<Object> get props => [email, password, name];

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password, name: $name }';
  }
}
