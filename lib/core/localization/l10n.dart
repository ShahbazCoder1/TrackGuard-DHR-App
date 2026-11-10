import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/app_language.dart';

class LanguageNotifier extends Notifier<AppLanguage> {
  static const String prefLanguageKey = 'user_selected_language';
  static AppLanguage? _cachedInitialLanguage;

  /// Sets the initial language discovered during app startup before first frame.
  static void setInitialLanguage(AppLanguage language) {
    _cachedInitialLanguage = language;
  }

  @override
  AppLanguage build() {
    if (_cachedInitialLanguage != null) {
      return _cachedInitialLanguage!;
    }
    // Asynchronous fallback in case main() could not read preferences in time
    _loadSavedLanguage();
    return AppLanguage.en;
  }

  Future<void> _loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final code = prefs.getString(prefLanguageKey);
      if (code != null) {
        final loaded = AppLanguage.fromCode(code);
        _cachedInitialLanguage = loaded;
        state = loaded;
      }
    } catch (e) {
      debugPrint('Error loading saved language preference: $e');
    }
  }

  Future<void> setLanguage(AppLanguage language) async {
    state = language;
    _cachedInitialLanguage = language;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(prefLanguageKey, language.code);
    } catch (e) {
      debugPrint('Error saving language preference: $e');
    }
  }
}

final appLanguageProvider = NotifierProvider<LanguageNotifier, AppLanguage>(() {
  return LanguageNotifier();
});

final currentLocaleProvider = Provider<Locale>((ref) {
  final lang = ref.watch(appLanguageProvider);
  return Locale(lang.code);
});
