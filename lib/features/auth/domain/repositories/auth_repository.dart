import 'package:film_fount/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<bool> loginWithGoogle();
  UserEntity? getCurrentUser();
  Stream<UserEntity?> get isUserLogged;
  Future<void> deleteAccount();
  Future<bool> signOut();
}
