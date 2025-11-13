import 'package:film_fount/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:film_fount/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<UserEntity?> createAccount(
    String email,
    String password,
    String name,
  ) async {
    final user = await datasource.createAccount(email, password, name);
    return UserEntity(
      uid: user!.uid,
      email: user.email,
      displayName: user.displayName,
    );
  }

  @override
  UserEntity? getCurrentUser() {
    final user = datasource.getCurrentUser();
    if (user == null) return null;
    return UserEntity(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
    );
  }

  @override
  Future<UserEntity?> signIn(String email, String password) {
    return datasource.signIn(email, password).then((user) {
      if (user != null) {
        return UserEntity(
          uid: user.uid,
          email: user.email,
          displayName: user.displayName,
        );
      } else {
        return null;
      }
    });
  }

  @override
  Future<bool> signOut() {
    return datasource.signOut().then((_) => true).catchError((_) => false);
  }
}
