import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';
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
class _HeroSection extends StatelessWidget {
  const _HeroSection();

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
          Positioned.fill(
            child: AnimatedBuilder(
              animation: ScrollProvider.of(context),
              builder: (context, child) {
                final controller = ScrollProvider.of(context);
                final offset = controller.hasClients ? controller.offset : 0.0;
                return Transform.translate(
                  offset: Offset(0, -offset * 0.08),
                  child: child,
                );
              },
              child: AnimatedHeroBackground(height: isDesktop ? 752 : 592),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withValues(alpha: 0.88),
                    Colors.white.withValues(alpha: 0.94),
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
                              color: AppTheme.gold.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppTheme.gold.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Text(
                              'STELLENBOSCH UNIVERSITY',
                              style: GoogleFonts.openSans(
                                color: AppTheme.maroon,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          isDesktop
                              ? Text(
                                  'Department of\nComputer Science',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                        color: AppTheme.textDark,
                                        height: 1.05,
                                      ),
                                )
                              : Text(
                                  'Department of\nComputer Science',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        color: AppTheme.textDark,
                                        height: 1.1,
                                      ),
                                ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: isDesktop ? 520 : double.infinity,
                            child: Text(
                              'Advancing computing knowledge through world-class research, innovative education, and meaningful impact across Africa and beyond.',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: AppTheme.textMuted,
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
                                  child: const Text('Explore Programmes'),
                                ),
                              ),
                              SelectionContainer.disabled(
                                child: OutlinedButton(
                                  onPressed: () => context.go('/research'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppTheme.textDark,
                                    side: const BorderSide(
                                      color: AppTheme.textDark,
                                      width: 1.5,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 28,
                                      vertical: 18,
                                    ),
                                  ),
                                  child: const Text('Our Research'),
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
                      Text(
                        'scroll to explore',
                        textAlign: TextAlign.center,
                        style: AppTheme.uiControlText.copyWith(
                          color: AppTheme.textMuted,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppTheme.textMuted,
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

  static const _stats = [
    _Stat('40+', 'Academic Staff'),
    _Stat('800+', 'Students'),
    _Stat('30+', 'Research Projects'),
    _Stat('Top 5', 'In Africa*'),
  ];

  @override
  Widget build(BuildContext context) {
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
              children: _stats
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          label: 'About Us',
          title: 'A World-Class Department at Africa\'s Best University*',
        ),
        const SizedBox(height: 32),
        Text(
          'We are home to some of Africa\'s leading computer scientists, working at the intersection of theory, systems, AI, and societal impact.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
        Text(
          'The Department of Computer Science at Stellenbosch University has a proud tradition of rigorous academic training and pioneering research. Founded with a mission to advance the science and engineering of computing, the department today offers comprehensive undergraduate and postgraduate programmes that prepare graduates for careers in academia, industry, and public service across Africa and globally.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Text(
          'Our researchers contribute to a broad range of fields — from machine learning and theoretical computer science to bioinformatics, information security, and human-computer interaction. Collaboration with international universities, research councils, and industry partners keeps our work at the cutting edge.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 32),
        SelectionContainer.disabled(
          child: ElevatedButton(
            onPressed: () => launchUrl(
              Uri.parse('https://www.sun.ac.za/english/maties/apply'),
            ),
            child: const Text('Admissions Information'),
          ),
        ),
      ],
    );
  }
}

class _AboutHighlights extends StatelessWidget {
  static const _items = [
    _Highlight(
      Icons.emoji_events,
      'NRF-Rated Researchers',
      'Multiple internationally recognized scientists with National Research Foundation ratings.',
    ),
    _Highlight(
      Icons.hub,
      'Industry Partnerships',
      'Collaborations with Google, Microsoft, local banks, and government agencies.',
    ),
    _Highlight(
      Icons.public,
      'African Impact',
      'Research directly addressing African challenges in agriculture, health, and finance through technology.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _items
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

  static const _links = [
    _QLink(
      Icons.school,
      'Programmes',
      'BSc, Honours, Masters & PhD offerings.',
      '/programmes',
    ),
    _QLink(
      Icons.people_alt,
      'Faculty & Staff',
      'Meet our researchers and lecturers.',
      '/staff',
    ),
    _QLink(
      Icons.science,
      'Research',
      'Groups, labs, and publications.',
      '/research',
    ),
    _QLink(
      Icons.event,
      'News & Events',
      'Seminars, deadlines, and announcements.',
      '/news',
    ),
    _QLink(
      Icons.folder_open,
      'Resources',
      'Forms, FAQs, and student links.',
      '/resources',
    ),
    _QLink(Icons.location_on, 'Contact', 'Find us on campus.', '/contact'),
  ];

  @override
  Widget build(BuildContext context) {
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
                  child: const SectionHeading(
                    label: 'Navigate',
                    title: 'What are you looking for?',
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
                      children: _links
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
                'Learn more',
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

  static const _previews = [
    _NewsItem(
      'Prof. Smith\'s AI Lab receives R10M NRF Grant',
      'March 2026',
      'Research funding secured for a multi-year project on large language models for African languages.',
      Icons.science,
    ),
    _NewsItem(
      'CS Olympiad Finals — SU Students shine',
      'February 2026',
      'Three Stellenbosch teams place in the top ten at the national ACM ICPC Southern Africa regionals.',
      Icons.emoji_events,
    ),
    _NewsItem(
      'Upcoming: Research Colloquium 2026',
      '15 April 2026',
      'Annual internal research colloquium. All postgrad students are invited to submit abstracts by 30 March.',
      Icons.event,
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                      const SectionHeading(
                        label: 'Latest',
                        title: 'News & Events',
                      ),
                      SelectionContainer.disabled(
                        child: TextButton.icon(
                          onPressed: () => context.go('/news'),
                          icon: const Icon(Icons.arrow_forward, size: 16),
                          label: const Text('All news'),
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
                      children: _previews
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
