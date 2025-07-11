import '../../../../core/services/local_storage_service/domain/repository/local_storage.dart';

abstract interface class SplashLocalDataSource {
  Future<bool> isOnboardingScreen();
}

class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  final LocalStorage localStorage;

  SplashLocalDataSourceImpl({required this.localStorage});

  @override
  Future<bool> isOnboardingScreen() async {
    return await localStorage.isOnboardingShown;
  }
}