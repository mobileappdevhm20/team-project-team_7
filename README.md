![FiTrack Logo](https://github.com/mobileappdevhm20/team-project-team_7/blob/develop/assets/images/png/fitrack-logocircle.png?raw=true "FiTrack Logo")

[![Codemagic build status](https://api.codemagic.io/apps/5ec7a927261f3410eb114173/5ec863ee261f3440df2f3a35/status_badge.svg)](https://codemagic.io/apps/5ec7a927261f3410eb114173/5ec863ee261f3440df2f3a35/latest_build)

[![codecov](https://codecov.io/gh/mobileappdevhm20/team-project-team_7/branch/master/graph/badge.svg)](https://codecov.io/gh/mobileappdevhm20/team-project-team_7)

# FiTrack - Get Fit With Friends - Documentation
This page explains technical background of the app and can be used by other developers for contributing to the project.
The project uses the programming language **Dart** and uses the **Flutter** cross-platform framework by Google.
Best practices like **seperation of concerns**, splitting the application into **multiple layers** and using advanced state management with the **BLoC** pattern are used.

---

## Table of content
- [Pre-requisites](#pre-requisites)
- [Installation guide](#installation-guide)
- [Used dependencies / dev-dependencies](#dependencies)
- [Project structure](#project-structure)
- [Widget explanations](#widgets)

---

## Pre-requisites
- working **dart** installation on your machine (check out the [official dart installation guide](https://dart.dev/get-dart))
- working **flutter** installation on your machine (check out the [official flutter installation guide](https://flutter.dev/docs/get-started/install)
- working **git** installation on your machine (check out the [official git installation guide](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git))
- working **android sdk / Android Studio** installation on your machine if you want to target Android (check out the [official android studio installation guide](https://developer.android.com/studio/install))
- working **xcode** installation if you want to target iOS (check out [this guide](https://medium.com/@LondonAppBrewery/how-to-download-and-setup-xcode-10-for-ios-development-b63bed1865c))

---

## Installation Guide
0. Make sure you got a functional flutter installation by running <br>
  `flutter doctor`
1. Clone the master (or any other) branch by running <br>
  `git clone https://github.com/mobileappdevhm20/team-project-team_7.git`
2. Install the project dependencies by running <br>
  `flutter pub get`
3. 1. Debug on your own device or a running simulator by running <br>
  `flutter run` or
   2. Build a release by running either <br>
  `flutter build apk` or `flutter build ios`

---

## Dependencies
### Dependencies (compilation dependencies)
These dependencies are required for application to compile. They are part of the created .apk/.ipa file.

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) - Used for implementing the BLoC pattern in Flutter environments
- [equatable](https://pub.dev/packages/equatable) - Enables value equality instead of standard pointer equality in dart
- [firebase_core](https://pub.dev/packages/firebase_core) - Enables the connection of multiple Firebase apps
- [firebase_auth](https://pub.dev/packages/firebase_auth) - Enables Firebase authentication in Flutter apps
- [rx_dart](https://pub.dev/packages/rxdart) - Adds additional capabilities to Dart Streams and StreamControllers
- [background_location](https://pub.dev/packages/background_location) - Gives access to GPS sensor while the app running is in the background
- [auto_route](https://pub.dev/packages/auto_route) - Route Generation library
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) - Enables the access of Cloud Firestore, a Service to store data in a noSQL database
- [share](https://pub.dev/packages/share) - Enables sharing content via the platform share UI
- [quotes](https://pub.dev/packages/quotes) - Utility that contains more than 500 famous quotes.

### Dev-Dependencies (only needed while developing)
These dependencies will not be included in the final product and just help the developers to develop faster and better.

- [mockito](https://pub.dev/packages/mockito) - Mock library for testing purposes
- [bloc_test](https://pub.dev/packages/bloc_test) - Testing library that makes it easy to test BLoCs, events and states.
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) - Simplifies the task of updating the apps launcher icon
- [flutter_launcher_name](https://pub.dev/packages/flutter_launcher_name) - Simplifies the task of updating the apps launcher name
- [lint](https://pub.dev/packages/lint) - Advanced dart linter for better code style
- [auto_route_generator](https://pub.dev/packages/auto_route_generator) - Generator for the auto_route dependency
- [build_runner](https://pub.dev/packages/build_runner) - Build system for Dart code generation and modular compilation

---

## Project structure

![The used architecure inside FiTrack](https://miro.medium.com/max/1400/1*MqYPYKdNBiID0mZ-zyE-mA.png)


- *pubspec.yaml* - File that stores the meta-data for the project and I used for managing dependencies
- *android/* and *ios/* - **Don't touch** these folders unless you know what you're doing
- *assets/* - Contains images, fonts and more
- *test/* - Contains unit tests for widgets and other objects
- *test_driver/* - Contains driver tests (integration tests)
- *lib/* - Contains the actual source code
  - *main.dart* - Entry file to the application that setups global blocs, repository and the root widget of the app
  - *theme.dart* - Defines the ThemeData of the application
  - *blocs/* - Contains BLoCs and their respective event and state files. (3 files in total for each BLoC) (more on the BLoC pattern [here](https://medium.com/flutterpub/architecting-your-flutter-project-bd04e144a8f1))
  - *components/* - Contains reusable components that are used in multiple parts of the application
  - *models/* - Contains data models
  - *repositories/* - Contains repositories that are used to access data providers and combine them
  - *routes/* - Contains the routing setup for the application
  - *services/* - Contains custom implementations for special services
  - *views/* - Split into folders. Each folder contains a view. If special components are used specifically in that view, they are stored in */components* subfolder

---
### Repository and Blocs
The app makes heavy use of Repositories and BLOCs. To access those there is a MultiRepositoryProvider and MultiBlocProvider in the main.dart. These Repositories and BLOCs can then be accessed in the whole widget tree.
```Dart
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
```
---
### Login and Signup
For User Authentication Firebase with the [firebase_auth](https://pub.dev/packages/firebase_auth) plugin is used. The communication to firebase is done with the repository lib/repositories/user_repository.dart.

The app uses BLOCs to communicate with the repository. There is a:
- authentication_bloc: Looks what the authentication state of the user is, in other words if the user is logged in or not. The app should then route to the appropiate views.
- register_bloc: Communicates directly to the user_repository to register the user. Also validates email and password during typing.
- login_bloc: Communicates directly to the user_repository to login the user. Also validates email and password during typing.

There is a seperate screen each for login and signup which communicate with the appropiate BLOCs.

### Fitrack Scaffold
Most pages are created with this Scaffold (lib/components/custom_scaffold.dart). It customises the look of the appbar and includes a buttom navigation bar with a floating action button. What parts are shown can be controlled with booleans. 

### Homescreen
For now this screen only displays a random quote from [quotes](https://pub.dev/packages/quotes) package. The idea was to show the recent events, news and milestones of you and your friends here.

### Tracking
The tracking is done with [background_location](https://pub.dev/packages/background_location) package. The first time the app is used the user is asked for gps-permission. The ui communicates with the location-service via the workout_bloc.dart. 

### Tracking Summary
When the user is finished with tracking he is redirected to a tracking summary screen. Here he has the option to save his workout. To do this the UI communicates with the save_workout_bloc.dart. The BLOC then communicates with the workout_repository.dart which uses firebases Cloud-Firestore to save the Workout online and per user.

There is also a [share](https://pub.dev/packages/share) feature and the option to not save.

### Past Workouts
This view uses a [StreamBuilder](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) to create a listview with all workouts for the current user. For simplicity the view uses the workout_repository.dart directly and not with a bloc.
