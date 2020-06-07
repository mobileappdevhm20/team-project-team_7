import 'package:fitrack/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:fitrack/blocs/simple_bloc_delegate.dart';
import 'package:fitrack/blocs/workout_bloc/bloc.dart';
import 'package:fitrack/repositories/user_repository.dart';
import 'package:fitrack/repositories/workout_repository.dart';
import 'package:fitrack/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitrack/routes.dart';
import 'package:fitrack/views/home/home_view.dart';
import 'package:fitrack/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/home/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // final UserRepository userRepository = UserRepository();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  
  runApp(MultiRepositoryProvider(
    providers: [
      //global repositories
      RepositoryProvider(create: (context) => UserRepository()),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (context) => AuthenticationBloc(userRepository: RepositoryProvider.of<UserRepository>(context))..add(AppStarted())),
        BlocProvider<WorkoutBloc>(create: (context) => WorkoutBloc(workoutRepository: WorkoutRepository()),)
      ],
      child: const FiTrackApp(),
    ),
  ));
}
 
class FiTrackApp extends StatelessWidget {

  const FiTrackApp({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FiTrack',
      theme: getTheme(),
      onGenerateRoute: getRoute(),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is Uninitialized) {
          return SplashScreen();
        }
        if (state is Unauthenticated) {
          return SplashScreen();
        }
        if (state is Authenticated) {
          return HomeView(
            title: state.displayName.toString(),
          );
        }
        return SplashScreen();
      }),
    );
  }
}
