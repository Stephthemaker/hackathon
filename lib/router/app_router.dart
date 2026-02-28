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

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
        GoRoute(path: '/staff', builder: (context, state) => const StaffPage()),
        GoRoute(
          path: '/research',
          builder: (context, state) => const ResearchPage(),
        ),
        GoRoute(
          path: '/programmes',
          builder: (context, state) => const ProgrammesPage(),
        ),
        GoRoute(
          path: '/news',
          builder: (context, state) => const NewsEventsPage(),
        ),
        GoRoute(
          path: '/resources',
          builder: (context, state) => const ResourcesPage(),
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => const ContactPage(),
        ),
      ],
    ),
  ],
);
