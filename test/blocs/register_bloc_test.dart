import 'package:bloc_test/bloc_test.dart';
import 'package:fitrack/blocs/register_bloc/bloc.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import '../MockClasses/mock_user_repository.dart';

void main() {
  // // Create a mock instance
  // group('Test email and passowrd changed validators', () {

  //   RegisterBloc registerBloc;
  //   UserRepository userRepository;

  //   setUp(() {
  //     userRepository = MockUserRepository();
  //     registerBloc = RegisterBloc(userRepository: userRepository);
  //   });

  // blocTest(
  //   'emits [] when nothing is added',
  //   build: () async => registerBloc,
  //   expect: [],
  // );

  // blocTest(
  //   'valid email',
  //   build: () async => registerBloc,
  //   act: (bloc) async => bloc.add(const EmailChanged(email: "test@hm.edu")),
  //   expect: [isA<RegisterState>().having((source) => source.isEmailValid, "email should be valid", true)],
  // );

  // blocTest(
  //   'not valid email',
  //   build: () async => registerBloc,
  //   act: (bloc) async => bloc.add(const EmailChanged(email: "error")),
  //   expect: [isA<RegisterState>().having((source) => source.isEmailValid, "email should not be valid", false)],
  // );

  // blocTest(
  //   'valid password',
  //   build: () async => registerBloc,
  //   act: (bloc) async =>  bloc.add(const PasswordChanged(password: "Test1234")),
  //   expect: [isA<RegisterState>().having((source) => source.isPasswordValid, "password should be valid", true)],
  // );

  // blocTest(
  //   'not valid password',
  //   build: () async => registerBloc,
  //   act: (bloc) async =>  bloc.add(const PasswordChanged(password: "Test12")),
  //   expect: [isA<RegisterState>().having((source) => source.isPasswordValid, "password should not be valid", false)],
  // );

  // blocTest(
  //   'not valid name',
  //   build: () async => registerBloc,
  //   act: (bloc) async =>  bloc.add(const NameChanged(name: "12")),
  //   expect: [isA<RegisterState>().having((source) => source.isNameValid, "name should not be valid", false)],
  // );

  // blocTest(
  //   'valid name',
  //   build: () async => registerBloc,
  //   act: (bloc) async =>  bloc.add(const NameChanged(name: "123")),
  //   expect: [isA<RegisterState>().having((source) => source.isNameValid, "name should be valid", true)],
  // );

  // });

  // group('Test Register', () {

  //   RegisterBloc registerBloc;
  //   UserRepository userRepository;

  //   setUp(() {
  //     userRepository = MockUserRepository();
  //     registerBloc = RegisterBloc(userRepository: userRepository);
  //   });

  // blocTest(
  //   'valid email',
  //   build: () async => registerBloc,
  //   act: (bloc) async =>  bloc.add(const EmailChanged(email: "test@hm.edu")),
  //   expect: [isA<RegisterState>().having((source) => source.isEmailValid, "email should be valid", true)],
  // );

  // blocTest(
  //   'valid password',
  //   build: () async => registerBloc,
  //   act: (bloc) async =>  bloc.add(const PasswordChanged(password: "Test1234")),
  //   expect: [isA<RegisterState>().having((source) => source.isPasswordValid, "password should be valid", true)],
  // );

  // blocTest(
  //   'valid name',
  //   build: () async => registerBloc,
  //   act: (bloc) async =>  bloc.add(const NameChanged(name: "Testname")),
  //   expect: [isA<RegisterState>().having((source) => source.isNameValid, "name should be valid", true)],
  // );

  // blocTest(
  //   'Login failure',
  //   build: () async => registerBloc,
  //   act: (bloc) async =>  bloc.add(const Submitted(email: "test@hm.error", password: "error", name: "Testname")),
  //   expect: [isA<RegisterState>().having((source) => source.isSubmitting, "submitting", true) , isA<RegisterState>().having((source) => source.isFailure, "should be failure", true)],
  // );

  // blocTest(
  //   'Login',
  //   build: () async => registerBloc,
  //   act: (bloc) async =>  bloc.add(const Submitted(email: "test@hm.edu", password: "Test1234", name: "Testname")),
  //   expect: [isA<RegisterState>().having((source) => source.isSubmitting, "submitting", true) , isA<RegisterState>().having((source) => source.isSuccess, "should be successfull", true)],
  // );
  // });
}
