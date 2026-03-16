import 'dart:ui';

import 'package:film_fount/core/presentation/widgets/goal_square_widget.dart';
import 'package:film_fount/features/auth/presentation/providers/auth_provider.dart';
import 'package:film_fount/features/auth/presentation/widgets/header_login.dart';
import 'package:film_fount/features/auth/presentation/widgets/movie_grid.dart';
import 'package:film_fount/features/auth/presentation/widgets/title_text.dart';
import 'package:film_fount/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final strings = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
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
                HeaderLogin(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  backgroundAnimation: _backgroundAnimation,
                  isLargeScreen: isLargeScreen,
                  thirdPosterAnimation: _thirdPosterAnimation,
                  secondPosterAnimation: _secondPosterAnimation,
                  firstPosterAnimation: _firstPosterAnimation,
                  authControllerNotifier: authControllerNotifier,
                  strings: strings,
                  buttonAnimation: _buttonAnimation,
                ),
                SizedBox(height: 64),
                TitleText(
                  isLargeScreen: isLargeScreen,
                  title: strings.createYourLibrary,
                ),
                SizedBox(height: 25),
                MovieGrid(
                  isLargeScreen: isLargeScreen,
                  screenWidth: screenWidth,
                  screenPercentage: 0.55,
                  itemCount: 10,
                  crossAxisCount: 5,
                  asset: 'assets/images/movie_poster',
                ),
                SizedBox(height: 64),
                Align(
                  alignment: Alignment.centerRight,
                  child: TitleText(
                    isLargeScreen: isLargeScreen,
                    title: strings.receiveRecommendations,
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerRight,
                  child: MovieGrid(
                    isLargeScreen: isLargeScreen,
                    screenWidth: screenWidth,
                    screenPercentage: 0.45,
                    itemCount: 4,
                    crossAxisCount: 4,
                    asset: 'assets/images/recommendation_poster',
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
                    TitleText(
                      isLargeScreen: isLargeScreen,
                      title: strings.setGoals,
                      color: theme.colorScheme.onSurface,
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
                                      strings.goalTitleExample,
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.radioCanadaBig()
                                            .fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      strings.goalSubtitleExample,
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
                SizedBox(
                  height: 50,
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(text: strings.footerText),
                          TextSpan(
                            text: strings.footerUser,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                if (!await launchUrl(
                                  Uri.parse("https://github.com/Andre-pm"),
                                  webOnlyWindowName: '_blank',
                                )) {
                                  throw Exception(strings.footerException);
                                }
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
