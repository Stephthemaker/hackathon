import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../settings/app_settings.dart';
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
  String _sort = 'Name (A–Z)';

  static const _groups = [
    'All',
    'Theory & Algorithms',
    'Software Engineering',
    'Artificial Intelligence',
    'Computer Vision',
    'Science & Engineering',
    'Information Security',
    'Networks & Systems',
  ];

  static const _groupTranslationKeys = {
    'All': 'staff.filter.all',
    'Theory & Algorithms': 'staff.filter.theory',
    'Software Engineering': 'staff.filter.se',
    'Artificial Intelligence': 'staff.filter.ai',
    'Computer Vision': 'staff.filter.cv',
    'Science & Engineering': 'staff.filter.sci',
    'Information Security': 'staff.filter.sec',
    'Networks & Systems': 'staff.filter.networks',
  };

  static const _sortTranslationKeys = {
    'Name (A–Z)': 'staff.sort.name_asc',
    'Name (Z–A)': 'staff.sort.name_desc',
    'Title': 'staff.sort.title',
    'Group': 'staff.sort.group',
  };

  static const _sortOptions = ['Name (A–Z)', 'Name (Z–A)', 'Title', 'Group'];

  static const _academicStaff = [
    _SM(
      'Prof. Brink van der Merwe',
      'Professor & Head of Division',
      'Theory & Algorithms',
      'Tree automata and applications, Learning of grammars and languages from data.',
      'web/assets/staff/academic/abvdm.jpg',
      'https://abvdm.pages.cs.sun.ac.za/',
      email: 'abvdm@cs.sun.ac.za',
    ),
    _SM(
      'Prof. Bernd Fischer',
      'Professor',
      'Software Engineering',
      'Program analysis, program generation, program verification, and formal methods.',
      'web/assets/staff/academic/bfischer.jpg',
      'https://bfischer.pages.cs.sun.ac.za/',
      email: 'bfischer@cs.sun.ac.za',
    ),
    _SM(
      'Prof. Lynette van Zijl',
      'Professor',
      'Theory & Algorithms',
      'Implementation and applications of automata; assistive technologies.',
      'web/assets/staff/academic/lvzijl.jpg',
      'https://lvzijl.cs.sun.ac.za/',
      email: 'lvzijl@cs.sun.ac.za',
    ),
    _SM(
      'Prof. Andries Engelbrecht',
      'Professor',
      'Artificial Intelligence',
      'Swarm intelligence, evolutionary computation, and machine learning.',
      'web/assets/staff/academic/engel.jpg',
      'https://engel.pages.cs.sun.ac.za/',
      email: 'engel@sun.ac.za',
    ),
    _SM(
      'Prof. William (Bill) Tucker',
      'Professor',
      'Networks & Systems',
      'Computer networks, human-computer interaction, and ethical computing.',
      'web/assets/staff/academic/btucker.jpg',
      'https://researcherprofiles.sun.ac.za/37639-bill-tucker',
      email: 'btucker@sun.ac.za',
    ),
    _SM(
      'Prof. Willem Visser',
      'Part-time Professor',
      'Software Engineering',
      'Software testing, symbolic execution, and model checking.',
      'web/assets/staff/academic/visserw.jpg',
      'http://www.cs.sun.ac.za/~wvisser/',
      email: 'visserw@sun.ac.za',
    ),
    _SM(
      'Assoc Prof. Steve Kroon',
      'Associate Professor',
      'Artificial Intelligence',
      'Statistical learning theory, probability and computing, and machine learning.',
      'web/assets/staff/academic/kroon.jpg',
      'https://kroon.cs.sun.ac.za/',
      email: 'kroon@sun.ac.za',
    ),
    _SM(
      'Dr. Marcel Dunaiski',
      'Senior Lecturer',
      'Science & Engineering',
      'Data Science, Informetrics, and Scientometrics.',
      'web/assets/staff/academic/mdunaiski.jpg',
      'https://marceldunaiski.pages.cs.sun.ac.za/',
      email: 'marceldunaiski@sun.ac.za',
    ),
    _SM(
      'Dr. Cornelia Inggs',
      'Senior Lecturer',
      'Software Engineering',
      'Formal methods, model checking, and concurrency.',
      'web/assets/staff/academic/cinggs.jpg',
      'https://cinggs.pages.cs.sun.ac.za/',
      email: 'cinggs@cs.sun.ac.za',
    ),
    _SM(
      'Dr. Trienko Grobler',
      'Lecturer',
      'Science & Engineering',
      'Machine learning, remote sensing, and coding theory.',
      'web/assets/staff/academic/tlgrobler.jpg',
      'https://tlgrobler.pages.cs.sun.ac.za/',
      email: 'tlgrobler@sun.ac.za',
    ),
    _SM(
      'Mr. Willem Bester',
      'Junior Lecturer',
      'Software Engineering',
      'Formal methods, software engineering, and automata theory.',
      'web/assets/staff/academic/whkbester.jpg',
      'http://www.cs.sun.ac.za/~whkbester/',
      email: 'whkbester@cs.sun.ac.za',
    ),
    _SM(
      'Mr. Mkhuseli Ngxande',
      'Lecturer',
      'Computer Vision',
      'Machine learning, computer vision, and bioinformatics.',
      'web/assets/staff/academic/ngxandem.jpg',
      'http://www.cs.sun.ac.za/~ngxandem',
      email: 'ngxandem@sun.ac.za',
    ),
    _SM(
      'Dr. Gavin Rens',
      'Lecturer',
      'Artificial Intelligence',
      'Cognitive robotics, knowledge representation, and reinforcement learning.',
      'web/assets/staff/academic/grens.jpg',
      'https://kognitiv.systems/',
      email: 'gavinrens@sun.ac.za',
    ),
    _SM(
      'Prof. Fabian Yamaguchi',
      'Professor Extraordinary',
      'Information Security',
      'Computer security, program analysis, and machine learning.',
      'web/assets/staff/academic/fabian3.jpg',
      'https://fabs.codeminers.org/',
      email: 'fabs@shiftleft.io',
    ),
    _SM(
      'Assoc Prof. George Azzopardi',
      'Assoc Prof Extraordinary',
      'Computer Vision',
      'Brain-inspired computing, computer vision, and pattern recognition.',
      'web/assets/staff/academic/gazzopardi.jpg',
      'https://www.rug.nl/staff/g.azzopardi/?lang=en',
    ),
    _SM(
      'Dr. McElory Hoffmann',
      'Senior Lect. Extraordinary',
      'Computer Vision',
      'Computer vision, machine learning, and smart cameras.',
      'web/assets/staff/academic/mcelory.jpg',
      'https://www.linkedin.com/in/mcelory/',
      email: 'mcelory@praelexis.co.za',
    ),
  ];

  static const _adminStaff = [
    _SM(
      'Mr. Emile Dreyer',
      'Administrative Support',
      'Administrative Staff',
      'Office administration and departmental operations support.',
      'web/assets/staff/admin/placeholder.jpg',
      'https://cs.sun.ac.za/people/staff/#administrative-staff',
      email: 'edreyer@sun.ac.za',
    ),
    _SM(
      'Ms. Gaynor Fortuin',
      'Administrative Officer',
      'Administrative Staff',
      'General administration and departmental coordination.',
      'web/assets/staff/admin/gfortuin.jpg',
      'https://cs.sun.ac.za/people/staff/#administrative-staff',
      email: 'gfortuin@sun.ac.za',
    ),
    _SM(
      'Mr. Derrick Stephanus',
      'Assistant',
      'Administrative Staff',
      'Administrative assistance and office support.',
      'web/assets/staff/admin/djstep.jpg',
      'https://cs.sun.ac.za/people/staff/#administrative-staff',
      email: 'djstep@sun.ac.za',
    ),
  ];

  List<_SM> _applyFilters(List<_SM> input, {required bool filterByGroup}) {
    final query = _query.trim().toLowerCase();
    final filtered = input.where((s) {
      final mg = !filterByGroup || _group == 'All' || s.group == _group;
      final mq =
          query.isEmpty ||
          s.name.toLowerCase().contains(query) ||
          s.title.toLowerCase().contains(query) ||
          s.group.toLowerCase().contains(query) ||
          s.research.toLowerCase().contains(query);
      return mg && mq;
    }).toList();

    filtered.sort((a, b) {
      switch (_sort) {
        case 'Name (Z–A)':
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        case 'Title':
          return a.title.toLowerCase().compareTo(b.title.toLowerCase());
        case 'Group':
          return a.group.toLowerCase().compareTo(b.group.toLowerCase());
        case 'Name (A–Z)':
        default:
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      }
    });

    return filtered;
  }

  List<_SM> get _filteredAcademic =>
      _applyFilters(_academicStaff, filterByGroup: true);

  List<_SM> get _filteredAdmin =>
      _applyFilters(_adminStaff, filterByGroup: false);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w > 1000
        ? 3
        : w > 650
        ? 2
        : 1;
    return SelectionArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeading(
                  label: AppSettingsProvider.of(context).tr('staff.label'),
                  title: AppSettingsProvider.of(context).tr('staff.title'),
                  subtitle: AppSettingsProvider.of(
                    context,
                  ).tr('staff.subtitle'),
                ),
                const SizedBox(height: 40),
                Text(
                  AppSettingsProvider.of(context).tr('staff.section.academic'),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                // Search
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 440),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppSettingsProvider.of(
                            context,
                          ).tr('staff.search.hint'),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppTheme.textMuted,
                            size: 20,
                          ),
                        ),
                        onChanged: (v) => setState(() => _query = v),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 240),
                      child: DropdownButtonFormField<String>(
                        value: _sort,
                        style: AppTheme.uiControlText.copyWith(
                          fontSize: 13.5,
                          color: AppTheme.textDark,
                        ),
                        decoration: InputDecoration(
                          labelText: AppSettingsProvider.of(
                            context,
                          ).tr('staff.sort.label'),
                        ),
                        items: _sortOptions.map((s) {
                          final trKey = _sortTranslationKeys[s] ?? s;
                          return DropdownMenuItem(
                            value: s,
                            child: Text(
                              AppSettingsProvider.of(context).tr(trKey),
                              style: AppTheme.uiControlText.copyWith(
                                fontSize: 13.5,
                                color: AppTheme.textDark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (v) {
                          if (v != null) {
                            setState(() => _sort = v);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Filter buttons
                LayoutBuilder(
                  builder: (context, constraints) {
                    final useHorizontalScroll = constraints.maxWidth < 800;
                    final s = AppSettingsProvider.of(context);
                    final filterContent = Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _groups
                          .map(
                            (g) => _GroupFilterButton(
                              label: s.tr(_groupTranslationKeys[g] ?? g),
                              selected: _group == g,
                              onTap: () => setState(() => _group = g),
                            ),
                          )
                          .toList(),
                    );

                    if (useHorizontalScroll) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: _groups
                                .map(
                                  (g) => Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: _GroupFilterButton(
                                      label: s.tr(
                                        _groupTranslationKeys[g] ?? g,
                                      ),
                                      selected: _group == g,
                                      onTap: () => setState(() => _group = g),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    }

                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppTheme.divider),
                      ),
                      child: filterContent,
                    );
                  },
                ),
                const SizedBox(height: 32),
                // Academic Grid
                _buildGrid(_filteredAcademic, cols),
                const SizedBox(height: 56),
                Text(
                  AppSettingsProvider.of(context).tr('staff.section.admin'),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                _buildGrid(_filteredAdmin, cols),
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
            AppSettingsProvider.of(context).tr('staff.empty'),
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
  final String name, title, group, research, photoUrl, websiteUrl, email;
  const _SM(
    this.name,
    this.title,
    this.group,
    this.research,
    this.photoUrl,
    this.websiteUrl, {
    this.email = '',
  });
}

class _GroupFilterButton extends StatefulWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _GroupFilterButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  State<_GroupFilterButton> createState() => _GroupFilterButtonState();
}

class _GroupFilterButtonState extends State<_GroupFilterButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: SelectionContainer.disabled(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              color: selected
                  ? AppTheme.maroon
                  : (_hovered
                        ? Theme.of(context).scaffoldBackgroundColor
                        : Theme.of(context).colorScheme.surface),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selected
                    ? AppTheme.maroon
                    : (_hovered ? AppTheme.maroonLight : AppTheme.divider),
              ),
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: AppTheme.maroon.withValues(alpha: 0.18),
                        blurRadius: 14,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : const [],
            ),
            child: Text(
              widget.label,
              style: AppTheme.uiControlText.copyWith(
                fontSize: 12.5,
                color: selected ? Colors.white : AppTheme.textDark,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
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
      onTap: () async {
        if (member.websiteUrl.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'No public profile link available for ${member.name} yet.',
              ),
              duration: const Duration(seconds: 2),
            ),
          );
          return;
        }

        final uri = Uri.parse(member.websiteUrl);
        final opened = await launchUrl(uri, mode: LaunchMode.platformDefault);
        if (!opened && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not open profile for ${member.name}.'),
              duration: const Duration(seconds: 2),
            ),
          );
        }
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
              child: _ProfileAvatar(
                imagePath: member.photoUrl,
                semanticLabel: member.name,
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
                    if (member.email.isNotEmpty) ...[
                      _Chip(
                        Icons.email,
                        'Email',
                        onTap: () async {
                          final uri = Uri.parse('mailto:${member.email}');
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        },
                      ),
                      const SizedBox(width: 8),
                    ],
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

class _ProfileAvatar extends StatefulWidget {
  final String imagePath;
  final String semanticLabel;

  const _ProfileAvatar({required this.imagePath, required this.semanticLabel});

  @override
  State<_ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<_ProfileAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: ClipOval(
        child: Image.asset(
          widget.imagePath,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
          semanticLabel: widget.semanticLabel,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded || frame != null) {
              return child;
            }

            return AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final t = _controller.value;
                return DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1.0 + (2.0 * t), -0.3),
                      end: Alignment(-0.2 + (2.0 * t), 0.3),
                      colors: const [
                        Color(0x33FFFFFF),
                        Color(0x66FFFFFF),
                        Color(0x33FFFFFF),
                      ],
                    ),
                  ),
                  child: Container(color: Colors.white12),
                );
              },
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.white12,
            alignment: Alignment.center,
            child: const Icon(Icons.person, color: Colors.white, size: 32),
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _Chip(this.icon, this.label, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
          decoration: BoxDecoration(
            color: onTap != null
                ? Theme.of(context).colorScheme.surface
                : Colors.transparent,
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
                style: AppTheme.uiControlText.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
