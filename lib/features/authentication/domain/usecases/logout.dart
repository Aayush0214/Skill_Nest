import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/authentication/domain/repository/auth_repository.dart';

class LogoutUseCase implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await authRepository.logout();
  }

}