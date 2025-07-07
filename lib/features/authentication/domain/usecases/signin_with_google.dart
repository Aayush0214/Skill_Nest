import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/authentication/domain/entity/user_entity.dart';
import 'package:skill_nest/features/authentication/domain/repository/auth_repository.dart';

class SignInWithGoogle implements UseCase<UserEntity, NoParams> {
  final AuthRepository authRepository;

  SignInWithGoogle({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async{
    return await authRepository.signInWithGoogle();
  }

}