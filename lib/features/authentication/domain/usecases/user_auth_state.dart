import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/features/authentication/domain/repository/auth_repository.dart';

class UserAuthState {
  final AuthRepository repository;

  UserAuthState({required this.repository});

  Stream<User?> call() {
    return repository.authStateChanges;
  }
}
