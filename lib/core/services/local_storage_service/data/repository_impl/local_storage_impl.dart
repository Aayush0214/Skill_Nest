import '../../domain/repository/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorage {

  final SharedPreferences prefs;
  static const _onboardingKey = 'onboarding_shown';

  LocalStorageImpl({required this.prefs});

  @override
  Future<bool> get isOnboardingShown async => prefs.getBool(_onboardingKey) ?? false;

  @override
  Future<void> setOnboardingShown() async {
    await prefs.setBool(_onboardingKey, true);
  }
}