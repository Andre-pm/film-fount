import 'package:film_fount/features/auth/presentation/views/auth_wrapper.dart';
import 'package:film_fount/features/auth/presentation/views/login_screen.dart';
import 'package:film_fount/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const initialRoute = '/';
  static const login = '/login';
  static const home = '/home';
  static const movieDetails = '/movie_details';

  static Map<String, WidgetBuilder> get routes => {
    initialRoute: (context) => AuthWrapper(),
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
  };
}
