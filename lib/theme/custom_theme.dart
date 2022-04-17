import 'package:flutter/material.dart';

class CustomTheme {
  static final ligthTheme = ThemeData(
    textTheme: TextTheme(
      headline2: const TextStyle(fontSize: 60, color: Colors.black),
      headline3: const TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
      headline4: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
      headline5: const TextStyle(fontSize: 20, color: Colors.black),
      bodyText1: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.6)),
      bodyText2: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6)),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 190, 190, 190),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    textTheme: TextTheme(
      headline2: const TextStyle(fontSize: 60, color: Colors.white),
      headline3: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),
      headline4: const TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
      headline5: const TextStyle(fontSize: 20, color: Colors.white),
      bodyText1: TextStyle(fontSize: 18, color: Colors.white.withOpacity(0.6)),
      bodyText2: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6)),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff3B2B40),
      secondary: Color(0xff282335),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    ),
  );
}
