import 'dart:ui';

import 'package:film_fount/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class LoginLargeScreen extends ConsumerStatefulWidget {
  const LoginLargeScreen({super.key});

  @override
  ConsumerState<LoginLargeScreen> createState() => _LoginLargeScreenState();
}

class _LoginLargeScreenState extends ConsumerState<LoginLargeScreen>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late Animation<double> _animation;
  late AnimationController _thirdPosterController;
  late AnimationController _secondPosterController;
  late AnimationController _firstPosterController;
  late Animation<double> _thirdPosterAnimatePoster;
  late Animation<double> _secondPosterAnimatePoster;
  late Animation<double> _firstPosterAnimatePoster;

  @override
  void initState() {
    super.initState();
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );

    _thirdPosterController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _secondPosterController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _firstPosterController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _animation = Tween<double>(begin: -900, end: -905).animate(
      CurvedAnimation(parent: _backgroundController, curve: Curves.easeInOut),
    );

    _thirdPosterAnimatePoster = Tween<double>(begin: 0, end: 145).animate(
      CurvedAnimation(parent: _thirdPosterController, curve: Curves.easeInOut),
    );

    _secondPosterAnimatePoster = Tween<double>(begin: 0, end: 167).animate(
      CurvedAnimation(parent: _secondPosterController, curve: Curves.easeInOut),
    );

    _firstPosterAnimatePoster = Tween<double>(begin: 0, end: 192).animate(
      CurvedAnimation(parent: _firstPosterController, curve: Curves.easeInOut),
    );

    _backgroundController.repeat(reverse: true);
    _thirdPosterController.forward();
    _secondPosterController.forward();
    _firstPosterController.forward();
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _thirdPosterController.dispose();
    _secondPosterController.dispose();
    _firstPosterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authControllerNotifier = ref.read(authNotifierProvider.notifier);

    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Positioned(
              right: -900,
              child: Transform.rotate(angle: _animation.value, child: child),
            );
          },
          child: Container(
            width: 1399,
            height: 1049.85,
            color: const Color.fromRGBO(151, 109, 71, 1),
          ),
        ),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
        ),
        Positioned(
          left: 279,
          top: 127,
          child: SvgPicture.asset('assets/svg/logo_login_horizontal.svg'),
        ),
        AnimatedBuilder(
          animation: _thirdPosterAnimatePoster,
          builder: (context, child) {
            return Positioned(
              right: 199,
              top: _thirdPosterAnimatePoster.value,
              child: Image.asset('assets/images/first_poster.png'),
            );
          },
        ),
        AnimatedBuilder(
          animation: _secondPosterAnimatePoster,
          builder: (context, child) {
            return Positioned(
              right: 141,
              top: _secondPosterAnimatePoster.value,
              child: Image.asset('assets/images/second_poster.png'),
            );
          },
        ),
        AnimatedBuilder(
          animation: _firstPosterAnimatePoster,
          builder: (context, child) {
            return Positioned(
              right: 178,
              top: _firstPosterAnimatePoster.value,
              child: Image.asset('assets/images/third_poster.png'),
            );
          },
        ),

        Positioned(
          top: 480,
          left: 170,
          child: InkWell(
            onTap: () => authControllerNotifier.signInWithGoogle(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: 552,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(241, 240, 236, 1),
                    width: 1.5,
                  ),
                  color: Color.fromRGBO(31, 31, 31, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Entrar com Google',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(241, 240, 236, 1),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
