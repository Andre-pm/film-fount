import 'dart:ui';

import 'package:film_fount/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required Animation<double> backgroundAnimation,
    required this.isLargeScreen,
    required Animation<double> thirdPosterAnimation,
    required Animation<double> secondPosterAnimation,
    required Animation<double> firstPosterAnimation,
    required this.authControllerNotifier,
    required this.strings,
    required Animation<double> buttonAnimation,
  }) : _backgroundAnimation = backgroundAnimation,
       _thirdPosterAnimation = thirdPosterAnimation,
       _secondPosterAnimation = secondPosterAnimation,
       _firstPosterAnimation = firstPosterAnimation,
       _buttonAnimation = buttonAnimation;

  final double screenHeight;
  final double screenWidth;
  final Animation<double> _backgroundAnimation;
  final bool isLargeScreen;
  final Animation<double> _thirdPosterAnimation;
  final Animation<double> _secondPosterAnimation;
  final Animation<double> _firstPosterAnimation;
  final AuthNotifier authControllerNotifier;
  final AppLocalizations strings;
  final Animation<double> _buttonAnimation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
      width: screenWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _backgroundAnimation,
            builder: (context, child) {
              return Positioned(
                right: isLargeScreen ? -900 : -1000,
                child: Transform.rotate(
                  angle: _backgroundAnimation.value,
                  child: child,
                ),
              );
            },
            child: Container(
              width: 1399,
              height: 1049.85,
              color: Theme.of(context).colorScheme.secondary,
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
          isLargeScreen
              ? Positioned(
                  left: 279,
                  top: 127,
                  child: SvgPicture.asset(
                    'assets/svg/logo_login_horizontal.svg',
                  ),
                )
              : Align(
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
            animation: _thirdPosterAnimation,
            builder: (context, child) {
              return isLargeScreen
                  ? Positioned(
                      right: 199,
                      top: _thirdPosterAnimation.value,
                      child: Image.asset('assets/images/first_poster.png'),
                    )
                  : Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: _thirdPosterAnimation.value + 45,
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
            animation: _secondPosterAnimation,
            builder: (context, child) {
              return isLargeScreen
                  ? Positioned(
                      right: 141,
                      top: _secondPosterAnimation.value,
                      child: Image.asset('assets/images/second_poster.png'),
                    )
                  : Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: _secondPosterAnimation.value + 40,
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
            animation: _firstPosterAnimation,
            builder: (context, child) {
              return isLargeScreen
                  ? Positioned(
                      right: 178,
                      top: _firstPosterAnimation.value,
                      child: Image.asset('assets/images/third_poster.png'),
                    )
                  : Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: _firstPosterAnimation.value + 40,
                        ),
                        child: Image.asset(
                          'assets/images/third_poster.png',
                          scale: 1.5,
                        ),
                      ),
                    );
            },
          ),
          isLargeScreen
              ? Positioned(
                  top: 480,
                  left: 170,
                  child: InkWell(
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
                            color: Theme.of(context).colorScheme.onSurface,
                            width: 1.5,
                          ),
                          color: Color.fromRGBO(31, 31, 31, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          strings.googleButton,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () => authControllerNotifier.signInWithGoogle(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ).copyWith(top: 400),
                      child: Container(
                        width: 552,
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onSurface,
                            width: 1.5,
                          ),
                          color: Color.fromRGBO(31, 31, 31, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          strings.googleButton,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
          AnimatedBuilder(
            animation: _buttonAnimation,
            builder: (context, child) {
              return isLargeScreen
                  ? Positioned(
                      top: 650 + _buttonAnimation.value,
                      child: Column(
                        children: [
                          Text(
                            strings.whatIs,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ],
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.85 + _buttonAnimation.value,
                        ),
                        child: Column(
                          children: [
                            Text(
                              strings.whatIs,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
