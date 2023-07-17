import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/pallete.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.blueColor,
    ),
  );
  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Pallete.whiteColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Pallete.whiteColor,
        elevation: 0,
      ));
}
