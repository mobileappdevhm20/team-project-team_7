import 'package:bloc_test/bloc_test.dart';
import 'package:fitrack/blocs/login_bloc/bloc.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import '../MockClasses/mock_user_repository.dart';

void main() {
  // Create a mock instance
  // group('Test email and passowrd changed validators', () {
  //   LoginBloc loginBloc;
  //   UserRepository userRepository;

  //   setUp(() {
  //     userRepository = MockUserRepository();
  //     loginBloc = LoginBloc(userRepository: userRepository);
  //   });

  //   blocTest(
  //     'emits [] when nothing is added',
  //     build: () async => loginBloc,
  //     expect: [],
  //   );

  //   blocTest(
  //     'valid email',
  //     build: () async => loginBloc,
  //     act: (bloc) async => bloc.add(const EmailChanged(email: "test@hm.edu")),
  //     expect: [
  //       isA<LoginState>().having(
  //           (source) => source.isEmailValid, "email should be valid", true)
  //     ],
  //   );

  //   blocTest(
  //     'not valid email',
  //     build: () async => loginBloc,
  //     act: (bloc) async => bloc.add(const EmailChanged(email: "error")),
  //     expect: [
  //       isA<LoginState>().having(
  //           (source) => source.isEmailValid, "email should not be valid", false)
  //     ],
  //   );

  //   blocTest(
  //     'valid password',
  //     build: () async => loginBloc,
  //     act: (bloc) async =>
  //         bloc.add(const PasswordChanged(password: "Test1234")),
  //     expect: [
  //       isA<LoginState>().having((source) => source.isPasswordValid,
  //           "password should be valid", true)
  //     ],
  //   );

  //   blocTest(
  //     'not valid password',
  //     build: () async => loginBloc,
  //     act: (bloc) async => bloc.add(const PasswordChanged(password: "Test12")),
  //     expect: [
  //       isA<LoginState>().having((source) => source.isPasswordValid,
  //           "password should not be valid", false)
  //     ],
  //   );
  // });

  // group('Test Login', () {
  //   LoginBloc loginBloc;
  //   UserRepository userRepository;

  //   setUp(() async {
  //     userRepository = MockUserRepository();
  //     await userRepository.signUp(email: "test@hm.edu", password: "Test1234");
  //     //await userRepository.setUserName("Test");
  //     loginBloc = LoginBloc(userRepository: userRepository);
  //   });

  //   blocTest(
  //     'valid email',
  //     build: () async => loginBloc,
  //     act: (bloc) async => bloc.add(const EmailChanged(email: "test@hm.edu")),
  //     expect: [
  //       isA<LoginState>().having(
  //           (source) => source.isEmailValid, "email should be valid", true)
  //     ],
  //   );

  //   blocTest(
  //     'valid password',
  //     build: () async => loginBloc,
  //     act: (bloc) async =>
  //         bloc.add(const PasswordChanged(password: "Test1234")),
  //     expect: [
  //       isA<LoginState>().having((source) => source.isPasswordValid,
  //           "password should be valid", true)
  //     ],
  //   );

  //   blocTest(
  //     'Login failure',
  //     build: () async => loginBloc,
  //     act: (bloc) async => bloc.add(const LoginWithCredentialsPressed(
  //         email: "test@hm.error", password: "Test1234")),
  //     expect: [
  //       isA<LoginState>()
  //           .having((source) => source.isSubmitting, "submitting", true),
  //       isA<LoginState>()
  //           .having((source) => source.isFailure, "should be failure", true)
  //     ],
  //   );

  //   blocTest(
  //     'Login',
  //     build: () async => loginBloc,
  //     act: (bloc) async => bloc.add(const LoginWithCredentialsPressed(
  //         email: "test@hm.edu", password: "Test1234")),
  //     expect: [
  //       isA<LoginState>()
  //           .having((source) => source.isSubmitting, "submitting", true),
  //       isA<LoginState>()
  //           .having((source) => source.isSuccess, "should be successfull", true)
  //     ],
  //   );
  // });
}
