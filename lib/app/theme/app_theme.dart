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
    scaffoldBackgroundColor: Color.fromRGBO(30, 30, 30, 1),
    appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(30, 30, 30, 1)),
    textTheme: GoogleFonts.ralewayTextTheme().apply(
      bodyColor: Color.fromRGBO(241, 240, 236, 1),
      displayColor: Color.fromRGBO(241, 240, 236, 1),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(241, 240, 236, 1)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(241, 240, 236, 1)),
      ),
      labelStyle: TextStyle(color: Color.fromRGBO(30, 30, 30, 1)),
      hintStyle: TextStyle(color: Color.fromRGBO(30, 30, 30, 1)),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      headerBackgroundColor: Color.fromRGBO(151, 109, 71, 1),
      headerForegroundColor: WidgetStateColor.resolveWith(
        (states) => Color.fromRGBO(241, 240, 236, 1),
      ),
      subHeaderForegroundColor: WidgetStateColor.resolveWith(
        (states) => Color.fromRGBO(241, 240, 236, 1),
      ),
      todayBackgroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Color.fromRGBO(241, 240, 236, 1);
        }
        return Colors.transparent;
      }),
      todayForegroundColor: WidgetStateColor.resolveWith(
        (states) => Color.fromRGBO(151, 109, 71, 1),
      ),
      todayBorder: BorderSide(
        color: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Color.fromRGBO(241, 240, 236, 1);
          }
          return Colors.transparent;
        }),
        width: 2,
      ),
      dayBackgroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Color.fromRGBO(151, 109, 71, 1);
        }
        return Colors.transparent;
      }),

      yearBackgroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Color.fromRGBO(151, 109, 71, 1);
        }
        return Colors.transparent;
      }),
      yearForegroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Color.fromRGBO(241, 240, 236, 1);
        }
        return Color.fromRGBO(241, 240, 236, 1);
      }),
      dayForegroundColor: WidgetStateColor.resolveWith(
        (states) => Color.fromRGBO(241, 240, 236, 1),
      ),
      dayOverlayColor: WidgetStateColor.resolveWith(
        (states) => Color.fromRGBO(241, 240, 236, 1),
      ),
      surfaceTintColor: Color.fromRGBO(151, 109, 71, 1),
      confirmButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith(
          (states) => Color.fromRGBO(151, 109, 71, 1),
        ),
        foregroundColor: WidgetStateColor.resolveWith(
          (states) => Color.fromRGBO(241, 240, 236, 1),
        ),
      ),
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith(
          (states) => Color.fromRGBO(241, 240, 236, 1),
        ),
        foregroundColor: WidgetStateColor.resolveWith(
          (states) => Color.fromRGBO(151, 109, 71, 1),
        ),
      ),
    ),
  );
}
