import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';

abstract interface class SplashRepository {
  Stream<User?> userState();
  Future<Either<Failure, User?>> isUserExist();
  Future<bool> isOnboardingScreen();
}