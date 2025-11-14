import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseAuthDatasource {
  late final FirebaseAuth _firebaseAuth;

  FirebaseAuthDatasource({FirebaseAuth? firebaseAuth}) {
    _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  }

  Future<bool> isUserLogged() async {
    final user = await FirebaseAuth.instance.authStateChanges().first;
    return user != null;
  }

  Future<User?> createAccount(
    String email,
    String password,
    String name,
  ) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    await user?.updateProfile(displayName: name);
    return user;
  }

  Future<User?> signIn(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserCredential> signInWithGoogle() async {
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

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
