import 'package:firebase_auth/firebase_auth.dart';

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

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
