import 'package:flutter/material.dart';

// Here you can easy build a theme colors for your app
// on Dark and Light Options to change in 'settings'
class ThemeConfig {
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Color(0xff2d2c2c);
  static Color lightAccent = Color(0xff39bdfa);
  static Color darkAccent = Color(0xff268cbb);
  static Color lightBG = Colors.white;
  static Color darkBG = Color(0xff1f1f1f);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
    ),
  );
}
