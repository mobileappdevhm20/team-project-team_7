import 'package:flutter/material.dart';

//primary color (green) #1fd65d
//accent color (orange) #f14823

final ThemeData myTheme = ThemeData(
  primarySwatch: const MaterialColor(4280276573, {
    50: Color(0xffe9fcef),
    100: Color(0xffd2f9df),
    200: Color(0xffa6f2c0),
    300: Color(0xff79eca0),
    400: Color(0xff4de580),
    500: Color(0xff20df61),
    600: Color(0xff1ab24d),
    700: Color(0xff13863a),
    800: Color(0xff0d5927),
    900: Color(0xff062d13)
  }),
  fontFamily: 'Roboto',
  brightness: Brightness.light,
  primaryColor: const Color(0xff1fd65d),
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: const Color(0xffd2f9df),
  primaryColorDark: const Color(0xff13863a),
  accentColor: const Color(0xfff14823),
  accentColorBrightness: Brightness.dark,
  canvasColor: const Color(0xfffafafa),
  scaffoldBackgroundColor: const Color(0xfffafafa),
  bottomAppBarColor: const Color(0xffffffff),
  cardColor: const Color(0xffffffff),
  dividerColor: const Color(0x1f000000),
  highlightColor: const Color(0x66bcbcbc),
  splashColor: const Color(0x66c8c8c8),
  selectedRowColor: const Color(0xfff5f5f5),
  unselectedWidgetColor: const Color(0x8a000000),
  disabledColor: const Color(0x61000000),
  buttonColor: const Color(0xffe0e0e0),
  toggleableActiveColor: const Color(0xff1ab24d),
  secondaryHeaderColor: const Color(0xffe9fcef),
  textSelectionColor: const Color(0xffa6f2c0),
  cursorColor: const Color(0xff79eca0),
  textSelectionHandleColor: const Color(0xff79eca0),
  backgroundColor: const Color(0xffa6f2c0),
  dialogBackgroundColor: const Color(0xffffffff),
  indicatorColor: const Color(0xff20df61),
  hintColor: const Color(0x8a000000),
  errorColor: const Color(0xffd32f2f),
  buttonTheme: const ButtonThemeData(
    padding: EdgeInsets.only(left: 16, right: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
    buttonColor: Color(0xffe0e0e0),
    disabledColor: Color(0x61000000),
    highlightColor: Color(0x29000000),
    splashColor: Color(0x1f000000),
    focusColor: Color(0x1f000000),
    hoverColor: Color(0x0a000000),
    colorScheme: ColorScheme(
      primary: Color(0xff1fd65d),
      primaryVariant: Color(0xff13863a),
      secondary: Color(0xff20df61),
      secondaryVariant: Color(0xff13863a),
      surface: Color(0xffffffff),
      background: Color(0xffa6f2c0),
      error: Color(0xffd32f2f),
      onPrimary: Color(0xff000000),
      onSecondary: Color(0xff000000),
      onSurface: Color(0xff000000),
      onBackground: Color(0xff000000),
      onError: Color(0xffffffff),
      brightness: Brightness.light,
    ),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Color(0x8a000000),
    ),
    headline2: TextStyle(
      color: Color(0x8a000000),
    ),
    headline3: TextStyle(
      color: Color(0x8a000000),
    ),
    headline4: TextStyle(
      color: Color(0x8a000000),
    ),
    headline5: TextStyle(
      color: Color(0xdd000000),
    ),
    headline6: TextStyle(
      color: Color(0xdd000000),
    ),
    subtitle1: TextStyle(
      color: Color(0xdd000000),
    ),
    subtitle2: TextStyle(
      color: Color(0xff000000),
    ),
    bodyText1: TextStyle(
      color: Color(0xdd000000),
    ),
    bodyText2: TextStyle(
      color: Color(0xdd000000),
    ),
    caption: TextStyle(
      color: Color(0x8a000000),
    ),
    button: TextStyle(
      color: Color(0xdd000000),
    ),
    overline: TextStyle(
      color: Color(0xff000000),
    ),
  ),
  primaryTextTheme: const TextTheme(
    headline1: TextStyle(
      color: Color(0x8a000000),
    ),
    headline2: TextStyle(
      color: Color(0x8a000000),
    ),
    headline3: TextStyle(
      color: Color(0x8a000000),
    ),
    headline4: TextStyle(
      color: Color(0x8a000000),
    ),
    headline5: TextStyle(
      color: Color(0xdd000000),
    ),
    headline6: TextStyle(
      color: Color(0xdd000000),
    ),
    subtitle1: TextStyle(
      color: Color(0xdd000000),
    ),
    subtitle2: TextStyle(
      color: Color(0xff000000),
    ),
    bodyText1: TextStyle(
      color: Color(0xdd000000),
    ),
    bodyText2: TextStyle(
      color: Color(0xdd000000),
    ),
    caption: TextStyle(
      color: Color(0x8a000000),
    ),
    button: TextStyle(
      color: Color(0xdd000000),
    ),
    overline: TextStyle(
      color: Color(0xff000000),
    ),
  ),
  accentTextTheme: const TextTheme(
    headline1: TextStyle(
      color: Color(0x8a000000),
    ),
    headline2: TextStyle(
      color: Color(0x8a000000),
    ),
    headline3: TextStyle(
      color: Color(0x8a000000),
    ),
    headline4: TextStyle(
      color: Color(0x8a000000),
    ),
    headline5: TextStyle(
      color: Color(0xdd000000),
    ),
    headline6: TextStyle(
      color: Color(0xdd000000),
    ),
    subtitle1: TextStyle(
      color: Color(0xdd000000),
    ),
    subtitle2: TextStyle(
      color: Color(0xff000000),
    ),
    bodyText1: TextStyle(
      color: Color(0xdd000000),
    ),
    bodyText2: TextStyle(
      color: Color(0xdd000000),
    ),
    caption: TextStyle(
      color: Color(0x8a000000),
    ),
    button: TextStyle(
      color: Color(0xdd000000),
    ),
    overline: TextStyle(
      color: Color(0xff000000),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xdd000000),
    ),
    helperStyle: TextStyle(
      color: Color(0xdd000000),
    ),
    hintStyle: TextStyle(
      color: Color(0xdd000000),
    ),
    errorStyle: TextStyle(
      color: Color(0xdd000000),
    ),
    contentPadding: EdgeInsets.only(top: 20, bottom: 20),
    prefixStyle: TextStyle(
      color: Color(0xdd000000),
    ),
    suffixStyle: TextStyle(
      color: Color(0xdd000000),
    ),
    counterStyle: TextStyle(
      color: Color(0xdd000000),
    ),
    fillColor: Color(0x00000000),
    errorBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Colors.yellow, width: 2.0),
    ),
    focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Color(0xFF00FF55), width: 2.0),
    ),
    focusedErrorBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Colors.yellow, width: 2.0),
    ),
    disabledBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Colors.yellow, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Color(0xff1fd65d), width: 2.0),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Color(0xff1fd65d), width: 2.0),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xdd000000),
    opacity: 1,
    size: 24,
  ),
  primaryIconTheme: const IconThemeData(
    color: Color(0xff000000),
    opacity: 1,
    size: 24,
  ),
  accentIconTheme: const IconThemeData(
    color: Color(0xff000000),
    opacity: 1,
    size: 24,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xfff14823),
  ),
  // sliderTheme: SliderThemeData(
  //   activeTrackColor: null,
  //   inactiveTrackColor: null,
  //   disabledActiveTrackColor: null,
  //   disabledInactiveTrackColor: null,
  //   activeTickMarkColor: null,
  //   inactiveTickMarkColor: null,
  //   disabledActiveTickMarkColor: null,
  //   disabledInactiveTickMarkColor: null,
  //   thumbColor: null,
  //   disabledThumbColor: null,
  //   thumbShape: null,
  //   overlayColor: null,
  //   valueIndicatorColor: null,
  //   valueIndicatorShape: null,
  //   showValueIndicator: null,
  //   valueIndicatorTextStyle: TextStyle(
  //     color: Color(0xdd000000),
  //     fontSize: null,
  //     fontWeight: FontWeight.w400,
  //     fontStyle: FontStyle.normal,
  //   ),
  // ),
  tabBarTheme: const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Color(0xdd000000),
    unselectedLabelColor: Color(0xb2000000),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0x1f000000),
    brightness: Brightness.light,
    deleteIconColor: Color(0xde000000),
    disabledColor: Color(0x0c000000),
    labelPadding: EdgeInsets.only(left: 8, right: 8),
    labelStyle: TextStyle(
      color: Color(0xde000000),
    ),
    padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
    secondaryLabelStyle: TextStyle(
      color: Color(0x3d000000),
    ),
    secondarySelectedColor: Color(0x3d1fd65d),
    selectedColor: Color(0x3d000000),
    shape: StadiumBorder(),
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(),
  ),
);

ThemeData getTheme() {
  return myTheme;
}
