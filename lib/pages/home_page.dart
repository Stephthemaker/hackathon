import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';
import '../settings/app_settings.dart';
import '../ui/widgets/animated_section.dart';
import '../ui/widgets/section_heading.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/hero_background.dart';
import '../ui/layout/app_shell.dart';

// key used for scrolling to section below hero/stats
final GlobalKey _aboutKey = GlobalKey();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _HeroSection(),
        _StatsSection(),
        _AboutSection(key: _aboutKey),
        const _QuickLinksSection(),
        const _NewsPreviewSection(),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Hero
// ---------------------------------------------------------------------------
class _HeroSection extends StatefulWidget {
  const _HeroSection();

  @override
  State<_HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<_HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeCtrl;

  @override
  void initState() {
    super.initState();
    _fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..forward();
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;

    return Container(
      color: Colors.white,
      height: isDesktop
          ? 680 + 72
          : 520 + 72, // accommodate for nav bar overlay
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image with parallax
          Positioned.fill(
            child: AnimatedBuilder(
              animation: ScrollProvider.of(context),
              builder: (context, child) {
                final controller = ScrollProvider.of(context);
                final offset = controller.hasClients ? controller.offset : 0.0;
                final scale = 1.0 + (offset * 0.0003).clamp(0.0, 0.15);
                return Transform.scale(scale: scale, child: child);
              },
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: _fadeCtrl,
                  curve: Curves.easeOut,
                ),
                child: Image.asset(
                  'web/assets/general/stellenbosch-university-library-1.jpeg-1024x576.webp',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          // Animated hero background (particles overlay)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: ScrollProvider.of(context),
              builder: (context, child) {
                final controller = ScrollProvider.of(context);
                final offset = controller.hasClients ? controller.offset : 0.0;
                // Avoid translating to prevent border exposure; gently scale instead
                final scale = 1.0 + (offset * 0.0001).clamp(0.0, 0.05);
                return Transform.scale(scale: scale, child: child);
              },
              child: Opacity(
                opacity: 0.6,
                child: AnimatedHeroBackground(height: isDesktop ? 752 : 592),
              ),
            ),
          ),
          // Gradient overlays for text readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: const [0.0, 0.4, 0.8, 1.0],
                  colors: [
                    AppTheme.maroonDark.withValues(alpha: 0.95),
                    AppTheme.maroonDark.withValues(alpha: 0.80),
                    AppTheme.maroonDark.withValues(alpha: 0.40),
                    AppTheme.maroonDark.withValues(alpha: 0.10),
                  ],
                ),
              ),
            ),
          ),
          // Subtle vignette for depth
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.2,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.3),
                  ],
                ),
              ),
            ),
          ),
          // Text content and 3D Model
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 72,
                ), // Offset text down for the nav bar
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.gold.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppTheme.gold.withValues(alpha: 0.5),
                              ),
                            ),
                            child: Text(
                              AppSettingsProvider.of(context).tr('home.badge'),
                              style: GoogleFonts.openSans(
                                color: AppTheme.gold,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          isDesktop
                              ? Text(
                                  AppSettingsProvider.of(
                                    context,
                                  ).tr('home.title'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                        color: Colors.white,
                                        height: 1.05,
                                      ),
                                )
                              : Text(
                                  AppSettingsProvider.of(
                                    context,
                                  ).tr('home.title'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        height: 1.1,
                                      ),
                                ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: isDesktop ? 520 : double.infinity,
                            child: Text(
                              AppSettingsProvider.of(
                                context,
                              ).tr('home.subtitle'),
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: Colors.white.withValues(alpha: 0.85),
                                    fontSize: isDesktop ? 18 : 15,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Wrap(
                            spacing: 16,
                            runSpacing: 12,
                            children: [
                              SelectionContainer.disabled(
                                child: ElevatedButton(
                                  onPressed: () => context.go('/programmes'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.gold,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 18,
                                    ),
                                    elevation: 8,
                                    shadowColor: AppTheme.gold.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                  child: Builder(
                                    builder: (ctx) => Text(
                                      AppSettingsProvider.of(
                                        ctx,
                                      ).tr('home.btn.programmes'),
                                    ),
                                  ),
                                ),
                              ),
                              SelectionContainer.disabled(
                                child: OutlinedButton(
                                  onPressed: () => context.go('/research'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    side: const BorderSide(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 18,
                                    ),
                                  ),
                                  child: Builder(
                                    builder: (ctx) => Text(
                                      AppSettingsProvider.of(
                                        ctx,
                                      ).tr('home.btn.research'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Scroll hint
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // scroll passed stats to the about section
                    final contextToScroll = _aboutKey.currentContext;
                    if (contextToScroll != null) {
                      Scrollable.ensureVisible(
                        contextToScroll,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        alignment: 0.0,
                      );
                    } else {
                      // fallback to original hero offset
                      final controller = ScrollProvider.of(context);
                      final double offset = isDesktop ? (680 + 72) : (520 + 72);
                      controller.animateTo(
                        offset,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Column(
                    children: [
                      Builder(
                        builder: (context) {
                          return Text(
                            AppSettingsProvider.of(
                              context,
                            ).tr('home.scroll_explore'),
                            textAlign: TextAlign.center,
                            style: AppTheme.uiControlText.copyWith(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white.withValues(alpha: 0.7),
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Stats Counter Section
// ---------------------------------------------------------------------------
class _StatsSection extends StatelessWidget {
  const _StatsSection();

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    final stats = [
      _Stat('40+', s.tr('home.stats.academic')),
      _Stat('800+', s.tr('home.stats.students')),
      _Stat('30+', s.tr('home.stats.research')),
      _Stat('Top 5', s.tr('home.stats.inafrica')),
    ];

    return Container(
      color: AppTheme.maroon,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Wrap(
              spacing: 0,
              runSpacing: 24,
              alignment: WrapAlignment.spaceBetween,
              children: stats
                  .asMap()
                  .entries
                  .map(
                    (e) => AnimatedSection(
                      delay: Duration(milliseconds: 100 + e.key * 100),
                      child: SizedBox(
                        width: 200,
                        child: _StatItem(stat: e.value),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _Stat {
  final String value;
  final String label;
  const _Stat(this.value, this.label);
}

class _StatItem extends StatelessWidget {
  final _Stat stat;
  const _StatItem({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stat.value,
          style: GoogleFonts.playfairDisplay(
            fontSize: 44,
            fontWeight: FontWeight.w700,
            color: AppTheme.goldLight,
            height: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          stat.label,
          style: GoogleFonts.openSans(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.65),
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// About / Overview
// ---------------------------------------------------------------------------
class _AboutSection extends StatelessWidget {
  const _AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;
    return Container(
      color: Colors.transparent,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 96),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: AnimatedSection(child: _AboutText()),
                      ),
                      const SizedBox(width: 80),
                      Expanded(
                        flex: 4,
                        child: AnimatedSection(
                          delay: const Duration(milliseconds: 150),
                          child: _AboutHighlights(),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      AnimatedSection(child: _AboutText()),
                      const SizedBox(height: 48),
                      AnimatedSection(
                        delay: const Duration(milliseconds: 150),
                        child: _AboutHighlights(),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          label: s.tr('home.about.label2'),
          title: s.tr('home.about.title2'),
        ),
        const SizedBox(height: 32),
        Text(
          s.tr('home.about.p1'),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
        Text(
          s.tr('home.about.p2'),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Text(
          s.tr('home.about.p3'),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
        SelectionContainer.disabled(
          child: ElevatedButton(
            onPressed: () => launchUrl(
              Uri.parse('https://www.sun.ac.za/english/maties/apply'),
            ),
            child: Text(s.tr('home.about.btn_admissions')),
          ),
        ),
      ],
    );
  }
}

class _AboutHighlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    final items = [
      _Highlight(
        Icons.emoji_events,
        s.tr('home.about.h1.title'),
        s.tr('home.about.h1.body'),
      ),
      _Highlight(
        Icons.hub,
        s.tr('home.about.h2.title'),
        s.tr('home.about.h2.body'),
      ),
      _Highlight(
        Icons.public,
        s.tr('home.about.h3.title'),
        s.tr('home.about.h3.body'),
      ),
    ];

    return Column(
      children: items
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: AnimatedSection(
                delay: Duration(milliseconds: 200 + e.key * 120),
                child: HoverCard(
                  depth: 0.25,
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppTheme.maroon.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          e.value.icon,
                          color: AppTheme.maroon,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.value.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              e.value.body,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(height: 1.6),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _Highlight {
  final IconData icon;
  final String title;
  final String body;
  const _Highlight(this.icon, this.title, this.body);
}

// ---------------------------------------------------------------------------
// Quick Links
// ---------------------------------------------------------------------------
class _QuickLinksSection extends StatelessWidget {
  const _QuickLinksSection();

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    final links = [
      _QLink(
        Icons.school,
        s.tr('home.quick.prog.title'),
        s.tr('home.quick.prog.body'),
        '/programmes',
      ),
      _QLink(
        Icons.people_alt,
        s.tr('home.quick.staff.title'),
        s.tr('home.quick.staff.body'),
        '/staff',
      ),
      _QLink(
        Icons.science,
        s.tr('home.quick.research.title'),
        s.tr('home.quick.research.body'),
        '/research',
      ),
      _QLink(
        Icons.event,
        s.tr('home.quick.news.title'),
        s.tr('home.quick.news.body'),
        '/news',
      ),
      _QLink(
        Icons.folder_open,
        s.tr('home.quick.resources.title'),
        s.tr('home.quick.resources.body'),
        '/resources',
      ),
      _QLink(
        Icons.location_on,
        s.tr('home.quick.contact.title'),
        s.tr('home.quick.contact.body'),
        '/contact',
      ),
    ];

    return Container(
      color: AppTheme.maroon.withValues(alpha: 0.03),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              children: [
                AnimatedSection(
                  child: SectionHeading(
                    label: s.tr('home.quick.label'),
                    title: s.tr('home.quick.heading'),
                    alignment: CrossAxisAlignment.center,
                  ),
                ),
                const SizedBox(height: 48),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cols = constraints.maxWidth > 900
                        ? 3
                        : constraints.maxWidth > 600
                        ? 2
                        : 1;
                    return _ResponsiveGrid(
                      columns: cols,
                      children: links
                          .asMap()
                          .entries
                          .map(
                            (e) => AnimatedSection(
                              delay: Duration(milliseconds: 80 + e.key * 60),
                              child: _QuickLinkCard(link: e.value),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResponsiveGrid extends StatelessWidget {
  final int columns;
  final List<Widget> children;
  const _ResponsiveGrid({required this.columns, required this.children});

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (int i = 0; i < children.length; i += columns) {
      final row = children.sublist(i, math.min(i + columns, children.length));
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: row
                .asMap()
                .entries
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: e.key < row.length - 1 ? 20 : 0,
                        bottom: 20,
                      ),
                      child: e.value,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}

class _QLink {
  final IconData icon;
  final String title;
  final String body;
  final String route;
  const _QLink(this.icon, this.title, this.body, this.route);
}

class _QuickLinkCard extends StatelessWidget {
  final _QLink link;
  const _QuickLinkCard({required this.link});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      depth: 0.5,
      onTap: () => context.go(link.route),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.maroon,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(link.icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 20),
          Text(link.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            link.body,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.6),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                AppSettingsProvider.of(context).tr('home.quick.learn_more'),
                style: GoogleFonts.openSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.maroon,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_forward, size: 14, color: AppTheme.maroon),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// News Preview
// ---------------------------------------------------------------------------
class _NewsPreviewSection extends StatelessWidget {
  const _NewsPreviewSection();

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    final previews = [
      _NewsItem(
        s.tr('home.news.item1.title'),
        s.tr('home.news.item1.date'),
        s.tr('home.news.item1.body'),
        Icons.science,
      ),
      _NewsItem(
        s.tr('home.news.item2.title'),
        s.tr('home.news.item2.date'),
        s.tr('home.news.item2.body'),
        Icons.emoji_events,
      ),
      _NewsItem(
        s.tr('home.news.item3.title'),
        s.tr('home.news.item3.date'),
        s.tr('home.news.item3.body'),
        Icons.event,
      ),
    ];

    return Container(
      color: Colors.transparent,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedSection(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHeading(
                        label: s.tr('home.news.label'),
                        title: s.tr('home.news.title'),
                      ),
                      SelectionContainer.disabled(
                        child: TextButton.icon(
                          onPressed: () => context.go('/news'),
                          icon: const Icon(Icons.arrow_forward, size: 16),
                          label: Text(s.tr('home.news.all_news')),
                          style: TextButton.styleFrom(
                            foregroundColor: AppTheme.maroon,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cols = constraints.maxWidth > 900 ? 3 : 1;
                    return _ResponsiveGrid(
                      columns: cols,
                      children: previews
                          .asMap()
                          .entries
                          .map(
                            (e) => AnimatedSection(
                              delay: Duration(milliseconds: 100 + e.key * 100),
                              child: _NewsCard(item: e.value),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NewsItem {
  final String title;
  final String date;
  final String body;
  final IconData icon;
  const _NewsItem(this.title, this.date, this.body, this.icon);
}

class _NewsCard extends StatelessWidget {
  final _NewsItem item;
  const _NewsCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      depth: 0.3,
      onTap: () => context.go('/news'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: AppTheme.maroon,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(item.icon, color: AppTheme.gold, size: 48),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.date,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    color: AppTheme.gold,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(height: 1.4),
                ),
                const SizedBox(height: 10),
                Text(
                  item.body,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.6),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
