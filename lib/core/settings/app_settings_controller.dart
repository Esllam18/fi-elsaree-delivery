import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/first_run_storage.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('SharedPreferences must be overridden.'),
);

final firstRunStorageProvider = Provider<FirstRunStorage>(
  (ref) => FirstRunStorage(ref.watch(sharedPreferencesProvider)),
);

@immutable
class AppSettingsState {
  const AppSettingsState({required this.locale, required this.themeMode});

  final Locale? locale;
  final ThemeMode themeMode;
}

class AppSettingsController extends Notifier<AppSettingsState> {
  FirstRunStorage get _storage => ref.read(firstRunStorageProvider);

  @override
  AppSettingsState build() => AppSettingsState(
        locale: _storage.selectedLocale == null
            ? null
            : Locale(_storage.selectedLocale!),
        themeMode: _storage.selectedThemeMode ?? ThemeMode.system,
      );

  Future<void> setLocale(Locale locale) async {
    await _storage.saveLocale(locale.languageCode);
    state = AppSettingsState(locale: locale, themeMode: state.themeMode);
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _storage.saveThemeMode(themeMode);
    state = AppSettingsState(locale: state.locale, themeMode: themeMode);
  }
}

final appSettingsProvider =
    NotifierProvider<AppSettingsController, AppSettingsState>(
  AppSettingsController.new,
);
