import 'package:film_fount/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:film_fount/features/auth/presentation/layout/login_desktop_layout.dart';
import 'package:film_fount/features/auth/presentation/layout/login_mobile.layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _firebaseAuthDatasource = FirebaseAuthDatasource();
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await _firebaseAuthDatasource.isUserLogged().then((isLogged) {
        if (isLogged && mounted) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final firebaseAuthDatasource = FirebaseAuthDatasource();
    final formKey = GlobalKey<FormState>();

    Future<void> login() async {
      final email = emailController.text;
      final password = passwordController.text;

      try {
        await firebaseAuthDatasource.signIn(email, password);
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      } on FirebaseAuthException catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.code.contains('wrong-password')
                    ? 'Senha incorreta'
                    : 'Login inválido',
              ),
            ),
          );
        }
      }
    }

    Future<void> register() async {
      final email = emailController.text;
      final password = passwordController.text;
      final name = nameController.text;

      try {
        await firebaseAuthDatasource.createAccount(email, password, name);
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/home');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Conta criada com sucesso!')));
        }
      } on FirebaseAuthException catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (e.code.contains('email-already-in-use')
                    ? 'Email já cadastrado'
                    : 'Erro ao criar conta'),
              ),
            ),
          );
        }
      }
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return LoginDesktopLayout(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              firebaseAuthDatasource: firebaseAuthDatasource,
              onLoginPressed: () => login(),
              onRegisterPressed: () => register(),
              formKey: formKey,
            );
          } else {
            return LoginMobileLayout(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              firebaseAuthDatasource: firebaseAuthDatasource,
              onLoginPressed: () => login(),
              onRegisterPressed: () => register(),
              formKey: formKey,
            );
          }
        },
      ),
    );
  }
}
