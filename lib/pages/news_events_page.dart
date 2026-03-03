import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../settings/app_settings.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/section_heading.dart';

class NewsEventsPage extends StatefulWidget {
  const NewsEventsPage({super.key});
  @override
  State<NewsEventsPage> createState() => _NewsEventsPageState();
}

class _NewsEventsPageState extends State<NewsEventsPage> {
  String _cat = 'All';

  static const _cats = [
    'All',
    'Research',
    'Awards',
    'Events',
    'Student Life',
    'Industry',
  ];

  static const _catTranslationKeys = {
    'All': 'news.cat.all',
    'Research': 'news.cat.research',
    'Awards': 'news.cat.awards',
    'Events': 'news.cat.events',
    'Student Life': 'news.cat.student_life',
    'Industry': 'news.cat.industry',
  };

  static const _news = [
    _NI(
      'Prof. Fourie receives NRF A-rating',
      'Research',
      'The NRF has awarded an A-rating to Prof Johan Fourie for groundbreaking work in African-language NLP.',
      '12 Jun 2026',
      slug: 'prof-fourie-nrf-a-rating',
    ),
    _NI(
      'CS students win DevSoc Hackathon 2026',
      'Awards',
      'Two teams swept the top spots at the DevSoc 24-hour hackathon with AI-powered solutions.',
      '4 May 2026',
      slug: 'cs-students-win-devsoc-hackathon',
    ),
    _NI(
      'New AI Lab opens in Engineering A Building',
      'Research',
      'The department inaugurates a state-of-the-art GPU cluster lab for large-scale model training.',
      '28 Apr 2026',
      slug: 'new-ai-lab-opens',
    ),
    _NI(
      'Industry Day 2026 — over 40 companies attending',
      'Industry',
      'Our annual Industry Day connects final-year students with top tech employers across the Western Cape.',
      '15 Mar 2026',
      slug: 'industry-day-2026',
    ),
    _NI(
      'Undergraduate open day report',
      'Events',
      'Over 800 prospective students visited campus; virtual sessions drew another 1,200 attendees online.',
      '5 Mar 2026',
      slug: 'undergraduate-open-day',
    ),
    _NI(
      'PhD student publishes in Nature Machine Intelligence',
      'Research',
      'Doctoral candidate Lena Botha co-authored a landmark paper on federated learning for medical imaging.',
      '20 Feb 2026',
      slug: 'phd-nature-machine-intelligence',
    ),
  ];

  static const _events = [
    _EV('22 AUG', 'Research Colloquium', 'Engineering A, Room 201'),
    _EV('5 SEP', 'Panel: AI Ethics', 'Online — Zoom'),
    _EV('18 SEP', 'Industry Day 2026', 'Neelsie Student Centre'),
    _EV('3 OCT', 'Honours Project Showcase', 'CS Building Atrium'),
    _EV('10 OCT', 'DevSoc Hackathon', 'Various Venues'),
    _EV('14 NOV', 'Graduation Ceremony', 'HB Thom Theatre'),
  ];

  List<_NI> get _filtered =>
      _cat == 'All' ? _news : _news.where((n) => n.cat == _cat).toList();

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    final w = MediaQuery.sizeOf(context).width;
    final wide = w > 860;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeading(
                  label: AppSettingsProvider.of(context).tr('news.label'),
                  title: AppSettingsProvider.of(context).tr('news.title'),
                  subtitle: AppSettingsProvider.of(context).tr('news.subtitle'),
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _cats
                      .map(
                        (c) => _CatChip(
                          label: s.tr(_catTranslationKeys[c] ?? c),
                          selected: _cat == c,
                          onTap: () => setState(() => _cat = c),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 40),
                if (wide)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 7, child: _NewsList(items: _filtered)),
                      const SizedBox(width: 32),
                      SizedBox(
                        width: 280,
                        child: _EventsSidebar(events: _events),
                      ),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _NewsList(items: _filtered),
                      const SizedBox(height: 40),
                      _EventsSidebar(events: _events),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NI {
  final String title, cat, blurb, date;
  final String slug;
  const _NI(this.title, this.cat, this.blurb, this.date, {this.slug = ''});
}

class _EV {
  final String date, name, location;
  const _EV(this.date, this.name, this.location);
}

class _CatChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _CatChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: SelectionContainer.disabled(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: selected
                    ? AppTheme.maroon
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected
                      ? AppTheme.maroon
                      : Theme.of(context).dividerColor,
                ),
              ),
              child: Text(
                label,
                style: GoogleFonts.openSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: selected
                      ? Colors.white
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NewsList extends StatelessWidget {
  final List<_NI> items;
  const _NewsList({required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Text(
          AppSettingsProvider.of(context).tr('news.empty'),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (n) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _NewsCard(item: n),
            ),
          )
          .toList(),
    );
  }
}

class _NewsCard extends StatelessWidget {
  final _NI item;
  const _NewsCard({required this.item});

  static const _catColors = {
    'Research': AppTheme.maroon,
    'Awards': Color(0xFFB45309),
    'Events': Color(0xFF1D4ED8),
    'Student Life': Color(0xFF15803D),
    'Industry': Color(0xFF6D28D9),
  };

  @override
  Widget build(BuildContext context) {
    final color = _catColors[item.cat] ?? AppTheme.maroon;
    return HoverCard(
      onTap: item.slug.isNotEmpty
          ? () => context.go('/news/${item.slug}')
          : null,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 72,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          AppSettingsProvider.of(context).tr(
                            _NewsEventsPageState._catTranslationKeys[item
                                    .cat] ??
                                item.cat,
                          ),
                          style: GoogleFonts.openSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: color,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        item.date,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.blurb,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      height: 1.6,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EventsSidebar extends StatelessWidget {
  final List<_EV> events;
  const _EventsSidebar({required this.events});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 3, height: 20, color: AppTheme.gold),
            const SizedBox(width: 10),
            Text(
              AppSettingsProvider.of(context).tr('news.events.heading'),
              style: GoogleFonts.openSans(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...events.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: HoverCard(
              onTap: null,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppTheme.maroon,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          e.date,
                          style: GoogleFonts.openSans(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.name,
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            e.location,
                            style: GoogleFonts.openSans(
                              fontSize: 11,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Semantics(
                            link: true,
                            label: 'Add ${e.name} to calendar',
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  // Google Calendar "Add Event" URL
                                  final title = Uri.encodeComponent(e.name);
                                  final location = Uri.encodeComponent(
                                    e.location,
                                  );
                                  final url =
                                      'https://calendar.google.com/calendar/render?action=TEMPLATE&text=$title&location=$location&details=CS+Department+Event';
                                  launchUrl(
                                    Uri.parse(url),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 11,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      AppSettingsProvider.of(
                                        context,
                                      ).tr('news.events.add_cal'),
                                      style: GoogleFonts.openSans(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
