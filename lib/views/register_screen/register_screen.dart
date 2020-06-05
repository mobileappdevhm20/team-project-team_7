import 'package:auto_route/auto_route.dart';
import 'package:fitrack/blocs/register_bloc/bloc.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/views/register_screen/components/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget implements AutoRouteWrapper {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => RegisterBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
        ),
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Register'),
        elevation: 0.0,
      ),
      body: Center(
        child: RegisterForm(),
      ),
    );
  }
}
