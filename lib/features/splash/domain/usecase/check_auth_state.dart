import 'package:fpdart/fpdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/splash/domain/repository/splash_repository.dart';

// class CheckAuthStateUsecase implements UseCase<User?, NoParams>{
//   final SplashRepository repository;
//
//   CheckAuthStateUsecase({required this.repository});
//
//   @override
//   Future<Either<Failure, User?>> call(NoParams params) async {
//     return await repository.isUserExist();
//   }
// }

class CheckAuthStateUsecase {
  final SplashRepository repository;

  CheckAuthStateUsecase({required this.repository});

  Stream<User?> call() async*{
    yield* repository.userState();
  }
}