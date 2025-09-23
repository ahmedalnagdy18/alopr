import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrance {
  SharedPrefrance._();
  late SharedPreferences sharedPreferences;
  static final instanc = SharedPrefrance._();

  Future<void> initialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setOnboardingShown(bool value) async {
    await _ensureInitialized();
    return await sharedPreferences.setBool("onboarding_shown", value);
  }

  bool isOnboardingShown() {
    if (!isInitialized()) return false;
    return sharedPreferences.getBool("onboarding_shown") ?? false;
  }

  Future<bool> removeFromShared({required String key}) async {
    await _ensureInitialized();
    return sharedPreferences.remove(key);
  }

  bool isInitialized() {
    // ignore: unnecessary_null_comparison
    return sharedPreferences != null;
  }

  Future<void> _ensureInitialized() async {
    if (!isInitialized()) {
      await initialization();
    }
  }
}

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE", languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }
}
