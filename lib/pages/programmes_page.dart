import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
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
    _tabs = TabController(length: 3, vsync: this);
    _tabs.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  static const _programmes = [
    _Prog(
      'BEng (Hons) Computer Science',
      'Our flagship 4-year undergraduate degree combining rigorous theory with hands-on project work.',
      ['Theory', 'Systems', 'AI/ML', 'Capstone'],
      AppTheme.maroon,
    ),
    _Prog(
      'MEng Computer Science',
      'Thesis-based research degree supervised by our international faculty.',
      ['Research Proposal', 'Publication', 'Thesis Defence'],
      AppTheme.gold,
    ),
    _Prog(
      'PhD Computer Science',
      'Doctoral programme for candidates ready to push the boundaries of the field.',
      ['Qualifying Exam', 'Dissertation', 'International Collab'],
      Color(0xFF2D6A4F),
    ),
  ];

  static const _modules = [
    _Mod(
      'CS 214 — Data Structures & Algorithms',
      'yr1',
      'Arrays, linked lists, trees, graphs, sorting, searching. Big-O analysis.',
    ),
    _Mod(
      'CS 244 — Discrete Maths & Logic',
      'yr1',
      'Propositional logic, sets, relations, induction, combinatorics.',
    ),
    _Mod(
      'CS 314 — Operating Systems',
      'yr2',
      'Processes, threading, memory management, file systems, synchronisation.',
    ),
    _Mod(
      'CS 324 — Computer Networks',
      'yr2',
      'TCP/IP model, routing, transport layer, security basics.',
    ),
    _Mod(
      'CS 344 — Databases',
      'yr2',
      'Relational model, SQL, normalisation, transactions, NoSQL intro.',
    ),
    _Mod(
      'CS 414 — Machine Learning',
      'yr3',
      'Supervised & unsupervised learning, neural networks, evaluation.',
    ),
    _Mod(
      'CS 424 — Software Engineering',
      'yr3',
      'Agile, design patterns, testing strategies, DevOps practices.',
    ),
    _Mod(
      'CS 454 — Capstone Project',
      'yr3',
      'Real-world project in teams; external industry partners involved.',
    ),
  ];

  static const _tabKeys = ['yr1', 'yr2', 'yr3'];
  static const _tabLabels = ['Year 1 & 2', 'Year 2 & 3', 'Honours Year'];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w > 900
        ? 3
        : w > 600
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
                const SectionHeading(
                  label: 'Study',
                  title: 'Programmes & Courses',
                  subtitle:
                      'Undergraduate and postgraduate qualifications designed for the next generation of computer scientists.',
                ),
                const SizedBox(height: 48),
                _progGrid(cols),
                const SizedBox(height: 64),
                Row(
                  children: [
                    Container(width: 3, height: 24, color: AppTheme.gold),
                    const SizedBox(width: 12),
                    Text(
                      'Module Catalogue',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _ProgTabBar(controller: _tabs, labels: _tabLabels),
                const SizedBox(height: 24),
                ..._buildModules(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildModules() {
    final key = _tabKeys[_tabs.index];
    final mods = _modules.where((m) => m.year == key).toList();
    return mods.asMap().entries.map((e) {
      final id = Object.hash(key, e.key);
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
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

  Widget _progGrid(int cols) {
    final rows = <Widget>[];
    for (int i = 0; i < _programmes.length; i += cols) {
      final end = (i + cols < _programmes.length)
          ? i + cols
          : _programmes.length;
      final row = _programmes.sublist(i, end);
      final fill = cols - row.length;
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
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
              ...List.generate(fill, (_) => const Expanded(child: SizedBox())),
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}

class _Prog {
  final String name, blurb;
  final List<String> highlights;
  final Color accent;
  const _Prog(this.name, this.blurb, this.highlights, this.accent);
}

class _Mod {
  final String name, year, desc;
  const _Mod(this.name, this.year, this.desc);
}

class _ProgCard extends StatelessWidget {
  final _Prog prog;
  const _ProgCard({required this.prog});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: prog.accent,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prog.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  prog.blurb,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textMuted,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: prog.highlights
                      .map(
                        (h) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: prog.accent.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            h,
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: prog.accent,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.arrow_forward, size: 14, color: prog.accent),
                    const SizedBox(width: 6),
                    Text(
                      'Learn more',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: prog.accent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> labels;
  const _ProgTabBar({required this.controller, required this.labels});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: labels.asMap().entries.map((e) {
        final sel = controller.index == e.key;
        return GestureDetector(
          onTap: () => controller.animateTo(e.key),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
            decoration: BoxDecoration(
              color: sel ? AppTheme.maroon : Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: sel ? AppTheme.maroon : AppTheme.divider,
              ),
            ),
            child: Text(
              e.value,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: sel ? Colors.white : AppTheme.textDark,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ModuleRow extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppTheme.maroon.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.maroon,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    mod.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: isOpen ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppTheme.textMuted,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: isOpen
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(62, 0, 20, 16),
                    child: Text(
                      mod.desc,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textMuted,
                        height: 1.6,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
