import 'package:bloc_test/bloc_test.dart';
import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import '../MockClasses/mock_user_repository.dart';

void main() {
  // Create a mock instance
  group('Empty Repo', () {
    AuthenticationBloc authBloc;
    UserRepository userRepository;

    setUp(() {
      userRepository = MockUserRepository();
      authBloc = AuthenticationBloc(userRepository: userRepository);
    });

    blocTest(
      'emits [] when nothing is added',
      build: () async => authBloc,
      expect: [],
    );

    blocTest(
      'Emit Unauthenticated when AppStarted and User not logged in',
      build: () async => authBloc,
      act: (bloc) async => bloc.add(AppStarted()),
      expect: [Unauthenticated()],
    );
  });

  group('Filled Repo', () {
    AuthenticationBloc authBloc;
    MockUserRepository userRepository;

    setUp(() async {
      userRepository = MockUserRepository();
      await userRepository.signUp(email: "test@hm.edu", password: "Test1234");
      await userRepository.signInWithCredentials("test@hm.edu", "Test1234");
      await userRepository.setUserName("Test");
      authBloc = AuthenticationBloc(userRepository: userRepository);
    });

    blocTest(
      'Emit Authenticated because User Logged in',
      build: () async => authBloc,
      act: (bloc) async => bloc.add(AppStarted()),
      expect: [const Authenticated("Test")],
    );

    blocTest(
      'Logout, expect Unauthenticated',
      build: () async => authBloc,
      act: (bloc) async => bloc.add(LoggedOut()),
      expect: [Unauthenticated()],
    );

    blocTest(
      'Login, expect Authenticated',
      build: () async => authBloc,
      act: (bloc) async => {
        userRepository.signInWithCredentials("test@hm.edu", "Test1234"),
        bloc.add(LoggedIn()),
      },
      expect: [const Authenticated("Test")],
    );
  });
}
