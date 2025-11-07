import 'dart:ui';

import 'package:film_fount/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';

class LoginMobileLayout extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FirebaseAuthDatasource firebaseAuthDatasource;
  final void Function()? onLoginPressed;
  final void Function()? onRegisterPressed;
  final GlobalKey<FormState> formKey;

  const LoginMobileLayout({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.firebaseAuthDatasource,
    this.onLoginPressed,
    this.onRegisterPressed,
    required this.formKey,
  });

  @override
  State<LoginMobileLayout> createState() => _LoginMobileLayoutState();
}

class _LoginMobileLayoutState extends State<LoginMobileLayout>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late Animation<double> _animation;
  late AnimationController _thirdPosterController;
  late AnimationController _secondPosterController;
  late AnimationController _firstPosterController;
  late Animation<double> _thirdPosterAnimatePoster;
  late Animation<double> _secondPosterAnimatePoster;
  late Animation<double> _firstPosterAnimatePoster;
  late bool isLogin;
  late bool isRegister;
  late bool showPassword;

  @override
  void initState() {
    super.initState();
    isLogin = false;
    isRegister = false;
    showPassword = false;
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
    final String clientId = dotenv.env['GOOGLE_CLIENT_ID']!;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            height: screenHeight + (isRegister ? 225 : 165),
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
                      onTap: () {
                        setState(() {
                          isLogin = !isLogin;
                          isRegister = false;
                        });
                      },
                      child: isLogin
                          ? Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(241, 240, 236, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: 552,

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  children: [
                                    Text('Login'),
                                    SizedBox(height: 16),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: widget.emailController,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        hintText: 'seu.email@exemplo.com',
                                        filled: true,
                                        fillColor: Color.fromRGBO(
                                          241,
                                          240,
                                          236,
                                          1,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: widget.passwordController,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        filled: true,
                                        fillColor: Color.fromRGBO(
                                          241,
                                          240,
                                          236,
                                          1,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            showPassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              showPassword = !showPassword;
                                            });
                                          },
                                        ),
                                      ),
                                      obscureText: !showPassword,
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: widget.onLoginPressed,
                                          child: Container(
                                            width: 552 - 200,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 12,
                                              horizontal: 24,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                151,
                                                109,
                                                71,
                                                1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              'Entrar',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                  241,
                                                  240,
                                                  236,
                                                  1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GoogleSignInIconButton(
                                          action: AuthAction.signIn,
                                          size: 20,
                                          clientId: clientId,
                                          loadingIndicator:
                                              CircularProgressIndicator(),
                                          onSignedIn: (_) {
                                            if (context.mounted) {
                                              Navigator.of(
                                                context,
                                              ).pushReplacementNamed('/home');
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              width: 552,
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 24,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(241, 240, 236, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                    ),
                    SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isRegister = !isRegister;
                          isLogin = false;
                        });
                      },
                      child: isRegister
                          ? Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(241, 240, 236, 1),
                                  width: 2,
                                ),
                                color: Color.fromRGBO(31, 31, 31, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: 552,

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Criar Conta',
                                      style: TextStyle(
                                        color: Color.fromRGBO(241, 240, 236, 1),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    TextFormField(
                                      controller: widget.nameController,
                                      decoration: InputDecoration(
                                        labelText: 'Nome',
                                        labelStyle: TextStyle(
                                          color: Color.fromRGBO(
                                            241,
                                            240,
                                            236,
                                            1,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Color.fromRGBO(
                                          31,
                                          31,
                                          31,
                                          1,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Color.fromRGBO(241, 240, 236, 1),
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: widget.emailController,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        hintText: 'seu.email@exemplo.com',
                                        labelStyle: TextStyle(
                                          color: Color.fromRGBO(
                                            241,
                                            240,
                                            236,
                                            1,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Color.fromRGBO(
                                          31,
                                          31,
                                          31,
                                          1,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Color.fromRGBO(241, 240, 236, 1),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: widget.passwordController,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                          color: Color.fromRGBO(
                                            241,
                                            240,
                                            236,
                                            1,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Color.fromRGBO(
                                          31,
                                          31,
                                          31,
                                          1,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            showPassword
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              showPassword = !showPassword;
                                            });
                                          },
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Color.fromRGBO(241, 240, 236, 1),
                                      ),
                                      obscureText: !showPassword,
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: widget.onRegisterPressed,
                                          child: Container(
                                            width: 552 - 200,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 12,
                                              horizontal: 24,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                151,
                                                109,
                                                71,
                                                1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              'Cadastrar',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                  241,
                                                  240,
                                                  236,
                                                  1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GoogleSignInIconButton(
                                          action: AuthAction.signIn,
                                          size: 20,
                                          clientId: clientId,
                                          loadingIndicator:
                                              CircularProgressIndicator(),
                                          onSignedIn: (_) {
                                            if (context.mounted) {
                                              Navigator.of(
                                                context,
                                              ).pushReplacementNamed('/home');
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              width: 552,
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 24,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(241, 240, 236, 1),
                                  width: 2,
                                ),
                                color: Color.fromRGBO(31, 31, 31, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Criar Conta',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(241, 240, 236, 1),
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
