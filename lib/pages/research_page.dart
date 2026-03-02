import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/section_heading.dart';

class ResearchPage extends StatefulWidget {
  const ResearchPage({super.key});
  @override
  State<ResearchPage> createState() => _ResearchPageState();
}

class _ResearchPageState extends State<ResearchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

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

  @override
  Widget build(BuildContext context) {
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
                  label: 'Research',
                  title: 'Advancing the Field',
                  subtitle:
                      'Our researchers publish, collaborate, and innovate across four primary research groups and centres.',
                ),
                const SizedBox(height: 40),
                _ResearchTabBar(
                  controller: _tabs,
                  tabs: const [
                    'Research Groups',
                    'Publications',
                    'Labs & Centres',
                  ],
                ),
                const SizedBox(height: 40),
                [
                  const _GroupsTab(),
                  const _PublicationsTab(),
                  const _LabsTab(),
                ][_tabs.index],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Tab Bar ─────────────────────────────────────────────────────────────────
class _ResearchTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;
  const _ResearchTabBar({required this.controller, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: tabs.asMap().entries.map((e) {
        final sel = controller.index == e.key;
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => controller.animateTo(e.key),
            child: SelectionContainer.disabled(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
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

// ── Research Groups ──────────────────────────────────────────────────────────
class _GroupsTab extends StatelessWidget {
  static const _groups = [
    _RG(
      'Theory and Applications of Automata',
      Icons.functions,
      [
        'Descriptional Complexity',
        'Cellular Automata',
        'Probabilistic Automata',
        'Grammar Theory',
      ],
      'Focusing on the theory of nondeterministic finite automata and extending automata and grammar theories for novel practical applications.',
    ),
    _RG(
      'Software Engineering & Verification',
      Icons.developer_mode,
      [
        'System Verification',
        'Kernel Development',
        'Defensive Programming',
        'COASTAL Tool',
      ],
      'Investigating the development of highly reliable system software by combining computer-aided verification of designs and systematic testing.',
    ),
    _RG(
      'Machine Learning & Artificial Intelligence',
      Icons.psychology,
      [
        'Uncertainty Management',
        'Game Theory',
        'Big Data Analysis',
        'Search Algorithms',
      ],
      'Studying general decision-making problems, handling sequential decisions under uncertainty, and the intersection of machine learning with big data.',
    ),
    _RG(
      'Broadband Networks & Telecommunications',
      Icons.lan,
      [
        'ATM Networks',
        'Broadband Tech',
        'Protocol Applications',
        'Professional Training',
      ],
      'The Telkom-Siemens Centre of Excellence promoting research, development, and advanced academic training in broadband technologies.',
    ),
  ];

  const _GroupsTab();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w > 900 ? 2 : 1;
    return _SimpleGrid(
      cols: cols,
      gap: 20,
      children: _groups.map((g) => _GroupCard(g: g)).toList(),
    );
  }
}

class _RG {
  final String name, blurb;
  final IconData icon;
  final List<String> tags;
  const _RG(this.name, this.icon, this.tags, this.blurb);
}

class _GroupCard extends StatelessWidget {
  final _RG g;
  const _GroupCard({required this.g});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      depth: 0.3,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${g.name} group details — coming soon'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.maroon.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(g.icon, color: AppTheme.maroon, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    g.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              g.blurb,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.6,
                color: AppTheme.textMuted,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: g.tags.map((t) => _ResearchTag(t)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResearchTag extends StatelessWidget {
  final String label;
  const _ResearchTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.gold.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppTheme.gold.withValues(alpha: 0.25)),
      ),
      child: Text(
        label,
        style: GoogleFonts.openSans(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppTheme.gold,
        ),
      ),
    );
  }
}

// ── Publications ─────────────────────────────────────────────────────────────
class _PublicationsTab extends StatelessWidget {
  static const _pubs = [
    _Pub(
      '2024',
      'LLM-based Code Review Automation for Enterprise Pipelines',
      'Fourie J., Muller A., van Zyl T.',
      'IEEE Transactions on Software Engineering',
      'Q1',
    ),
    _Pub(
      '2024',
      'Quantum Automata and the Complexity of Language Emptiness',
      'van der Merwe B., Pieterse A.',
      'STACS Proceedings',
      'A*',
    ),
    _Pub(
      '2023',
      'Federated Learning for Privacy-Preserving Medical Image Analysis',
      'Mokoena T., Kamfer H., de Wet R.',
      'Nature Machine Intelligence',
      'Q1',
    ),
    _Pub(
      '2023',
      'StellenBosch: An Afrikaans-English Parallel NLP Corpus',
      'Fourie J., Louw D.',
      'ACL Anthology',
      'A',
    ),
    _Pub(
      '2023',
      'Automated Vulnerability Discovery in IoT Firmware via Taint Analysis',
      'Khumalo N., de Wet R., Kleinschmidt A.',
      'ACM CCS',
      'A*',
    ),
    _Pub(
      '2022',
      'A Phylogenetic Framework for Metagenomic Abundance Estimation',
      'Kamfer H., Steyn P.',
      'Bioinformatics Journal',
      'Q1',
    ),
  ];

  const _PublicationsTab();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _pubs
          .map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _PubCard(pub: p),
            ),
          )
          .toList(),
    );
  }
}

class _Pub {
  final String year, title, authors, venue, rank;
  const _Pub(this.year, this.title, this.authors, this.venue, this.rank);
}

class _PubCard extends StatelessWidget {
  final _Pub pub;
  const _PubCard({required this.pub});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      depth: 0.3,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PDF for "${pub.title}" — coming soon'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppTheme.maroon,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  pub.year,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pub.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pub.authors,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      color: AppTheme.textMuted,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    pub.venue,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      color: AppTheme.maroon,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.gold.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    pub.rank,
                    style: GoogleFonts.openSans(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.gold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Icon(
                  Icons.picture_as_pdf,
                  size: 16,
                  color: AppTheme.textMuted,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Labs ─────────────────────────────────────────────────────────────────────
class _LabsTab extends StatelessWidget {
  static const _labs = [
    _Lab(
      'RobUSt Lab',
      'Robotics & Autonomous Systems',
      'Industrial robotics, drone navigation, and human-robot interaction at scale.',
    ),
    _Lab(
      'SecSu',
      'Information Security Centre',
      'Government & industry partnerships for cyber defence, threat intelligence, and privacy law research.',
    ),
    _Lab(
      'BioCS Lab',
      'Computational Biology Laboratory',
      'Cutting-edge genomics tooling developed in collaboration with the Stellenbosch Medical Faculty.',
    ),
    _Lab(
      'NetSight',
      'Network Measurement & SDN',
      'Open-source tools for real-time internet traffic analysis, routing, and WiFi research.',
    ),
  ];

  const _LabsTab();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _labs
          .map(
            (l) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: HoverCard(
                depth: 0.3,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${l.name} lab details — coming soon'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.gold,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l.shortName,
                              style: GoogleFonts.openSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.gold,
                                letterSpacing: 0.8,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              l.name,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              l.blurb,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: AppTheme.textMuted,
                                    height: 1.55,
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
          )
          .toList(),
    );
  }
}

class _Lab {
  final String shortName, name, blurb;
  const _Lab(this.shortName, this.name, this.blurb);
}

// ── Grid helper ──────────────────────────────────────────────────────────────
class _SimpleGrid extends StatelessWidget {
  final int cols;
  final double gap;
  final List<Widget> children;
  const _SimpleGrid({
    required this.cols,
    required this.gap,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (int i = 0; i < children.length; i += cols) {
      final end = (i + cols < children.length) ? i + cols : children.length;
      final row = children.sublist(i, end);
      final filler = cols - row.length;
      rows.add(
        Padding(
          padding: EdgeInsets.only(bottom: gap),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...row.asMap().entries.map(
                (e) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: e.key < row.length - 1 ? gap : 0,
                    ),
                    child: e.value,
                  ),
                ),
              ),
              ...List.generate(
                filler,
                (_) => const Expanded(child: SizedBox()),
              ),
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}
