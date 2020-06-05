import 'package:auto_route/auto_route.dart';
import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:fitrack/blocs/simple_bloc_delegate.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:fitrack/routes/router.gr.dart';
import 'package:fitrack/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // final UserRepository userRepository = UserRepository();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    MultiRepositoryProvider(
      providers: [
        //global repositories
        RepositoryProvider(create: (context) => UserRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          //global blocs
          BlocProvider<AuthenticationBloc>(create: (context) {
            return AuthenticationBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
            )..add(AppStarted());
          }),
        ],
        child: const FiTrackApp(),
      ),
    ),
  );
}

class FiTrackApp extends StatelessWidget {
  const FiTrackApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FiTrack',
      theme: getTheme(),
      builder: ExtendedNavigator<Router>(
        router: Router(),
        initialRoute: Routes.splashScreen,
      ),
    );
  }
}
