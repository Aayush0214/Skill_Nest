import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/core/usecase/usecase.dart';
import 'package:skill_nest/features/on_boarding/domain/repository/onboarding_repository.dart';

class SetOnboardingShown implements UseCase<void, NoParams> {
  final OnboardingRepository repository;

  SetOnboardingShown({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async{
    return await repository.setOnboardingShown();
  }

}