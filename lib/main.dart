import 'package:auto_route/auto_route.dart';
import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:fitrack/blocs/save_workout_bloc/workout_db_bloc.dart';
import 'package:fitrack/blocs/simple_bloc_observer.dart';
import 'package:fitrack/blocs/workout_bloc/bloc.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/repositories/workout_repository.dart';
import 'package:flutter/material.dart';
import 'package:fitrack/routes/router.gr.dart';
import 'package:fitrack/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        //global repositories
        RepositoryProvider(create: (context) => UserRepository()),
        RepositoryProvider(
          create: (context) => WorkoutRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          //global blocs
          BlocProvider<AuthenticationBloc>(create: (context) {
            return AuthenticationBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
            )..add(AppStarted());
          }),
          BlocProvider<WorkoutBloc>(
            create: (context) => WorkoutBloc(),
          ),
          BlocProvider<WorkoutDBBloc>(
              create: (context) => WorkoutDBBloc(
                  workoutRepository:
                      RepositoryProvider.of<WorkoutRepository>(context))),
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
