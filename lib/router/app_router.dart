import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/layout/app_shell.dart';
import '../pages/home_page.dart';
import '../pages/staff_page.dart';
import '../pages/research_page.dart';
import '../pages/programmes_page.dart';
import '../pages/news_events_page.dart';
import '../pages/resources_page.dart';
import '../pages/contact_page.dart';
import '../pages/not_found_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

/// Wraps each page in a fade transition
CustomTransitionPage<void> _fadePage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 280),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundPage(),
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => _fadePage(state, const HomePage()),
        ),
        GoRoute(
          path: '/staff',
          pageBuilder: (context, state) => _fadePage(state, const StaffPage()),
        ),
        GoRoute(
          path: '/research',
          pageBuilder: (context, state) =>
              _fadePage(state, const ResearchPage()),
        ),
        GoRoute(
          path: '/programmes',
          pageBuilder: (context, state) =>
              _fadePage(state, const ProgrammesPage()),
        ),
        GoRoute(
          path: '/news',
          pageBuilder: (context, state) =>
              _fadePage(state, const NewsEventsPage()),
        ),
        GoRoute(
          path: '/resources',
          pageBuilder: (context, state) =>
              _fadePage(state, const ResourcesPage()),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) =>
              _fadePage(state, const ContactPage()),
        ),
      ],
    ),
  ],
);
