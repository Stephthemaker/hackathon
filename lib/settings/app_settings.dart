import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'translations.dart';

/// Holds all user-customisable settings and notifies listeners on change.
/// Settings are automatically cached in localStorage for persistence.
class AppSettings extends ChangeNotifier {
  AppLocale _locale = AppLocale.en;
  bool _darkMode = false;
  bool _highContrast = false;
  bool _reduceMotion = false;
  double _fontScale = 1.0; // 0.85, 1.0, 1.2

  static const _kLocale = 'app_locale';
  static const _kDarkMode = 'app_darkMode';
  static const _kHighContrast = 'app_highContrast';
  static const _kReduceMotion = 'app_reduceMotion';
  static const _kFontScale = 'app_fontScale';

  /// Load cached settings from localStorage.
  void loadFromStorage() {
    final storage = html.window.localStorage;
    final localeName = storage[_kLocale];
    if (localeName != null) {
      _locale = AppLocale.values.firstWhere(
        (l) => l.name == localeName,
        orElse: () => AppLocale.en,
      );
    }
    _darkMode = storage[_kDarkMode] == 'true';
    _highContrast = storage[_kHighContrast] == 'true';
    _reduceMotion = storage[_kReduceMotion] == 'true';
    final scaleStr = storage[_kFontScale];
    if (scaleStr != null) {
      _fontScale = double.tryParse(scaleStr) ?? 1.0;
    }
  }

  /// Persist current settings to localStorage.
  void _persist() {
    final storage = html.window.localStorage;
    storage[_kLocale] = _locale.name;
    storage[_kDarkMode] = _darkMode.toString();
    storage[_kHighContrast] = _highContrast.toString();
    storage[_kReduceMotion] = _reduceMotion.toString();
    storage[_kFontScale] = _fontScale.toString();
  }

  // ── Getters ──────────────────────────────────────────────────────────
  AppLocale get locale => _locale;
  bool get darkMode => _darkMode;
  bool get highContrast => _highContrast;
  bool get reduceMotion => _reduceMotion;
  double get fontScale => _fontScale;

  // ── Setters ──────────────────────────────────────────────────────────
  set locale(AppLocale v) {
    if (_locale != v) {
      _locale = v;
      _persist();
      notifyListeners();
    }
  }

  set darkMode(bool v) {
    if (_darkMode != v) {
      _darkMode = v;
      _persist();
      notifyListeners();
    }
  }

  set highContrast(bool v) {
    if (_highContrast != v) {
      _highContrast = v;
      _persist();
      notifyListeners();
    }
  }

  set reduceMotion(bool v) {
    if (_reduceMotion != v) {
      _reduceMotion = v;
      _persist();
      notifyListeners();
    }
  }

  set fontScale(double v) {
    if (_fontScale != v) {
      _fontScale = v;
      _persist();
      notifyListeners();
    }
  }

  /// Convenience translator
  String tr(String key) => translate(_locale, key);
}

/// InheritedNotifier so descendant widgets can call `AppSettings.of(context)`.
class AppSettingsProvider extends InheritedNotifier<AppSettings> {
  const AppSettingsProvider({
    super.key,
    required AppSettings settings,
    required super.child,
  }) : super(notifier: settings);

  static AppSettings of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppSettingsProvider>()!
        .notifier!;
  }
}
