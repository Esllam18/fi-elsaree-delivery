import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract final class FirstRunStorageKeys {
  static const locale = 'selected_locale';
  static const themeMode = 'selected_theme_mode';
  static const onboardingCompleted = 'onboarding_completed';
}

class FirstRunStorage {
  const FirstRunStorage(this._preferences);

  final SharedPreferences _preferences;

  String? get selectedLocale =>
      _preferences.getString(FirstRunStorageKeys.locale);

  bool get hasSelectedLocale => selectedLocale != null;

  ThemeMode? get selectedThemeMode {
    return switch (_preferences.getString(FirstRunStorageKeys.themeMode)) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => null,
    };
  }

  bool get hasSelectedTheme => selectedThemeMode != null;

  bool get onboardingCompleted =>
      _preferences.getBool(FirstRunStorageKeys.onboardingCompleted) ?? false;

  Future<void> saveLocale(String languageCode) =>
      _preferences.setString(FirstRunStorageKeys.locale, languageCode);

  Future<void> saveThemeMode(ThemeMode mode) => _preferences.setString(
        FirstRunStorageKeys.themeMode,
        mode == ThemeMode.dark ? 'dark' : 'light',
      );

  Future<void> completeOnboarding() =>
      _preferences.setBool(FirstRunStorageKeys.onboardingCompleted, true);
}
