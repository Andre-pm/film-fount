import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromRGBO(151, 109, 71, 1),
      surface: Color.fromRGBO(30, 30, 30, 1),
      primary: Color.fromRGBO(30, 30, 30, 1),
      secondary: Color.fromRGBO(151, 109, 71, 1),
      tertiary: Color.fromRGBO(241, 240, 236, 60),
      onSurface: Color.fromRGBO(241, 240, 236, 1),
    ),
    appBarTheme: AppBarTheme(color: Color.fromRGBO(30, 30, 30, 1)),
    textTheme: GoogleFonts.ralewayTextTheme().apply(
      bodyColor: Color.fromRGBO(241, 240, 236, 1),
      displayColor: Color.fromRGBO(241, 240, 236, 1),
    ),
  );
}
