import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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
      'A 3-year undergraduate degree building strong foundations in programming, mathematics, and computational thinking.',
      ['Programming', 'Mathematics', 'Data Structures', 'Algorithms'],
      '3 years full-time',
      'NSC with Mathematics \u2265 70%, English \u2265 60%',
      AppTheme.maroon,
    ),
    _Prog(
      'BScHons Computer Science',
      'An intensive honours year combining advanced coursework with a research project under faculty supervision.',
      ['Machine Learning', 'Software Eng', 'Research Project', 'Electives'],
      '1 year full-time',
      'BSc CS with \u2265 60% average in CS modules',
      AppTheme.gold,
    ),
    _Prog(
      'MSc Computer Science',
      'Thesis-based research degree supervised by internationally recognised faculty members.',
      ['Research Proposal', 'Publication', 'Thesis Defence'],
      '1\u20132 years',
      'BScHons CS with \u2265 65% average',
      Color(0xFF1D4ED8),
    ),
    _Prog(
      'PhD Computer Science',
      'Doctoral programme for candidates ready to push the boundaries of the field with original research.',
      ['Qualifying Exam', 'Dissertation', 'International Collab'],
      '3\u20135 years',
      'MSc CS or equivalent research degree',
      Color(0xFF2D6A4F),
    ),
  ];

  static const _modules = [
    // Year 1
    _Mod(
      'CS 114 \u2014 Introduction to Programming',
      'yr1',
      'Fundamentals of programming in Python. Variables, control flow, functions, basic OOP.',
      '16',
    ),
    _Mod(
      'CS 144 \u2014 Imperative Programming',
      'yr1',
      'C/C++ programming: pointers, memory management, file I/O, structured programming.',
      '16',
    ),
    // Year 2
    _Mod(
      'CS 214 \u2014 Data Structures & Algorithms',
      'yr2',
      'Arrays, linked lists, trees, graphs, sorting, searching. Big-O analysis and algorithmic design.',
      '16',
    ),
    _Mod(
      'CS 244 \u2014 Discrete Maths & Logic',
      'yr2',
      'Propositional logic, sets, relations, induction, combinatorics, graph theory.',
      '16',
    ),
    _Mod(
      'CS 274 \u2014 Computer Organisation',
      'yr2',
      'Digital logic, CPU architecture, assembly language, memory hierarchy.',
      '16',
    ),
    // Year 3
    _Mod(
      'CS 314 \u2014 Operating Systems',
      'yr3',
      'Processes, threading, memory management, file systems, synchronisation, virtual memory.',
      '16',
    ),
    _Mod(
      'CS 324 \u2014 Computer Networks',
      'yr3',
      'TCP/IP model, routing protocols, transport layer, network security basics.',
      '16',
    ),
    _Mod(
      'CS 334 \u2014 Compiler Construction',
      'yr3',
      'Lexical analysis, parsing, semantic analysis, code generation, optimisation.',
      '16',
    ),
    _Mod(
      'CS 344 \u2014 Databases',
      'yr3',
      'Relational model, SQL, normalisation, transactions, indexing, NoSQL intro.',
      '16',
    ),
    // Honours
    _Mod(
      'CS 414 \u2014 Machine Learning',
      'yr4',
      'Supervised & unsupervised learning, neural networks, evaluation metrics, deep learning intro.',
      '16',
    ),
    _Mod(
      'CS 424 \u2014 Software Engineering',
      'yr4',
      'Agile methodologies, design patterns, testing strategies, CI/CD, DevOps practices.',
      '16',
    ),
    _Mod(
      'CS 434 \u2014 Information Security',
      'yr4',
      'Cryptography, network security, ethical hacking, secure software development.',
      '16',
    ),
    _Mod(
      'CS 444 \u2014 Artificial Intelligence',
      'yr4',
      'Search algorithms, knowledge representation, planning, NLP, reinforcement learning.',
      '16',
    ),
    _Mod(
      'CS 454 \u2014 Capstone Research Project',
      'yr4',
      'Semester-long individual research project with published deliverable; industry or faculty supervisor.',
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
        : w > 800
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
                      style: GoogleFonts.openSans(
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
                const SizedBox(height: 64),
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
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.maroon, AppTheme.maroonDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ready to Apply?',
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 600,
            child: Text(
              'Applications for 2027 open on 1 March. Prepare your documents and apply online through the Stellenbosch University portal.',
              style: GoogleFonts.openSans(
                fontSize: 15,
                color: Colors.white.withValues(alpha: 0.8),
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              SelectionContainer.disabled(
                child: ElevatedButton.icon(
                  onPressed: () {
                    launchUrl(
                      Uri.parse(
                        'https://www.sun.ac.za/english/faculty/engineering/Pages/Apply.aspx',
                      ),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  icon: const Icon(Icons.launch, size: 16),
                  label: const Text('Apply Online'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.gold,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
              SelectionContainer.disabled(
                child: OutlinedButton.icon(
                  onPressed: () {
                    launchUrl(
                      Uri(
                        scheme: 'mailto',
                        path: 'stephhenning1@gmail.com',
                        queryParameters: {'subject': 'Admissions Enquiry'},
                      ),
                    );
                  },
                  icon: const Icon(Icons.email_outlined, size: 16),
                  label: const Text('Email Admissions'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
            ],
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

class _Prog {
  final String name, blurb;
  final List<String> highlights;
  final String duration;
  final String requirements;
  final Color accent;
  const _Prog(
    this.name,
    this.blurb,
    this.highlights,
    this.duration,
    this.requirements,
    this.accent,
  );
}

class _Mod {
  final String name, year, desc, credits;
  const _Mod(this.name, this.year, this.desc, this.credits);
}

class _ProgCard extends StatelessWidget {
  final _Prog prog;
  const _ProgCard({required this.prog});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${prog.name} details \u2014 coming soon'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: prog.accent.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: prog.accent.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.schedule, size: 13, color: prog.accent),
                      const SizedBox(width: 6),
                      Text(
                        prog.duration,
                        style: GoogleFonts.openSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: prog.accent,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.checklist,
                      size: 13,
                      color: AppTheme.textMuted,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        prog.requirements,
                        style: GoogleFonts.openSans(
                          fontSize: 11,
                          color: AppTheme.textMuted,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
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
                            style: GoogleFonts.openSans(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
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
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => controller.animateTo(e.key),
            child: SelectionContainer.disabled(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: sel ? AppTheme.maroon : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: sel ? AppTheme.maroon : AppTheme.divider,
                  ),
                ),
                child: Text(
                  e.value,
                  style: GoogleFonts.openSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: sel ? Colors.white : AppTheme.textDark,
                  ),
                ),
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
                      style: GoogleFonts.openSans(
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
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.gold.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${mod.credits} credits',
                    style: GoogleFonts.openSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.gold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
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
