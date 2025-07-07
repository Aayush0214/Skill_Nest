import 'package:fpdart/fpdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/network/connection_checker.dart';
import 'package:skill_nest/features/authentication/domain/entity/user_entity.dart';
import 'package:skill_nest/features/authentication/domain/repository/auth_repository.dart';
import 'package:skill_nest/features/authentication/data/datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ConnectionChecker connectionChecker;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource, required this.connectionChecker});

  @override
  Stream<User?> get authStateChanges => authRemoteDataSource.authStateChanges;

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailPassword({required String email, required String password}) async{
    return _authenticate(() => authRemoteDataSource.loginWithEmailPassword(email, password));
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({required String email, required String password}) {
    return _authenticate(() => authRemoteDataSource.signUpWithEmailPassword(email, password));
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
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message ?? 'Server Issue'));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, UserEntity>> _authenticate(Future<UserEntity> Function() authFunction) async {
    if (await connectionChecker.isConnected) {
      try {
        final user = await authFunction();
        return Right(user);
      } on FirebaseAuthException catch (e) {
        return Left(Failure(e.message ?? 'Server Issue'));
      } catch (e) {
        return left(Failure(e.toString()));
      }
    } else {
      return Left(Failure('No internet connection'));
    }
  }

}