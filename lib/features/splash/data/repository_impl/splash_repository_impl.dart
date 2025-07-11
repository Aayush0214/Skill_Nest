import 'package:fpdart/fpdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/network/connection_checker.dart';
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
  Stream<User?> userState() async*{
    yield* remoteDataSource.userAuthStateChange();
  }

  @override
  Future<bool> isOnboardingScreen() async {
    return await localDataSource.isOnboardingScreen();
  }

  @override
  Future<Either<Failure, User?>> isUserExist() async {
    if (await connectionChecker.isConnected) {
      final user = await remoteDataSource.getCurrentUser();
      return right(user);
    } else {
      return left(Failure('No internet connection'));
    }
  }
}
