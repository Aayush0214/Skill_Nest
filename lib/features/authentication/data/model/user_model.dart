import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/features/authentication/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    required super.username,
    required super.isEmailVerified,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      username: user.displayName ?? '',
      isEmailVerified: user.emailVerified,
    );
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? username,
    bool? isEmailVerified,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }
}
