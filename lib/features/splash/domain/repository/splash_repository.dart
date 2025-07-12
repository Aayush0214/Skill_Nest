import 'package:fpdart/fpdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/core/error/failure.dart';

abstract interface class SplashRepository {
  Stream<Either<Failure, User?>> userState();
  Future<bool> isOnboardingScreen();
}