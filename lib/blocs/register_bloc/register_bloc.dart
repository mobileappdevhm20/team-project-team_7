import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fitrack/blocs/login_bloc/validators.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(RegisterState.empty());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is NameChanged) {
      yield* _mapNameChangedToState(event.name);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password, event.name);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapNameChangedToState(String name) async* {
    yield state.update(
      isNameValid: name.length >= 3,
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
      String email, String password, String name) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(
        email: email,
        password: password,
      );
      await _userRepository.setUserName(name);
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }
}
