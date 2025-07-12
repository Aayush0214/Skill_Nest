import 'package:fpdart/fpdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/features/splash/domain/repository/splash_repository.dart';

class CheckAuthStateUsecase {
  final SplashRepository repository;

  CheckAuthStateUsecase({required this.repository});

  Stream<Either<Failure, User?>> call() {
    return repository.userState();
  }
}