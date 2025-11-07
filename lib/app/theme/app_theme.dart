import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromRGBO(151, 109, 71, 1),
      surface: Color.fromRGBO(30, 30, 30, 1),
    ),
    textTheme: GoogleFonts.ralewayTextTheme(),
  );
}
