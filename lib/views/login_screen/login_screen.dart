import 'package:fitrack/blocs/login_bloc/bloc.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/views/login_screen/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const route = "/login";

  const LoginScreen({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: const Text('Login'), elevation: 0.0,),
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: RepositoryProvider.of<UserRepository>(context)),
        child: const LoginForm(),
      ),
    );
  }
}
