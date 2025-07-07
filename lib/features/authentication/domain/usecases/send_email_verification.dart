import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/authentication/domain/repository/auth_repository.dart';

class SendEmailVerification implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  SendEmailVerification({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.sendEmailVerification();
  }
}
