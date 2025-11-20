import 'dart:ui';

import 'package:film_fount/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class LoginSmallScreen extends ConsumerStatefulWidget {
  const LoginSmallScreen({super.key});

  @override
  ConsumerState<LoginSmallScreen> createState() => _LoginSmallScreenState();
}

class _LoginSmallScreenState extends ConsumerState<LoginSmallScreen>
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

    _thirdPosterAnimatePoster = Tween<double>(begin: 0, end: 235 - 50).animate(
      CurvedAnimation(parent: _thirdPosterController, curve: Curves.easeInOut),
    );

    _secondPosterAnimatePoster = Tween<double>(begin: 0, end: 257 - 50).animate(
      CurvedAnimation(parent: _secondPosterController, curve: Curves.easeInOut),
    );

    _firstPosterAnimatePoster = Tween<double>(begin: 0, end: 282 - 50).animate(
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
    final double screenHeight = MediaQuery.of(context).size.height;
    final authControllerNotifier = ref.read(authNotifierProvider.notifier);

    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            height: screenHeight + 225,
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Positioned(
                      right: -1000,
                      child: Transform.rotate(
                        angle: _animation.value,
                        child: child,
                      ),
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
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: SvgPicture.asset(
                'assets/svg/logo_login_horizontal.svg',
                width: 200,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _thirdPosterAnimatePoster,
            builder: (context, child) {
              return Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: _thirdPosterAnimatePoster.value,
                  ),
                  child: Image.asset(
                    'assets/images/first_poster.png',
                    scale: 1.5,
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _secondPosterAnimatePoster,
            builder: (context, child) {
              return Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: _secondPosterAnimatePoster.value,
                  ),
                  child: Image.asset(
                    'assets/images/second_poster.png',
                    scale: 1.5,
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _firstPosterAnimatePoster,
            builder: (context, child) {
              return Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: _firstPosterAnimatePoster.value,
                  ),
                  child: Image.asset(
                    'assets/images/third_poster.png',
                    scale: 1.5,
                  ),
                ),
              );
            },
          ),
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ).copyWith(top: 510),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70),

                    InkWell(
                      onTap: () => authControllerNotifier.signInWithGoogle(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Container(
                          width: 552,
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
