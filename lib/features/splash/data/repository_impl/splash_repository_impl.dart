import 'package:fpdart/fpdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/network/connection_checker.dart';
import 'package:skill_nest/core/exceptions/server_exception.dart';
import 'package:skill_nest/core/exceptions/firebase_exceptions.dart';
import 'package:skill_nest/features/splash/domain/repository/splash_repository.dart';
import 'package:skill_nest/features/splash/data/datasources/splash_local_datasource.dart';
import 'package:skill_nest/features/splash/data/datasources/splash_remote_datasource.dart';

class SplashRepositoryImpl implements SplashRepository {
  final ConnectionChecker connectionChecker;
  final SplashLocalDataSource localDataSource;
  final SplashRemoteDataSource remoteDataSource;

  SplashRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.connectionChecker,
  });

  @override
  Stream<Either<Failure, User?>> userState() async* {
    try {
      await for (final user in remoteDataSource.userAuthStateChange()) {
        yield Right(user); // success
      }
    } on FirebaseAuthExceptionHandler catch (e) {
      yield Left(Failure(e.message)); // Firebase error
    } on ServerException catch (e) {
      yield Left(Failure(e.message)); // Server error
    } catch (e) {
      yield Left(Failure('Unknown error occurred')); // Fallback
    }
  }

    @override
  Future<bool> isOnboardingScreen() async {
    return await localDataSource.isOnboardingScreen();
  }
}
