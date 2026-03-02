import 'package:flutter/material.dart';
import 'translations.dart';

/// Holds all user-customisable settings and notifies listeners on change.
class AppSettings extends ChangeNotifier {
  AppLocale _locale = AppLocale.en;
  bool _darkMode = false;
  bool _highContrast = false;
  bool _reduceMotion = false;
  double _fontScale = 1.0; // 0.85, 1.0, 1.2

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
      notifyListeners();
    }
  }

  set darkMode(bool v) {
    if (_darkMode != v) {
      _darkMode = v;
      notifyListeners();
    }
  }

  set highContrast(bool v) {
    if (_highContrast != v) {
      _highContrast = v;
      notifyListeners();
    }
  }

  set reduceMotion(bool v) {
    if (_reduceMotion != v) {
      _reduceMotion = v;
      notifyListeners();
    }
  }

  set fontScale(double v) {
    if (_fontScale != v) {
      _fontScale = v;
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
