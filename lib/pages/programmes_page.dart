import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../settings/app_settings.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/section_heading.dart';

class ProgrammesPage extends StatefulWidget {
  const ProgrammesPage({super.key});
  @override
  State<ProgrammesPage> createState() => _ProgrammesPageState();
}

class _ProgrammesPageState extends State<ProgrammesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;
  int? _openModule;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
    _tabs.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  static const _programmes = [
    _Prog(
      'BSc Computer Science',
      'Undergraduate degrees including General CS, Computer Systems, Data Science, CS with Genetics, and CS with GIT.',
      ['Programming', 'Data Structures', 'Networks', 'Databases'],
      '3 years full-time',
      'NSC with required Mathematics & Physical Sciences',
      AppTheme.maroon,
      Icons.school_outlined,
      'Undergraduate',
    ),
    _Prog(
      'BScHons Computer Science',
      'An intensive 1-year programme combining 6 elective modules and a compulsory independent software or research project.',
      [
        'Advanced Algorithms',
        'Machine Learning',
        'Research Project',
        'Electives',
      ],
      '1 year full-time',
      'BSc CS with \u2265 60% average in CS modules',
      AppTheme.gold,
      Icons.workspace_premium_outlined,
      'Honours',
    ),
    _Prog(
      'MSc Computer Science',
      'Thesis-based research programme evaluated on independent research on an approved topic determined by the supervisor(s).',
      ['Independent Research', 'Thesis Defence'],
      '1\u20132 years',
      'BScHons CS with \u2265 60% average',
      Color(0xFF1D4ED8),
      Icons.biotech_outlined,
      'Postgraduate',
    ),
    _Prog(
      'PhD Computer Science',
      'Dissertation-based programme focused on proposing, conducting, and publishing original cutting-edge research.',
      ['Original Research', 'Dissertation', 'Publication'],
      '3\u20135 years',
      'MSc CS or equivalent research degree',
      Color(0xFF2D6A4F),
      Icons.emoji_events_outlined,
      'Doctoral',
    ),
  ];

  static const _modules = [
    _Mod(
      'CS 113 \u2014 CS for Actuarial Studies',
      'yr1',
      'Introduction to computer programming for actuarial science students.',
      '16',
    ),
    _Mod(
      'CS 114 \u2014 Introductory CS 1',
      'yr1',
      'Fundamentals of programming and computer science base principles.',
      '16',
    ),
    _Mod(
      'CS 144 \u2014 Introductory CS 2',
      'yr1',
      'Further concepts in computer science and programming methodologies.',
      '16',
    ),
    _Mod(
      'CSE 214 \u2014 Object-Oriented Programming',
      'yr2',
      'Object-oriented design, classes, interfaces, inheritance, polymorphism.',
      '16',
    ),
    _Mod(
      'CS 214 \u2014 Data Structures and Algorithms',
      'yr2',
      'Advanced data structures, algorithm analysis, sorting, and graph algorithms.',
      '16',
    ),
    _Mod(
      'CS 244 \u2014 Computer Architecture',
      'yr2',
      'Computer organization, low-level programming, machine architecture.',
      '16',
    ),
    _Mod(
      'CS 313 \u2014 Computer Networks',
      'yr3',
      'Network architectures, protocols, TCP/IP stack, and network applications.',
      '16',
    ),
    _Mod(
      'CS 314 \u2014 Concurrency',
      'yr3',
      'Concurrent programming, synchronization, threads, and parallel processing.',
      '16',
    ),
    _Mod(
      'CS 315 \u2014 Machine Learning',
      'yr3',
      'Introduction to machine learning algorithms, models, and data processing.',
      '16',
    ),
    _Mod(
      'CS 343 \u2014 Databases & Web Centric Programming',
      'yr3',
      'Database design, SQL, web development frameworks, and architectures.',
      '16',
    ),
    _Mod(
      'CS 344 \u2014 Program Design',
      'yr3',
      'Software engineering principles, design patterns, and large-scale software development.',
      '16',
    ),
    _Mod(
      'CS 345 \u2014 Computability and Automata Theory',
      'yr3',
      'Formal languages, automata, Turing machines, and computability.',
      '16',
    ),
    _Mod(
      'CS 712 \u2014 Advanced Algorithms',
      'yr4',
      'Advanced algorithmic paradigms, complexity classes, approximation algorithms.',
      '16',
    ),
    _Mod(
      'CS 716 \u2014 Adv. Topics I - Vulnerability Discovery',
      'yr4',
      'Computer security, vulnerability analysis, and exploitation techniques.',
      '16',
    ),
    _Mod(
      'CS 742 \u2014 Machine Learning A',
      'yr4',
      'Advanced machine learning topics, deep learning, and statistical models.',
      '16',
    ),
    _Mod(
      'CS 745 \u2014 Software Construction - Compilers',
      'yr4',
      'Compiler design, lexical analysis, parsing, and code generation.',
      '16',
    ),
    _Mod(
      'CS 771 \u2014 Honours Project in CS',
      'yr4',
      'Compulsory independent software or research project under faculty supervision.',
      '32',
    ),
  ];

  static const _tabKeys = ['yr1', 'yr2', 'yr3', 'yr4'];
  static const _tabLabels = ['1st Year', '2nd Year', '3rd Year', 'Honours'];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w > 1100
        ? 4
        : w > 700
        ? 2
        : 1;

    return Container(
      color: AppTheme.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (ctx) {
                    final s = AppSettingsProvider.of(ctx);
                    return SectionHeading(
                      label: s.tr('prog.label'),
                      title: s.tr('prog.title'),
                      subtitle: s.tr('prog.subtitle'),
                    );
                  },
                ),
                const SizedBox(height: 40),
                const _StatsBar(),
                const SizedBox(height: 60),
                _ProgGrid(programmes: _programmes, cols: cols),
                const SizedBox(height: 72),
                _ModuleCatalogueHeader(),
                const SizedBox(height: 24),
                _ProgTabBar(
                  controller: _tabs,
                  labels: _tabLabels,
                  counts: _tabKeys
                      .map((k) => _modules.where((m) => m.year == k).length)
                      .toList(),
                ),
                const SizedBox(height: 16),
                ..._buildModules(),
                const SizedBox(height: 72),
                _buildApplyCTA(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildApplyCTA(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.maroon, AppTheme.maroonDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            right: -40,
            top: -40,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.04),
              ),
            ),
          ),
          Positioned(
            right: 80,
            bottom: -60,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.gold.withValues(alpha: 0.12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 44),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 700;

                final leftColumn = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.gold.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppTheme.gold.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Text(
                        'Applications Open',
                        style: GoogleFonts.openSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.goldLight,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Ready to Apply?',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Applications for 2027 open on 1 March. Prepare your\ndocuments and apply online through the SU portal.',
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.white.withValues(alpha: 0.75),
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 28),
                    // Actions
                    Wrap(
                      spacing: 12,
                      runSpacing: 10,
                      children: [
                        SelectionContainer.disabled(
                          child: ElevatedButton.icon(
                            onPressed: () => launchUrl(
                              Uri.parse(
                                'https://www.sun.ac.za/english/faculty/engineering/Pages/Apply.aspx',
                              ),
                              mode: LaunchMode.externalApplication,
                            ),
                            icon: const Icon(Icons.launch_rounded, size: 15),
                            label: const Text('Apply Online'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.gold,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              textStyle: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SelectionContainer.disabled(
                          child: OutlinedButton.icon(
                            onPressed: () => launchUrl(
                              Uri(
                                scheme: 'mailto',
                                path: 'cs@sun.ac.za',
                                queryParameters: {
                                  'subject': 'Admissions Enquiry',
                                },
                              ),
                            ),
                            icon: const Icon(Icons.email_outlined, size: 15),
                            label: const Text('Email Admissions'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: BorderSide(
                                color: Colors.white.withValues(alpha: 0.35),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              textStyle: GoogleFonts.openSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );

                if (isWide) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: leftColumn),
                      const SizedBox(width: 40),
                      const _CTAChecklist(),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      leftColumn,
                      const SizedBox(height: 48),
                      const _CTAChecklist(),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildModules() {
    final key = _tabKeys[_tabs.index];
    final mods = _modules.where((m) => m.year == key).toList();
    return mods.asMap().entries.map((e) {
      final id = Object.hash(key, e.key);
      return Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: _ModuleRow(
          mod: e.value,
          index: e.key,
          isOpen: _openModule == id,
          onTap: () =>
              setState(() => _openModule = _openModule == id ? null : id),
        ),
      );
    }).toList();
  }
}

// ── Stats bar ──────────────────────────────────────────────────────────────

class _StatsBar extends StatelessWidget {
  const _StatsBar();

  static const _stats = [
    ('4', 'Degree Programmes', Icons.menu_book_outlined),
    ('17+', 'Modules Offered', Icons.grid_view_rounded),
    ('Top 3', 'CS Dept in Africa', Icons.emoji_events_outlined),
    ('1866', 'Year Established', Icons.account_balance_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;
        final isMedium = constraints.maxWidth > 500;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.divider),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 15,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: isWide
              ? Row(
                  children: _stats.asMap().entries.map((e) {
                    final isLast = e.key == _stats.length - 1;
                    return Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: _StatItem(
                              e.value.$1,
                              e.value.$2,
                              e.value.$3,
                            ),
                          ),
                          if (!isLast)
                            Container(
                              width: 1,
                              height: 40,
                              color: AppTheme.divider,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              : isMedium
              ? Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _StatItem(
                            _stats[0].$1,
                            _stats[0].$2,
                            _stats[0].$3,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: AppTheme.divider,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        Expanded(
                          child: _StatItem(
                            _stats[1].$1,
                            _stats[1].$2,
                            _stats[1].$3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(height: 1, color: AppTheme.divider),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _StatItem(
                            _stats[2].$1,
                            _stats[2].$2,
                            _stats[2].$3,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: AppTheme.divider,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        Expanded(
                          child: _StatItem(
                            _stats[3].$1,
                            _stats[3].$2,
                            _stats[3].$3,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: _stats.asMap().entries.map((e) {
                    final isLast = e.key == _stats.length - 1;
                    return Column(
                      children: [
                        _StatItem(e.value.$1, e.value.$2, e.value.$3),
                        if (!isLast)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(height: 1, color: AppTheme.divider),
                          ),
                      ],
                    );
                  }).toList(),
                ),
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value, label;
  final IconData icon;
  const _StatItem(this.value, this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.maroon.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: AppTheme.maroon),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppTheme.maroon,
                height: 1.1,
              ),
            ),
            Text(
              label,
              style: GoogleFonts.openSans(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppTheme.textMuted,
                height: 1.4,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Programme grid ─────────────────────────────────────────────────────────

class _ProgGrid extends StatelessWidget {
  final List<_Prog> programmes;
  final int cols;
  const _ProgGrid({required this.programmes, required this.cols});

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (int i = 0; i < programmes.length; i += cols) {
      final end = (i + cols < programmes.length) ? i + cols : programmes.length;
      final row = programmes.sublist(i, end);
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
                      child: _ProgCard(prog: e.value),
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

// ── Module catalogue header ────────────────────────────────────────────────

class _ModuleCatalogueHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 4, height: 32, color: AppTheme.gold),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Module Catalogue',
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: AppTheme.textDark,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Select a year to browse modules — tap any row to expand its description.',
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: AppTheme.textMuted,
                height: 1.4,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Data models ────────────────────────────────────────────────────────────

class _Prog {
  final String name, blurb;
  final List<String> highlights;
  final String duration;
  final String requirements;
  final Color accent;
  final IconData icon;
  final String level;
  const _Prog(
    this.name,
    this.blurb,
    this.highlights,
    this.duration,
    this.requirements,
    this.accent,
    this.icon,
    this.level,
  );
}

class _Mod {
  final String name, year, desc, credits;
  const _Mod(this.name, this.year, this.desc, this.credits);
}

// ── Programme card ─────────────────────────────────────────────────────────

class _ProgCard extends StatelessWidget {
  final _Prog prog;
  const _ProgCard({required this.prog});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${prog.name} details \u2014 coming soon'),
          duration: const Duration(seconds: 2),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.divider),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coloured header band
            Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              decoration: BoxDecoration(
                color: prog.accent.withValues(alpha: 0.07),
                border: Border(
                  bottom: BorderSide(
                    color: prog.accent.withValues(alpha: 0.15),
                  ),
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: prog.accent.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(prog.icon, size: 22, color: prog.accent),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: prog.accent.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            prog.level,
                            style: GoogleFonts.openSans(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.8,
                              color: prog.accent,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          prog.name,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textDark,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prog.blurb,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textMuted,
                      height: 1.65,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _InfoRow(
                    icon: Icons.schedule_rounded,
                    label: prog.duration,
                    color: prog.accent,
                  ),
                  const SizedBox(height: 8),
                  _InfoRow(
                    icon: Icons.checklist_rounded,
                    label: prog.requirements,
                    color: AppTheme.textMuted,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: prog.highlights
                        .map(
                          (h) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: prog.accent.withValues(alpha: 0.07),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: prog.accent.withValues(alpha: 0.18),
                              ),
                            ),
                            child: Text(
                              h,
                              style: GoogleFonts.openSans(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: prog.accent,
                              ),
                            ),
                          ),
                        )
                        .toList(),
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

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 14, color: color),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.openSans(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Tab bar ────────────────────────────────────────────────────────────────

class _ProgTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> labels;
  final List<int> counts;
  const _ProgTabBar({
    required this.controller,
    required this.labels,
    required this.counts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: labels.asMap().entries.map((e) {
          final sel = controller.index == e.key;
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => controller.animateTo(e.key),
              child: SelectionContainer.disabled(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: sel ? AppTheme.maroon : Colors.transparent,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        e.value,
                        style: GoogleFonts.openSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: sel ? Colors.white : AppTheme.textMuted,
                        ),
                      ),
                      const SizedBox(width: 6),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: sel
                              ? Colors.white.withValues(alpha: 0.2)
                              : AppTheme.maroon.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${counts[e.key]}',
                          style: GoogleFonts.openSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: sel ? Colors.white : AppTheme.maroon,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ── Module row ─────────────────────────────────────────────────────────────

class _ModuleRow extends StatefulWidget {
  final _Mod mod;
  final int index;
  final bool isOpen;
  final VoidCallback onTap;
  const _ModuleRow({
    required this.mod,
    required this.index,
    required this.isOpen,
    required this.onTap,
  });

  @override
  State<_ModuleRow> createState() => _ModuleRowState();
}

class _ModuleRowState extends State<_ModuleRow> {
  bool _isHovered = false;

  Color get _accentColor {
    final code = widget.mod.name
        .split(' ')
        .first
        .replaceAll(RegExp(r'[^0-9]'), '');
    final level = int.tryParse(code.isEmpty ? '0' : code[0]) ?? 0;
    return switch (level) {
      1 => AppTheme.maroon,
      2 => const Color(0xFF1D4ED8),
      3 => const Color(0xFF2D6A4F),
      _ => AppTheme.gold,
    };
  }

  @override
  Widget build(BuildContext context) {
    final accent = _accentColor;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          margin: EdgeInsets.only(bottom: widget.isOpen ? 12 : 6),
          decoration: BoxDecoration(
            color: widget.isOpen
                ? AppTheme.surface
                : (_isHovered
                      ? AppTheme.surface.withValues(alpha: 0.8)
                      : AppTheme.surface),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isOpen
                  ? accent.withValues(alpha: 0.3)
                  : (_isHovered
                        ? AppTheme.divider
                        : AppTheme.divider.withValues(alpha: 0.5)),
            ),
            boxShadow: [
              BoxShadow(
                color: widget.isOpen
                    ? accent.withValues(alpha: 0.08)
                    : Colors.black.withOpacity(_isHovered ? 0.05 : 0.02),
                blurRadius: widget.isOpen ? 20 : (_isHovered ? 12 : 8),
                offset: Offset(0, widget.isOpen ? 8 : 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: 4,
                      height: 32,
                      decoration: BoxDecoration(
                        color: widget.isOpen
                            ? accent
                            : accent.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        widget.mod.name,
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          fontWeight: widget.isOpen
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: widget.isOpen
                              ? AppTheme.textDark
                              : AppTheme.textDark.withValues(alpha: 0.9),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    _ModuleBadge(
                      label: '${widget.mod.credits} cr',
                      color: accent,
                    ),
                    const SizedBox(width: 12),
                    AnimatedRotation(
                      turns: widget.isOpen ? 0.5 : 0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOutBack,
                      child: Icon(
                        Icons.expand_more_rounded,
                        color: widget.isOpen ? accent : AppTheme.textMuted,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.isOpen)
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 1,
                        width: 40,
                        color: accent.withValues(alpha: 0.2),
                        margin: const EdgeInsets.only(bottom: 16),
                      ),
                      Text(
                        widget.mod.desc,
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: AppTheme.textDark.withValues(alpha: 0.75),
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModuleBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _ModuleBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Text(
        label,
        style: GoogleFonts.openSans(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

// ── CTA checklist panel ────────────────────────────────────────────────────

class _CTAChecklist extends StatelessWidget {
  const _CTAChecklist();

  static const _items = [
    'Certified academic transcripts',
    'National Senior Certificate',
    'South African ID or passport copy',
    'Proof of English proficiency',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Documents Required',
            style: GoogleFonts.openSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.9),
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 14),
          ..._items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppTheme.gold.withValues(alpha: 0.25),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 10,
                      color: AppTheme.goldLight,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.75),
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
