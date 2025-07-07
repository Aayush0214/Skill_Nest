import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/authentication/domain/entity/user.dart';
import 'package:skill_nest/features/authentication/domain/repository/auth_repository.dart';

class LoginWithEmailPassword implements UseCase<UserEntity, UserCredentials> {
  final AuthRepository authRepository;

  LoginWithEmailPassword({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(UserCredentials params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserCredentials {
  final String email;
  final String password;

  UserCredentials({required this.email, required this.password});
}
