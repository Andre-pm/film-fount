import 'package:film_fount/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension UserMapper on User {
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      displayName: displayName,
      photoURL: photoURL,
    );
  }
}
