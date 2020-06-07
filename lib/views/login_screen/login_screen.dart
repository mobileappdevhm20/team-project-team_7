import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fitrack/blocs/login_bloc/bloc.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/views/login_screen/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Login'),
        elevation: 0.0,
      ),
      body: const LoginForm(),
    );
  }
}
