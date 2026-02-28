import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';
import '../widgets/footer.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  bool _scrolled = false;

  void _onScroll(ScrollUpdateNotification n) {
    final wasScrolled = _scrolled;
    _scrolled = n.metrics.pixels > 10;
    if (_scrolled != wasScrolled) setState(() {});
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

    return Scaffold(
      backgroundColor: AppTheme.background,
      drawer: isDesktop
          ? null
          : _MobileDrawer(navItems: _navItems, currentPath: currentPath),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (n) {
          _onScroll(n);
          return false;
        },
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  // Top spacer so content doesn't hide under nav
                  const SizedBox(height: 72),
                  widget.child,
                  const SiteFooter(),
                ],
              ),
            ),
            // Sticky nav bar on top
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _NavBar(
                isDesktop: isDesktop,
                scrolled: _scrolled,
                navItems: _navItems,
                currentPath: currentPath,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Nav Bar
// ---------------------------------------------------------------------------
class _NavBar extends StatelessWidget {
  final bool isDesktop;
  final bool scrolled;
  final List<_NavItem> navItems;
  final String currentPath;

  const _NavBar({
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 450),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
              color: scrolled
                  ? AppTheme.maroon.withValues(
                      alpha: 0.35,
                    ) // Reduced maroon coloring for better glass
                  : AppTheme.maroon,
              border: scrolled
                  ? Border.all(
                      color: Colors.white.withValues(alpha: 0.15),
                      width: 1,
                    )
                  : Border.all(color: Colors.transparent, width: 0),
            ),
            padding: EdgeInsets.symmetric(horizontal: currentPadding),
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
    );
  }
}

class _NavLogo extends StatefulWidget {
  @override
  State<_NavLogo> createState() => _NavLogoState();
}

class _NavLogoState extends State<_NavLogo> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => context.go('/'),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _hovered ? AppTheme.goldLight : AppTheme.gold,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.memory, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Computer Science',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
                Text(
                  'Stellenbosch University',
                  style: GoogleFonts.inter(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 11,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ],
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 150),
                style: GoogleFonts.inter(
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
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Stellenbosch University',
                  style: GoogleFonts.inter(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 13,
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
                  style: GoogleFonts.inter(
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
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.35),
                fontSize: 13,
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
