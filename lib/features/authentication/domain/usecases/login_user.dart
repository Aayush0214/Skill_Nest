import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/authentication/domain/entity/user.dart';
import 'package:skill_nest/features/authentication/domain/repository/auth_repository.dart';

class LoginUser implements UseCase<User, UserCredentials> {
  final AuthRepository authRepository;

  LoginUser({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserCredentials params) async {
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
