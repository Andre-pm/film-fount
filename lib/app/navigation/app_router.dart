import 'package:film_fount/features/auth/presentation/pages/login_screen.dart';
import 'package:film_fount/features/home/presentation/home_screen.dart';
import 'package:film_fount/features/movie_details/presentation/movie_details_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const login = '/';
  static const home = '/home';
  static const movieDetails = '/movie_details';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
    movieDetails: (context) => MovieDetailsScreen(),
  };
}
