import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'theme/app_theme.dart';
import 'router/app_router.dart';
import 'settings/app_settings.dart';

void main() {
  usePathUrlStrategy();

  // Graceful error fallback instead of red error screen in production
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Something went wrong.\nPlease refresh the page.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ),
      ),
    );
  };

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
    _settings.loadFromStorage();
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
      child: MaterialApp.router(
        title: 'CS Department - Stellenbosch University',
        theme: theme,
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(_settings.fontScale)),
            child: child!,
          );
        },
      ),
    );
  }
}
