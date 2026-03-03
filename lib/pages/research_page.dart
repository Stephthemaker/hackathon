import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../settings/app_settings.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/section_heading.dart';

// ---------------------------------------------------------------------------
// Page
// ---------------------------------------------------------------------------
class ResearchPage extends StatelessWidget {
  const ResearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _GroupsSection(),
            _ResourcesSection(),
            _PostgradBanner(),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Research groups section
// ---------------------------------------------------------------------------
class _Member {
  final String name;
  final String? photoPath;
  const _Member(this.name, this.photoPath);
}

class _Link {
  final String label;
  final String url;
  const _Link(this.label, this.url);
}

class _RG {
  final String id, name, description, ctaLabel, ctaRoute;
  final List<String> focusAreas;
  final IconData icon;
  final List<_Member> members;
  final List<_Link> officialLinks;

  const _RG({
    required this.id,
    required this.name,
    required this.description,
    required this.focusAreas,
    required this.icon,
    required this.members,
    required this.ctaLabel,
    required this.ctaRoute,
    this.officialLinks = const [],
  });
}

class _GroupsSection extends StatelessWidget {
  const _GroupsSection();

  static const _groups = [
    _RG(
      id: 'automata',
      name: 'Theory and Applications of Automata and Grammars',
      officialLinks: [
        _Link('Group Website', 'http://www.cs.sun.ac.za/~lvzijl/research.html'),
        _Link(
          'Regex Analysis Project',
          'http://www.cs.sun.ac.za/~abvdm/regex.html',
        ),
      ],
      description:
          'Investigating the theory of nondeterministic finite automata and extending automata '
          'and grammar theories for novel applications — including pattern layout optimisation '
          'with cellular automata, image processing, and probabilistic music generation.',
      focusAreas: [
        'Descriptional Complexity',
        'Cellular Automata',
        'Probabilistic Automata',
        'Grammar Theory',
        'Language Theory',
      ],
      icon: Icons.functions_outlined,
      members: [
        _Member('Willem Bester', 'web/assets/staff/academic/whkbester.jpg'),
        _Member('Walter Schulze', null),
        _Member('Brink van der Merwe', 'web/assets/staff/academic/abvdm.jpg'),
        _Member('Steyn van Litsenborgh', null),
        _Member('Lynette van Zijl', 'web/assets/staff/academic/lvzijl.jpg'),
      ],
      ctaLabel: 'Explore Automata Programmes',
      ctaRoute: '/programmes',
    ),
    _RG(
      id: 'sev',
      name: 'Software Engineering and Verification',
      officialLinks: [
        _Link('COASTAL', 'http://www.cs.sun.ac.za/coastal/'),
        _Link('ESBMC', 'http://www.esbmc.org/'),
        _Link('CSeq', 'http://www.southampton.ac.uk/~gp1y10/cseq/'),
      ],
      description:
          'Developing highly reliable system software using computer-aided verification of '
          'designs, systematic testing, and defensive programming. The group has been active '
          'since 1990 and produced major open-source tools including COASTAL.',
      focusAreas: [
        'Program Verification',
        'Systematic Testing',
        'Defensive Programming',
        'OS Kernel Development',
        'Symbolic Execution',
      ],
      icon: Icons.verified_outlined,
      members: [
        _Member('Andrew Collett', null),
        _Member('Bernd Fischer', 'web/assets/staff/academic/bfischer.jpg'),
        _Member('Jaco Geldenhuys', null),
        _Member('Cornelia Inggs', 'web/assets/staff/academic/cinggs.jpg'),
        _Member('Zhunaid Mohamed', null),
        _Member('Jan Taljaard', null),
        _Member('Phillip van Heerden', null),
        _Member('Willem Visser', 'web/assets/staff/academic/visserw.jpg'),
      ],
      ctaLabel: 'See Verification Resources',
      ctaRoute: '/resources',
    ),
    _RG(
      id: 'ml',
      name: 'Machine Learning and Artificial Intelligence',
      description:
          'Studying the full spectrum of decision-making under uncertainty: planning, learning, '
          'and search. Research is grounded in probability theory and game theory, with strong '
          'links to big data, earth observation and radio interferometry.',
      focusAreas: [
        'Reinforcement Learning',
        'Uncertainty Management',
        'Game Theory',
        'Big Data',
        'Search Algorithms',
      ],
      icon: Icons.psychology_outlined,
      members: [
        _Member('Burger Becker', null),
        _Member('Marc Christoph', null),
        _Member('Dirko Coetsee', null),
        _Member('Trienko Grobler', 'web/assets/staff/academic/tlgrobler.jpg'),
        _Member('Steve Kroon', 'web/assets/staff/academic/kroon.jpg'),
        _Member('Jordan Masakuna', null),
        _Member('Arnu Pretorius', null),
        _Member('Charl Steyl', null),
        _Member('Elan van Biljon', null),
        _Member('Andries Engelbrecht', 'web/assets/staff/academic/engel.jpg'),
      ],
      ctaLabel: 'Explore AI Programmes',
      ctaRoute: '/programmes',
    ),
    _RG(
      id: 'broadband',
      name: 'Telkom-Siemens CoE in Broadband Networks',
      officialLinks: [
        _Link('Centre of Excellence', 'http://www.cs.sun.ac.za/~aek1/'),
      ],
      description:
          'The Stellenbosch unit of the Telkom-Siemens Centre of Excellence promotes '
          'research and development in broadband technologies and trains postgraduate students '
          'and professionals in advanced telecommunications.',
      focusAreas: [
        'ATM Networks',
        'Broadband Technologies',
        'Protocol Design',
        'Professional Training',
        'Telecommunications',
      ],
      icon: Icons.lan_outlined,
      members: [
        _Member('Jaco Geldenhuys', null),
        _Member('Anthony E. Krzesinski', null),
        _Member('Willem Visser', 'web/assets/staff/academic/visserw.jpg'),
      ],
      ctaLabel: 'Postgrad Telecoms',
      ctaRoute: '/programmes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 80, 40, 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (ctx) {
                    final s = AppSettingsProvider.of(ctx);
                    return SectionHeading(
                      label: s.tr('research.label'),
                      title: s.tr('research.title'),
                      subtitle: s.tr('research.subtitle'),
                    );
                  },
                ),
                const SizedBox(height: 48),
                ..._groups.asMap().entries.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: _GroupCard(group: e.value, flip: e.key.isOdd),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  final _RG group;
  final bool flip;
  const _GroupCard({required this.group, required this.flip});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 960;

    return HoverCard(
      depth: 0.15,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: isDesktop
            ? Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: flip ? 360 : 0,
                      right: flip ? 0 : 360,
                    ),
                    child: _GroupInfo(group: group),
                  ),
                  Positioned(
                    left: flip ? 0 : null,
                    right: flip ? null : 0,
                    top: 0,
                    bottom: 0,
                    width: 360,
                    child: _MembersPane(
                      group: group,
                      isLeft: flip,
                      isDesktop: true,
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _GroupInfo(group: group),
                  _MembersPane(
                    group: group,
                    isLeft: false,
                    isBottom: true,
                    isDesktop: false,
                  ),
                ],
              ),
      ),
    );
  }
}

class _GroupInfo extends StatelessWidget {
  final _RG group;
  const _GroupInfo({required this.group});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.maroon.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(group.icon, color: AppTheme.maroon, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  group.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            group.description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppTheme.textMuted,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: group.focusAreas
                .map((tag) => _FocusChip(label: tag))
                .toList(),
          ),
          if (group.officialLinks.isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(
              AppSettingsProvider.of(context).tr('research.official_links'),
              style: GoogleFonts.openSans(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.textMuted,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: group.officialLinks
                  .map(
                    (link) => Semantics(
                      link: true,
                      label: link.label,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => launchUrl(Uri.parse(link.url)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.link,
                                size: 14,
                                color: AppTheme.gold,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                link.label,
                                style: GoogleFonts.openSans(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.maroon,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppTheme.maroon.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
          const SizedBox(height: 28),
          Semantics(
            link: true,
            label: group.ctaLabel,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go(group.ctaRoute),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      group.ctaLabel,
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.maroon,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: AppTheme.maroon,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MembersPane extends StatelessWidget {
  final _RG group;
  final bool isLeft;
  final bool isBottom;
  final bool isDesktop;
  const _MembersPane({
    required this.group,
    required this.isLeft,
    this.isBottom = false,
    this.isDesktop = false,
  });

  @override
  Widget build(BuildContext context) {
    final scrollChild = Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: WidgetStateProperty.all(true),
          thickness: WidgetStateProperty.all(4),
        ),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            children: group.members
                .map(
                  (m) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.maroon.withValues(alpha: 0.1),
                              width: 1.5,
                            ),
                          ),
                          child: ClipOval(
                            child: m.photoPath != null
                                ? Image.asset(
                                    m.photoPath!,
                                    fit: BoxFit.cover,
                                    cacheWidth:
                                        (48 *
                                                MediaQuery.of(
                                                  context,
                                                ).devicePixelRatio)
                                            .round(),
                                    cacheHeight:
                                        (48 *
                                                MediaQuery.of(
                                                  context,
                                                ).devicePixelRatio)
                                            .round(),
                                    filterQuality: FilterQuality.medium,
                                    errorBuilder: (_, __, ___) =>
                                        _InitialsAvatar(name: m.name),
                                  )
                                : _InitialsAvatar(name: m.name),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            m.name,
                            style: GoogleFonts.openSans(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: isBottom
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              )
            : isLeft
            ? const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
      ),
      padding: const EdgeInsets.fromLTRB(28, 36, 28, 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppSettingsProvider.of(context).tr('research.current_members'),
            style: GoogleFonts.openSans(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppTheme.textMuted,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          isDesktop
              ? Expanded(child: scrollChild)
              : ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 280),
                  child: scrollChild,
                ),
          const SizedBox(height: 8),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.go('/staff'),
              child: Text(
                AppSettingsProvider.of(context).tr('research.staff_directory'),
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textMuted,
                  decoration: TextDecoration.underline,
                  decorationColor: AppTheme.textMuted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InitialsAvatar extends StatelessWidget {
  final String name;
  const _InitialsAvatar({required this.name});

  String get _initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return parts.first.substring(0, 2).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.maroon.withValues(alpha: 0.12),
      child: Center(
        child: Text(
          _initials,
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppTheme.maroon,
          ),
        ),
      ),
    );
  }
}

class _FocusChip extends StatelessWidget {
  final String label;
  const _FocusChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppTheme.divider),
      ),
      child: Text(
        label,
        style: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppTheme.textDark,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Research resources section
// ---------------------------------------------------------------------------
class _ResItem {
  final IconData icon;
  final String title, subtitle, description;
  const _ResItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

class _ResourcesSection extends StatelessWidget {
  const _ResourcesSection();

  static const _items = [
    _ResItem(
      icon: Icons.bug_report_outlined,
      title: 'COASTAL',
      subtitle: 'Symbolic Execution Tool',
      description:
          'An open-source framework for symbolic execution and automated test generation, '
          'developed by the Software Engineering and Verification group.',
    ),
    _ResItem(
      icon: Icons.rule_outlined,
      title: 'ESBMC',
      subtitle: 'Bounded Model Checking',
      description:
          'An efficient, context-bounded model checker for verifying single- and multi-threaded '
          'C and C++ programs.',
    ),
    _ResItem(
      icon: Icons.account_tree_outlined,
      title: 'CSeq',
      subtitle: 'Concurrency Verification',
      description:
          'A sequentialization tool for concurrent C programs used in formal verification '
          'research contexts.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cols = width > 960 ? 3 : (width > 640 ? 2 : 1);

    final rows = <Widget>[];
    for (int i = 0; i < _items.length; i += cols) {
      final end = (i + cols < _items.length) ? i + cols : _items.length;
      final row = _items.sublist(i, end);
      final filler = cols - row.length;
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...row.asMap().entries.map(
                (e) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: e.key < row.length - 1 ? 20 : 0,
                    ),
                    child: HoverCard(
                      depth: 0.25,
                      child: Padding(
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppTheme.maroon.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                e.value.icon,
                                color: AppTheme.maroon,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              e.value.title,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              e.value.subtitle,
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.gold,
                                letterSpacing: 0.4,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              e.value.description,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: AppTheme.textMuted,
                                    height: 1.6,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(48, 72, 48, 72),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SectionHeading(
                        label: AppSettingsProvider.of(
                          context,
                        ).tr('research.tools.label'),
                        title: AppSettingsProvider.of(
                          context,
                        ).tr('research.tools.title'),
                        subtitle: AppSettingsProvider.of(
                          context,
                        ).tr('research.tools.subtitle'),
                      ),
                    ),
                    const SizedBox(width: 24),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => context.go('/resources'),
                        child: Row(
                          children: [
                            Text(
                              AppSettingsProvider.of(
                                context,
                              ).tr('research.tools.all_resources'),
                              style: GoogleFonts.openSans(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.maroon,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: AppTheme.maroon,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                ...rows,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Postgrad CTA banner
// ---------------------------------------------------------------------------
class _PostgradBanner extends StatelessWidget {
  const _PostgradBanner();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;

    return Container(
      color: AppTheme.maroonDark,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
            child: isDesktop
                ? Row(
                    children: [
                      const Expanded(child: _BannerText()),
                      const SizedBox(width: 48),
                      _BannerActions(),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _BannerText(),
                      const SizedBox(height: 32),
                      _BannerActions(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _BannerText extends StatelessWidget {
  const _BannerText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppSettingsProvider.of(context).tr('research.banner.title'),
          style: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          AppSettingsProvider.of(context).tr('research.banner.body'),
          style: GoogleFonts.openSans(
            fontSize: 15,
            color: Colors.white.withValues(alpha: 0.78),
            height: 1.65,
          ),
        ),
      ],
    );
  }
}

class _BannerActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _BannerButton(
          label: s.tr('research.banner.btn.programmes'),
          icon: Icons.school_outlined,
          onTap: () => context.go('/programmes'),
        ),
        _BannerButton(
          label: s.tr('research.banner.btn.contact'),
          icon: Icons.mail_outline,
          onTap: () => context.go('/contact'),
        ),
      ],
    );
  }
}

class _BannerButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const _BannerButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_BannerButton> createState() => _BannerButtonState();
}

class _BannerButtonState extends State<_BannerButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            decoration: BoxDecoration(
              color: _hovered
                  ? Colors.white.withValues(alpha: 0.14)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withValues(alpha: 0.55)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon, size: 18, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  widget.label,
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
