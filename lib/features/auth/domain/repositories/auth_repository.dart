import 'package:film_fount/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> signIn(String email, String password);
  Future<UserEntity?> createAccount(String email, String password, String name);
  Future<bool> signOut();
  UserEntity? getCurrentUser();
}
