import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/features/authentication/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    required super.userName,
    required super.isEmailVerified,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      userName: user.displayName ?? '',
      isEmailVerified: user.emailVerified,
    );
  }
}