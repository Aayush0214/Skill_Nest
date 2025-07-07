import 'package:firebase_auth/firebase_auth.dart';

import '../entity/user_entity.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failure.dart';

abstract interface class AuthRepository {

  Stream<User?> get authStateChanges;

  Future<Either<Failure, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();

  Future<Either<Failure, void>> sendEmailVerification();
}