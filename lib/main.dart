import 'package:film_fount/app/navigation/app_router.dart';
import 'package:film_fount/app/theme/app_theme.dart';
import 'package:film_fount/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  if (kIsWeb) {
    final webOptions = FirebaseOptions(
      apiKey:
          dotenv.env['FIREBASE_API_KEY_WEB'] ??
          const String.fromEnvironment('FIREBASE_API_KEY_WEB'),
      appId:
          dotenv.env['FIREBASE_APPID_WEB'] ??
          const String.fromEnvironment('FIREBASE_APPID_WEB'),
      messagingSenderId:
          dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ??
          const String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID'),
      projectId:
          dotenv.env['FIREBASE_PROJECT_ID'] ??
          const String.fromEnvironment('FIREBASE_PROJECT_ID'),
      authDomain:
          dotenv.env['FIREBASE_AUTH_DOMAIN'] ??
          const String.fromEnvironment('FIREBASE_AUTH_DOMAIN'),
      storageBucket:
          dotenv.env['FIREBASE_STORAGE_BUCKET'] ??
          const String.fromEnvironment('FIREBASE_STORAGE_BUCKET'),
      measurementId:
          dotenv.env['FIREBASE_MEASUREMENT_ID'] ??
          const String.fromEnvironment('FIREBASE_MEASUREMENT_ID'),
    );

    await Firebase.initializeApp(options: webOptions);
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
    );
  }
}
