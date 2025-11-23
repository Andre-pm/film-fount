import 'dart:ui';

import 'package:film_fount/core/presentation/widgets/goal_square_widget.dart';
import 'package:film_fount/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginLargeScreenState();
}

class _LoginLargeScreenState extends ConsumerState<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late Animation<double> _backgroundAnimation;
  late AnimationController _thirdPosterController;
  late Animation<double> _thirdPosterAnimation;
  late AnimationController _secondPosterController;
  late Animation<double> _secondPosterAnimation;
  late AnimationController _firstPosterController;
  late Animation<double> _firstPosterAnimation;
  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    );

    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 1),
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

    _backgroundAnimation = Tween<double>(begin: -900, end: -905).animate(
      CurvedAnimation(parent: _backgroundController, curve: Curves.easeInOut),
    );

    _buttonAnimation = Tween<double>(begin: 0, end: 30).animate(
      CurvedAnimation(parent: _backgroundController, curve: Curves.bounceIn),
    );

    _thirdPosterAnimation = Tween<double>(begin: 0, end: 145).animate(
      CurvedAnimation(parent: _thirdPosterController, curve: Curves.easeInOut),
    );

    _secondPosterAnimation = Tween<double>(begin: 0, end: 167).animate(
      CurvedAnimation(parent: _secondPosterController, curve: Curves.easeInOut),
    );

    _firstPosterAnimation = Tween<double>(begin: 0, end: 192).animate(
      CurvedAnimation(parent: _firstPosterController, curve: Curves.easeInOut),
    );

    _backgroundController.repeat(reverse: true);
    _buttonController.repeat(reverse: true);
    _thirdPosterController.forward();
    _secondPosterController.forward();
    _firstPosterController.forward();
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _buttonController.dispose();
    _thirdPosterController.dispose();
    _secondPosterController.dispose();
    _firstPosterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authControllerNotifier = ref.read(authNotifierProvider.notifier);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLargeScreen = constraints.maxWidth > 1200;
          final double screenHeight = MediaQuery.of(context).size.height;
          final double screenWidth = MediaQuery.of(context).size.width;

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
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
                                  child: Image.asset(
                                    'assets/images/first_poster.png',
                                  ),
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
                                  child: Image.asset(
                                    'assets/images/second_poster.png',
                                  ),
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
                                  child: Image.asset(
                                    'assets/images/third_poster.png',
                                  ),
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
                                onTap: () =>
                                    authControllerNotifier.signInWithGoogle(),
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
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () =>
                                    authControllerNotifier.signInWithGoogle(),
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
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      AnimatedBuilder(
                        animation: _buttonAnimation,
                        builder: (context, child) {
                          return Positioned(
                            top: isLargeScreen
                                ? 650 + _buttonAnimation.value
                                : 730 + _buttonAnimation.value,
                            child: Column(
                              children: [
                                Text(
                                  'O que é FilmFount?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(
                                      183,
                                      144,
                                      109,
                                      1,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: const Color.fromRGBO(183, 144, 109, 1),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 64),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 80 : 25,
                    vertical: 25,
                  ),
                  child: Text(
                    'Crie sua biblioteca',
                    style: TextStyle(
                      fontSize: isLargeScreen ? 30 : 25,
                      fontFamily: GoogleFonts.rammettoOne().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(183, 144, 109, 1),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 100 : 25,
                  ),
                  child: SizedBox(
                    width: isLargeScreen ? screenWidth * 0.55 : screenWidth,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 165 / 245.5,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: Image.asset(
                                'assets/images/movie_poster_$index.png',
                              ).image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 64),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isLargeScreen ? 80 : 25,
                      vertical: 25,
                    ),
                    child: Text(
                      'Receba recomendações\ne decida que filme assistir',
                      style: TextStyle(
                        fontSize: isLargeScreen ? 30 : 25,
                        fontFamily: GoogleFonts.rammettoOne().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(183, 144, 109, 1),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLargeScreen ? 100 : 25,
                      ),
                      child: SizedBox(
                        width: isLargeScreen ? screenWidth * 0.45 : screenWidth,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 165 / 245.5,
                              ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: Image.asset(
                                    'assets/images/recommendation_poster_$index.png',
                                  ).image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: Image.asset(
                            'assets/images/goal_background.png',
                          ).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLargeScreen ? 80 : 25,
                        vertical: 25,
                      ),
                      child: Text(
                        'Crie metas para assistir filmes',
                        style: TextStyle(
                          fontSize: isLargeScreen ? 30 : 25,
                          fontFamily: GoogleFonts.rammettoOne().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isLargeScreen ? 350 : 25,
                        ).copyWith(top: 150),
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5.5, sigmaY: 2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Você assistiu 3 filmes surrealistas esse mês',
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.radioCanadaBig()
                                            .fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      '3 semanas seguidas',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    Center(
                                      child: SizedBox(
                                        width: isLargeScreen
                                            ? screenWidth * 0.25
                                            : screenWidth * 0.85,
                                        height: isLargeScreen ? 200 : 250,
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: 24,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 7,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                                childAspectRatio: 15 / 15,
                                              ),
                                          itemBuilder: (context, index) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: goalSquareWidget(
                                                'assets/images/goal_square_$index.png',
                                                fit: BoxFit.fill,
                                                isWatched: index < 16,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Desenvolvido por'),
                    TextButton(
                      onPressed: () async {
                        final url = Uri.parse("https://github.com/Andre-pm");

                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      child: Text(
                        '@Andre-pm',
                        style: TextStyle(
                          color: const Color.fromRGBO(183, 144, 109, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
