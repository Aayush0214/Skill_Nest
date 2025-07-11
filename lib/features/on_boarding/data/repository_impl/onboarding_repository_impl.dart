import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';
import 'package:skill_nest/features/on_boarding/domain/repository/onboarding_repository.dart';
import 'package:skill_nest/core/services/local_storage_service/domain/repository/local_storage.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final LocalStorage localStorage;

  OnboardingRepositoryImpl({required this.localStorage});

  @override
  Future<Either<Failure, void>> setOnboardingShown() async{
    final res = await localStorage.setOnboardingShown();
    return right(res);
  }
}