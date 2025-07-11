import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';

abstract interface class OnboardingRepository {
  Future<Either<Failure, void>> setOnboardingShown();
}