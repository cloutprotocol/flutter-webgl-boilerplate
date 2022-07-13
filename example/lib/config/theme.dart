import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    // COLOR THEME
    primaryColor: Color(0xFFF1d1676),
    primaryColorDark: Color(0xFFF808080),
    primaryColorLight: Color(0xFFF808080),
    scaffoldBackgroundColor: Color(0xFFF1d1676),
    backgroundColor: Color(0xFFF0c0818),

    //FONT THEME
    fontFamily: 'roboto',
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(0xFFFdfe2f0),
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color(0xFFFdfe2f0),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: Color(0xFFFdfe2f0),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: Color(0xFFFdfe2f0),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: Color(0xFFFdfe2f0),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: Color(0xFFFdfe2f0),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText1: TextStyle(
        color: Color(0xFFF808080),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
      bodyText2: TextStyle(
        color: Color(0xFFF808080),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
