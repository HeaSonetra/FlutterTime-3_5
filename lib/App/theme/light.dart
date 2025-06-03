import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.pinkAccent,
  scaffoldBackgroundColor: Color.fromARGB(255, 226, 222, 222),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black87)),
);
