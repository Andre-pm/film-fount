import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthDatasource {
  late final FirebaseAuth _firebaseAuth;

  AuthDatasource(FirebaseAuth? firebaseAuth) {
    _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  }

  Future<UserCredential> loginWithGoogle() async {
    GoogleSignIn googleSignIn;
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    if (kIsWeb) {
      return await _firebaseAuth.signInWithPopup(googleProvider);
    } else {
      final clientId = dotenv.env['GOOGLE_CLIENT_ID_WEB'];
      googleSignIn = GoogleSignIn(clientId: clientId);
    }

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'user-cancelled',
        message: 'O processo de login foi cancelado pelo usuário.',
      );
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _firebaseAuth.signInWithCredential(credential);
  }

  User? getCurrentUser() => _firebaseAuth.currentUser;

  Stream<User?> get isUserLogged => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
