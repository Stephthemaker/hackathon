import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_theme.dart';
import '../widgets/footer.dart';
import '../widgets/app_background_3d.dart';

class ScrollProvider extends InheritedNotifier<ScrollController> {
  const ScrollProvider({
    super.key,
    required ScrollController controller,
    required super.child,
  }) : super(notifier: controller);

  static ScrollController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ScrollProvider>()!
        .notifier!;
  }
}

class AppShell extends StatefulWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  bool _scrolled = false;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onGlobalScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onGlobalScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Scroll to top when the page (child) changes
    if (oldWidget.child != widget.child) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    }
  }

  void _onGlobalScroll() {
    final wasScrolled = _scrolled;
    _scrolled = _scrollController.hasClients && _scrollController.offset > 10;
    if (_scrolled != wasScrolled) {
      setState(() {});
    }
  }

  static const _navItems = [
    _NavItem('Overview', '/'),
    _NavItem('Staff', '/staff'),
    _NavItem('Research', '/research'),
    _NavItem('Programmes', '/programmes'),
    _NavItem('News & Events', '/news'),
    _NavItem('Resources', '/resources'),
    _NavItem('Contact', '/contact'),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;
    final currentPath = GoRouterState.of(context).uri.path;

    return SelectionArea(
      child: Scaffold(
        backgroundColor: AppTheme.background,
        drawer: isDesktop
            ? null
            : _MobileDrawer(navItems: _navItems, currentPath: currentPath),
        body: ScrollProvider(
          controller: _scrollController,
          child: Stack(
            children: [
              // 3D background that animates natively on scroll
              const Positioned.fill(child: Global3DBackground()),
              // Scrollable content
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(children: [widget.child, const SiteFooter()]),
              ),
              // Sticky nav bar on top
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _NavBar(
                  scrollController: _scrollController,
                  isDesktop: isDesktop,
                  scrolled: _scrolled,
                  navItems: _navItems,
                  currentPath: currentPath,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Nav Bar
// ---------------------------------------------------------------------------
class _NavBar extends StatelessWidget {
  final ScrollController scrollController;
  final bool isDesktop;
  final bool scrolled;
  final List<_NavItem> navItems;
  final String currentPath;

  const _NavBar({
    required this.scrollController,
    required this.isDesktop,
    required this.scrolled,
    required this.navItems,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxNavWidth = 1280.0;

    double edgeSpacing = 0.0;
    if (screenWidth > maxNavWidth) {
      edgeSpacing = (screenWidth - maxNavWidth) / 2;
    }

    double currentMargin = 0.0;
    double currentPadding = 32.0;

    if (scrolled) {
      currentMargin = isDesktop
          ? (edgeSpacing > 32.0 ? edgeSpacing : 32.0)
          : 16.0;
      currentPadding = isDesktop ? 32.0 : 20.0;
    } else {
      currentMargin = 0.0;
      currentPadding = edgeSpacing > 0 ? edgeSpacing + 32.0 : 32.0;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 450),
      curve: Curves.fastLinearToSlowEaseIn,
      height: 72,
      margin: EdgeInsets.only(
        top: scrolled ? 16 : 0,
        left: currentMargin,
        right: currentMargin,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 450),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(scrolled ? 16 : 0),
          border: Border.all(
            color: scrolled
                ? Colors.white.withValues(alpha: 0.16)
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(scrolled ? 16 : 0),
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 450),
            curve: Curves.fastLinearToSlowEaseIn,
            tween: Tween<double>(begin: 0.001, end: scrolled ? 24.0 : 0.001),
            builder: (context, sigma, child) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
                child: child,
              );
            },
            child: AnimatedBuilder(
              animation: scrollController,
              builder: (context, child) {
                final double dynamicAlpha = 0.95;
                return Container(
                  color: AppTheme.maroon.withValues(alpha: dynamicAlpha),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 450),
                    curve: Curves.fastLinearToSlowEaseIn,
                    padding: EdgeInsets.symmetric(horizontal: currentPadding),
                    child: child,
                  ),
                );
              },
              child: Row(
                children: [
                  // Logo
                  _NavLogo(),
                  const Spacer(),
                  if (isDesktop)
                    ...navItems.map(
                      (item) => _NavButtonDesktop(
                        item: item,
                        isActive: currentPath == item.route,
                      ),
                    )
                  else
                    Builder(
                      builder: (ctx) => IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(ctx).openDrawer(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLogo extends StatefulWidget {
  @override
  State<_NavLogo> createState() => _NavLogoState();
}

class _NavLogoState extends State<_NavLogo> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go('/'),
        child: SelectionContainer.disabled(
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 42,
                height: 42,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: SvgPicture.asset(
                  'assets/general/logo.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Computer Science',
                    style: AppTheme.uiControlText.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                  Text(
                    'Stellenbosch University',
                    style: AppTheme.uiControlText.copyWith(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButtonDesktop extends StatefulWidget {
  final _NavItem item;
  final bool isActive;
  const _NavButtonDesktop({required this.item, required this.isActive});

  @override
  State<_NavButtonDesktop> createState() => _NavButtonDesktopState();
}

class _NavButtonDesktopState extends State<_NavButtonDesktop> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(widget.item.route),
        child: SelectionContainer.disabled(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 150),
                  style: AppTheme.uiControlText.copyWith(
                    fontSize: 13.5,
                    fontWeight: widget.isActive
                        ? FontWeight.w700
                        : FontWeight.w400,
                    color: widget.isActive || _hovered
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.7),
                  ),
                  child: Text(widget.item.title),
                ),
                const SizedBox(height: 3),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  height: 2,
                  width: widget.isActive ? 24 : (_hovered ? 12 : 0),
                  decoration: BoxDecoration(
                    color: AppTheme.gold,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Mobile Drawer
// ---------------------------------------------------------------------------
class _MobileDrawer extends StatelessWidget {
  final List<_NavItem> navItems;
  final String currentPath;

  const _MobileDrawer({required this.navItems, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.maroonDark,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 56, 24, 24),
            color: AppTheme.maroon,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.gold,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.memory,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Computer Science',
                  style: AppTheme.uiControlText.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Stellenbosch University',
                  style: AppTheme.uiControlText.copyWith(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ...navItems.map((item) {
            final isActive = currentPath == item.route;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: isActive
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                dense: true,
                leading: Container(
                  width: 3,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isActive ? AppTheme.gold : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                title: Text(
                  item.title,
                  style: AppTheme.uiControlText.copyWith(
                    color: isActive
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.7),
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                onTap: () {
                  context.go(item.route);
                  Navigator.pop(context);
                },
              ),
            );
          }),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '+27 21 808 4232\ncs@sun.ac.za',
              style: AppTheme.uiControlText.copyWith(
                color: Colors.white.withValues(alpha: 0.35),
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final String title;
  final String route;
  const _NavItem(this.title, this.route);
}
