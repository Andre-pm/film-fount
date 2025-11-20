import 'package:film_fount/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:film_fount/features/auth/presentation/views/screens/login_large_screen.dart';
import 'package:film_fount/features/auth/presentation/views/screens/login_small_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return LoginLargeScreen();
          } else {
            return LoginSmallScreen();
          }
        },
      ),
    );
  }
}
