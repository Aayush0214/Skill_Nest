import 'package:skill_nest/features/splash/domain/repository/splash_repository.dart';

class IsOnboardingScreenUsecase {
  final SplashRepository repository;

  IsOnboardingScreenUsecase({required this.repository});

  Future<bool> isOnboarding() async {
    return await repository.isOnboardingScreen();
  }

}