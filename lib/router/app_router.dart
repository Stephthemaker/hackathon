import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/layout/app_shell.dart';
import '../pages/home_page.dart';
import '../pages/staff_page.dart';
import '../pages/research_page.dart';
import '../pages/programmes_page.dart';
import '../pages/programme_detail_page.dart';
import '../pages/news_events_page.dart';
import '../pages/news_detail_page.dart';
import '../pages/resources_page.dart';
import '../pages/contact_page.dart';
import '../pages/alumni_page.dart';
import '../pages/not_found_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

/// Wraps each page in a smooth fade + slide transition
CustomTransitionPage<void> _fadePage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 350),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.015),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
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
          routes: [
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) => _fadePage(
                state,
                ProgrammeDetailPage(id: state.pathParameters['id']!),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/news',
          pageBuilder: (context, state) =>
              _fadePage(state, const NewsEventsPage()),
          routes: [
            GoRoute(
              path: ':slug',
              pageBuilder: (context, state) => _fadePage(
                state,
                NewsDetailPage(slug: state.pathParameters['slug']!),
              ),
            ),
          ],
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
        GoRoute(
          path: '/alumni',
          pageBuilder: (context, state) => _fadePage(state, const AlumniPage()),
        ),
      ],
    ),
  ],
);
