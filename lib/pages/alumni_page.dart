import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../settings/app_settings.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/section_heading.dart';
import '../ui/widgets/animated_section.dart';

class AlumniPage extends StatelessWidget {
  const AlumniPage({super.key});

  static const _alumni = [
    _Alumnus(
      name: 'Dr. Riaan Memory',
      graduation: 'BScHons 2013, MSc 2015',
      role: 'Staff ML Engineer, Google DeepMind',
      location: 'London, United Kingdom',
      testimonial:
          'The theoretical foundations I built at Stellenbosch CS — from automata theory to machine learning — gave me the confidence to tackle cutting-edge problems at DeepMind. The small class sizes meant real mentorship, not just lectures.',
      icon: Icons.memory,
    ),
    _Alumnus(
      name: 'Anja van Wyk',
      graduation: 'BSc 2016, BScHons 2017',
      role: 'Co-Founder & CTO, FinFlow',
      location: 'Cape Town, South Africa',
      testimonial:
          'The CS Division didn\'t just teach me to code — it taught me to think systematically about complex problems. The Honours project was the first time I felt like a real engineer, and it directly inspired me to start my own company.',
      icon: Icons.rocket_launch,
    ),
    _Alumnus(
      name: 'Sipho Ndlovu',
      graduation: 'PhD 2020',
      role: 'Assistant Professor, MIT CSAIL',
      location: 'Cambridge, MA, USA',
      testimonial:
          'Prof. Engelbrecht\'s supervision was outstanding. The rigorous research culture and the collaborative environment in Stellenbosch prepared me for a tenure-track position at MIT. I\'m forever grateful.',
      icon: Icons.school,
    ),
    _Alumnus(
      name: 'Leah Petersen',
      graduation: 'BSc 2018',
      role: 'Senior Software Engineer, Spotify',
      location: 'Stockholm, Sweden',
      testimonial:
          'The breadth of the CS curriculum — from networks to concurrency to machine learning — meant I graduated as a versatile engineer. The Industry Day event is where I first connected with the company that launched my career.',
      icon: Icons.headphones,
    ),
    _Alumnus(
      name: 'Marco de Villiers',
      graduation: 'MSc 2017',
      role: 'VP of Engineering, Luno',
      location: 'Johannesburg, South Africa',
      testimonial:
          'My Master\'s research in distributed systems at SU CS directly translated to building cryptocurrency infrastructure at Luno. The department punches way above its weight for research quality.',
      icon: Icons.currency_bitcoin,
    ),
    _Alumnus(
      name: 'Tasneem Adams',
      graduation: 'BScHons 2019',
      role: 'ML Research Scientist, Amazon',
      location: 'Seattle, WA, USA',
      testimonial:
          'The Honours programme\'s emphasis on independent research gave me skills that no bootcamp could. When I interviewed at Amazon, my project portfolio from SU was the differentiator.',
      icon: Icons.cloud,
    ),
  ];

  static const _stats = [
    ('95%', 'Employment Rate', 'Within 6 months of graduation'),
    ('45+', 'Countries', 'Where alumni are working'),
    ('R850K', 'Avg. Salary', 'For Honours graduates (3 yrs exp)'),
    ('300+', 'Companies', 'Hiring SU CS graduates'),
  ];

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    final w = MediaQuery.of(context).size.width;
    final cols = w > 1000
        ? 3
        : w > 650
        ? 2
        : 1;

    return SelectionArea(
      child: Container(
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
                    label: s.tr('alumni.label'),
                    title: s.tr('alumni.title'),
                    subtitle: s.tr('alumni.subtitle'),
                  ),
                  const SizedBox(height: 48),

                  // Stats bar
                  AnimatedSection(child: _AlumniStatsBar(stats: _stats)),
                  const SizedBox(height: 56),

                  // Section header
                  Row(
                    children: [
                      Container(width: 4, height: 24, color: AppTheme.gold),
                      const SizedBox(width: 12),
                      Text(
                        s.tr('alumni.stories.heading'),
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textDark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Alumni grid
                  _buildGrid(context, cols),
                  const SizedBox(height: 56),

                  // CTA
                  _AlumniCTA(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, int cols) {
    final rows = <Widget>[];
    for (int i = 0; i < _alumni.length; i += cols) {
      final end = (i + cols < _alumni.length) ? i + cols : _alumni.length;
      final row = _alumni.sublist(i, end);
      final fill = cols - row.length;
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...row.asMap().entries.map(
                  (e) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: e.key < row.length - 1 ? 20 : 0,
                      ),
                      child: AnimatedSection(
                        child: _AlumniCard(alumnus: e.value),
                      ),
                    ),
                  ),
                ),
                ...List.generate(
                  fill,
                  (_) => const Expanded(child: SizedBox()),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}

class _Alumnus {
  final String name, graduation, role, location, testimonial;
  final IconData icon;
  const _Alumnus({
    required this.name,
    required this.graduation,
    required this.role,
    required this.location,
    required this.testimonial,
    required this.icon,
  });
}

class _AlumniCard extends StatelessWidget {
  final _Alumnus alumnus;
  const _AlumniCard({required this.alumnus});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar + name
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.maroon, AppTheme.maroonDark],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(alumnus.icon, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        alumnus.name,
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textDark,
                        ),
                      ),
                      Text(
                        alumnus.graduation,
                        style: GoogleFonts.openSans(
                          fontSize: 11,
                          color: AppTheme.maroon,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Role + location
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.maroon.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    alumnus.role,
                    style: GoogleFonts.openSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: AppTheme.textMuted,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        alumnus.location,
                        style: GoogleFonts.openSans(
                          fontSize: 11,
                          color: AppTheme.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Quote
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.format_quote,
                    color: AppTheme.gold.withValues(alpha: 0.5),
                    size: 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    alumnus.testimonial,
                    style: GoogleFonts.openSans(
                      fontSize: 13,
                      color: AppTheme.textDark.withValues(alpha: 0.8),
                      height: 1.65,
                      fontStyle: FontStyle.italic,
                    ),
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

class _AlumniStatsBar extends StatelessWidget {
  final List<(String, String, String)> stats;
  const _AlumniStatsBar({required this.stats});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isWide = w > 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.maroon, AppTheme.maroonDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: isWide
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: stats
                  .map((s) => _StatColumn(value: s.$1, label: s.$2, sub: s.$3))
                  .toList(),
            )
          : Wrap(
              spacing: 32,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: stats
                  .map((s) => _StatColumn(value: s.$1, label: s.$2, sub: s.$3))
                  .toList(),
            ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String value, label, sub;
  const _StatColumn({
    required this.value,
    required this.label,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppTheme.goldLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          sub,
          style: GoogleFonts.openSans(
            fontSize: 11,
            color: Colors.white.withValues(alpha: 0.6),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _AlumniCTA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Column(
        children: [
          Text(
            s.tr('alumni.cta.title'),
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppTheme.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            s.tr('alumni.cta.body'),
            style: GoogleFonts.openSans(
              fontSize: 14,
              color: AppTheme.textMuted,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              launchUrl(
                Uri(
                  scheme: 'mailto',
                  path: 'cs@sun.ac.za',
                  queryParameters: {
                    'subject': 'Alumni Network — Staying Connected',
                  },
                ),
              );
            },
            icon: const Icon(Icons.email_outlined, size: 16),
            label: Text(s.tr('alumni.cta.btn')),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.maroon,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
