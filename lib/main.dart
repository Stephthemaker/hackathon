import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'theme/app_theme.dart';
import 'router/app_router.dart';
import 'settings/app_settings.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _settings = AppSettings();

  @override
  void initState() {
    super.initState();
    _settings.addListener(_onSettingsChanged);
  }

  @override
  void dispose() {
    _settings.removeListener(_onSettingsChanged);
    _settings.dispose();
    super.dispose();
  }

  void _onSettingsChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    ThemeData theme;
    if (_settings.darkMode) {
      theme = _settings.highContrast
          ? AppTheme.highContrastDarkTheme
          : AppTheme.darkTheme;
    } else {
      theme = _settings.highContrast
          ? AppTheme.highContrastLightTheme
          : AppTheme.lightTheme;
    }

    return AppSettingsProvider(
      settings: _settings,
      child: MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(_settings.fontScale)),
        child: MaterialApp.router(
          title: 'CS Department - Stellenbosch University',
          theme: theme,
          routerConfig: goRouter,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
