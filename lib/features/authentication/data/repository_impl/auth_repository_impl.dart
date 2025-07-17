import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/network/connection_checker.dart';
import 'package:skill_nest/core/exceptions/server_exception.dart';
import 'package:skill_nest/core/exceptions/firebase_exceptions.dart';
import 'package:skill_nest/features/authentication/domain/entity/user_entity.dart';
import 'package:skill_nest/features/authentication/domain/repository/auth_repository.dart';
import 'package:skill_nest/features/authentication/data/datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ConnectionChecker connectionChecker;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource, required this.connectionChecker});

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailPassword({required String email, required String password}) async{
    return _authenticate(() => authRemoteDataSource.loginWithEmailPassword(email, password));
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({required String username, required String email, required String password}) {
    return _authenticate(() => authRemoteDataSource.signUpWithEmailPassword(username, email, password));
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() {
    return _authenticate(() => authRemoteDataSource.signInWithGoogle());
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    if (!await connectionChecker.isConnected) {
      return left(Failure('No internet connection'));
    }
    try {
      return right(await authRemoteDataSource.sendEmailVerification());
    } on FirebaseAuthExceptionHandler catch (e) {
      return Left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async{
    if (!await connectionChecker.isConnected) {
      return left(Failure('No internet connection'));
    }
    try {
      return right(await authRemoteDataSource.logout());
    } on FirebaseAuthExceptionHandler catch (e) {
      return Left(Failure(e.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  Future<Either<Failure, UserEntity>> _authenticate(Future<UserEntity> Function() authFunction) async {
    if (await connectionChecker.isConnected) {
      try {
        final user = await authFunction();
        return right(user);
      } on FirebaseAuthExceptionHandler catch (e) {
        return left(Failure(e.message));
      } on ServerException catch (e) {
        return left(Failure(e.message));
      }
    } else {
      return left(Failure('No internet connection'));
    }
  }


}