import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/authentication/domain/entity/user.dart';
import 'package:skill_nest/features/authentication/domain/repository/auth_repository.dart';

class SignUpUser implements UseCase<User, SignupCredentials> {
  final AuthRepository authRepository;

  SignUpUser({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(SignupCredentials params) async {
    return await authRepository.signUpWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class SignupCredentials {
  final String email;
  final String password;

  SignupCredentials({required this.email, required this.password});
}
