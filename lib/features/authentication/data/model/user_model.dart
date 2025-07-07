import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:skill_nest/features/authentication/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({required super.uid, super.email});

  factory UserModel.fromFirebase(firebase.User user) {
    return UserModel(uid: user.uid, email: user.email);
  }
}