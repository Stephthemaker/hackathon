import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/section_heading.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({super.key});
  @override
  State<StaffPage> createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  String _group = 'All';
  String _query = '';

  static const _groups = [
    'All',
    'Artificial Intelligence',
    'Software Engineering',
    'Theory & Algorithms',
    'Computer Networks',
    'Information Security',
    'Bioinformatics',
  ];

  static const _staff = [
    _SM(
      'Prof. Brink van der Merwe',
      'Head of Department',
      'Theory & Algorithms',
      'Formal languages, automata theory, and quantum computing.',
    ),
    _SM(
      'Prof. Johan Fourie',
      'Professor',
      'Artificial Intelligence',
      'Machine learning, NLP for African languages, and LLMs.',
    ),
    _SM(
      'Dr. Anita Kleinschmidt',
      'Associate Professor',
      'Software Engineering',
      'Software quality, distributed systems, and DevOps.',
    ),
    _SM(
      'Dr. Ruan de Wet',
      'Senior Lecturer',
      'Computer Networks',
      'Internet architectures, IoT, and network security.',
    ),
    _SM(
      'Dr. Nombuso Khumalo',
      'Lecturer',
      'Information Security',
      'Cryptography, threat modelling, and digital forensics.',
    ),
    _SM(
      'Prof. Herman Kamfer',
      'Professor',
      'Bioinformatics',
      'Genomics algorithms, protein folding, and computational biology.',
    ),
    _SM(
      'Ms. Ane Steenkamp',
      'Lecturer',
      'Software Engineering',
      'Human-computer interaction, accessibility, and UX design.',
    ),
    _SM(
      'Dr. Thabo Mokoena',
      'Senior Researcher',
      'Artificial Intelligence',
      'Computer vision, robotics, and reinforcement learning.',
    ),
  ];

  List<_SM> get _filtered => _staff.where((s) {
    final mg = _group == 'All' || s.group == _group;
    final mq =
        _query.isEmpty ||
        s.name.toLowerCase().contains(_query.toLowerCase()) ||
        s.research.toLowerCase().contains(_query.toLowerCase());
    return mg && mq;
  }).toList();

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w > 1000
        ? 3
        : w > 650
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
                  label: 'People',
                  title: 'Academic Staff & Faculty',
                  subtitle:
                      'Meet the researchers, lecturers, and professors who drive excellence in our department.',
                ),
                const SizedBox(height: 40),
                // Search
                SizedBox(
                  width: 440,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search by name or research area…',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppTheme.textMuted,
                        size: 20,
                      ),
                      hintStyle: GoogleFonts.openSans(
                        color: AppTheme.textMuted,
                        fontSize: 14,
                      ),
                    ),
                    onChanged: (v) => setState(() => _query = v),
                  ),
                ),
                const SizedBox(height: 16),
                // Filter chips
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _groups
                      .map(
                        (g) => _FilterChip(
                          label: g,
                          selected: _group == g,
                          onTap: () => setState(() => _group = g),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 48),
                // Grid
                _buildGrid(_filtered, cols),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(List<_SM> items, int cols) {
    if (items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Center(
          child: Text(
            'No staff found.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }
    final rows = <Widget>[];
    for (int i = 0; i < items.length; i += cols) {
      final end = (i + cols < items.length) ? i + cols : items.length;
      final rowItems = items.sublist(i, end);
      final needed = cols - rowItems.length;
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...rowItems.asMap().entries.map(
                (e) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: e.key < rowItems.length - 1 ? 20 : 0,
                      bottom: 20,
                    ),
                    child: _StaffCard(member: e.value),
                  ),
                ),
              ),
              ...List.generate(
                needed,
                (_) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}

class _SM {
  final String name, title, group, research;
  const _SM(this.name, this.title, this.group, this.research);
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: SelectionContainer.disabled(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: selected ? AppTheme.maroon : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected ? AppTheme.maroon : AppTheme.divider,
              ),
            ),
            child: Text(
              label,
              style: GoogleFonts.openSans(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: selected ? Colors.white : AppTheme.textDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StaffCard extends StatelessWidget {
  final _SM member;
  const _StaffCard({required this.member});
  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile for ${member.name} — coming soon'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 88,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.maroonDark, AppTheme.maroon],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white12,
                child: const Icon(Icons.person, color: Colors.white, size: 32),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.gold.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    member.group,
                    style: GoogleFonts.openSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.gold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  member.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  member.title,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    color: AppTheme.maroon,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  member.research,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.55),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _Chip(Icons.email, 'Email'),
                    const SizedBox(width: 8),
                    _Chip(Icons.article, 'Publications'),
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

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Chip(this.icon, this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.divider),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: AppTheme.textMuted),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.openSans(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppTheme.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
