import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../settings/app_settings.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/section_heading.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});
  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  int? _openFaq;

  static List<_RL> _getLinks(AppSettings s) => [
    _RL(
      Icons.school,
      s.tr('res.link.sunlearn.name'),
      'learn.sun.ac.za',
      s.tr('res.link.sunlearn.desc'),
    ),
    _RL(
      Icons.computer,
      s.tr('res.link.lab.name'),
      'labs.cs.sun.ac.za',
      s.tr('res.link.lab.desc'),
    ),
    _RL(
      Icons.library_books,
      s.tr('res.link.library.name'),
      'library.sun.ac.za',
      s.tr('res.link.library.desc'),
    ),
    _RL(
      Icons.wifi,
      s.tr('res.link.eduroam.name'),
      'it.sun.ac.za/eduroam',
      s.tr('res.link.eduroam.desc'),
    ),
    _RL(
      Icons.cloud,
      s.tr('res.link.hpc.name'),
      'hpc.sun.ac.za',
      s.tr('res.link.hpc.desc'),
    ),
    _RL(
      Icons.contact_support,
      s.tr('res.link.helpdesk.name'),
      'servicedesk.sun.ac.za',
      s.tr('res.link.helpdesk.desc'),
    ),
  ];

  static List<_Tool> _getTools(AppSettings s) => [
    _Tool(
      Icons.code,
      s.tr('res.tool.github.name'),
      s.tr('res.tool.github.desc'),
      'https://education.github.com/pack',
    ),
    _Tool(
      Icons.terminal,
      s.tr('res.tool.jetbrains.name'),
      s.tr('res.tool.jetbrains.desc'),
      'https://www.jetbrains.com/community/education/',
    ),
    _Tool(
      Icons.cloud_queue,
      s.tr('res.tool.azure.name'),
      s.tr('res.tool.azure.desc'),
      'https://azure.microsoft.com/en-us/free/students/',
    ),
    _Tool(
      Icons.auto_awesome,
      s.tr('res.tool.overleaf.name'),
      s.tr('res.tool.overleaf.desc'),
      'https://www.overleaf.com/',
    ),
  ];

  static const _faqs = [
    _FAQ(
      'How do I register as a new postgraduate student?',
      'Submit your online application at apply.sun.ac.za, attach certified ID and transcripts. Once accepted, register through the student portal during the designated registration period in January.',
    ),
    _FAQ(
      'What are the laptop specifications required?',
      'We recommend at least 8 GB RAM (16 GB preferred), an Intel i5/AMD Ryzen 5 or better CPU, 256 GB SSD, and a 64-bit OS. The CS labs provide Windows 10 + Linux dual-boot workstations.',
    ),
    _FAQ(
      'Can I defer my acceptance to next year?',
      'Deferral requests must be submitted in writing to the Undergraduate Office before 28 February. Approvals are granted per-faculty at its discretion.',
    ),
    _FAQ(
      'Where is the department located?',
      'The CS Department is situated in the Engineering A Building on the main Stellenbosch campus. Reception is on the ground floor, Room A001.',
    ),
    _FAQ(
      'How do I access journals off campus?',
      'Log in at library.sun.ac.za using your student number. Most IEEE, ACM, and Springer resources are accessible via proxy or VPN without extra setup.',
    ),
    _FAQ(
      'What student societies are there for CS students?',
      'DevSoc (developer community), IEEE Student Branch SU, ACM Student Chapter, and the Maties Robotics Club are all active. Join via SUNStudent magazine or their Discord servers.',
    ),
    _FAQ(
      'How do I get access to the HPC cluster?',
      'Submit a request through the HPC portal at hpc.sun.ac.za. You will need your supervisor\u0027s approval and a brief description of your research workload. Access is typically granted within 48 hours.',
    ),
    _FAQ(
      'Can I audit a module without registering for it?',
      'Auditing is permitted on a per-module basis with lecturer approval. Contact the Undergraduate Office before the add/drop deadline. Audited modules do not count towards degree credits.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    final w = MediaQuery.of(context).size.width;
    final cols = w > 900
        ? 3
        : w > 600
        ? 2
        : 1;
    final links = _getLinks(s);
    final tools = _getTools(s);
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
                  label: s.tr('res.label'),
                  title: s.tr('res.title'),
                  subtitle: s.tr('res.subtitle'),
                ),
                const SizedBox(height: 48),

                // Quick Links
                _sectionLabel(s.tr('res.section.quick_links')),
                const SizedBox(height: 20),
                _linksGrid(cols, links),

                const SizedBox(height: 56),

                // Developer & Study Tools
                _sectionLabel(s.tr('res.section.dev_tools')),
                const SizedBox(height: 20),
                _toolsGrid(w > 800 ? 2 : 1, tools),

                const SizedBox(height: 56),

                // Important Dates
                const SizedBox(height: 20),
                _buildImportantDates(context, s),

                const SizedBox(height: 56),

                // FAQ
                _sectionLabel(s.tr('res.section.faq')),
                const SizedBox(height: 24),
                ..._faqs.asMap().entries.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _FaqRow(
                      faq: e.value,
                      index: e.key,
                      isOpen: _openFaq == e.key,
                      onTap: () => setState(
                        () => _openFaq = _openFaq == e.key ? null : e.key,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String text) {
    return Row(
      children: [
        Container(width: 3, height: 24, color: AppTheme.gold),
        const SizedBox(width: 12),
        Text(
          text,
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppTheme.textDark,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildImportantDates(BuildContext context, AppSettings s) {
    final dates = [
      _Date('1 Mar', s.tr('res.date.1.label')),
      _Date('15 Jul', s.tr('res.date.2.label')),
      _Date('22 Aug', s.tr('res.date.3.label')),
      _Date('3 Oct', s.tr('res.date.4.label')),
      _Date('14 Nov', s.tr('res.date.5.label')),
      _Date('6 Dec', s.tr('res.date.6.label')),
    ];

    final isWide = MediaQuery.of(context).size.width > 700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionLabel(s.tr('res.section.dates')),
        const SizedBox(height: 28),
        _AnimatedTimeline(dates: dates, isWide: isWide),
      ],
    );
  }

  Widget _linksGrid(int cols, List<_RL> links) {
    final rows = <Widget>[];
    for (int i = 0; i < links.length; i += cols) {
      final end = (i + cols < links.length) ? i + cols : links.length;
      final row = links.sublist(i, end);
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
                      child: _LinkCard(link: e.value),
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

  Widget _toolsGrid(int cols, List<_Tool> tools) {
    final rows = <Widget>[];
    for (int i = 0; i < tools.length; i += cols) {
      final end = (i + cols < tools.length) ? i + cols : tools.length;
      final row = tools.sublist(i, end);
      final fill = cols - row.length;
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...row.asMap().entries.map(
                  (e) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: e.key < row.length - 1 ? 16 : 0,
                      ),
                      child: _ToolCard(tool: e.value),
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

class _RL {
  final IconData icon;
  final String name, url, desc;
  const _RL(this.icon, this.name, this.url, this.desc);
}

class _Tool {
  final IconData icon;
  final String name, desc, url;
  const _Tool(this.icon, this.name, this.desc, this.url);
}

class _FAQ {
  final String q, a;
  const _FAQ(this.q, this.a);
}

class _Date {
  final String date, label;
  const _Date(this.date, this.label);
}

class _LinkCard extends StatelessWidget {
  final _RL link;
  const _LinkCard({required this.link});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () {
        final uri = Uri.parse('https://${link.url}');
        launchUrl(uri, mode: LaunchMode.externalApplication);
      },
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.maroon.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(link.icon, color: AppTheme.maroon, size: 22),
            ),
            const SizedBox(height: 14),
            Text(
              link.name,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              link.desc,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textMuted,
                height: 1.5,
              ),
            ),
            const Spacer(),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.open_in_new, size: 12, color: AppTheme.maroon),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    link.url,
                    style: GoogleFonts.openSans(
                      fontSize: 11,
                      color: AppTheme.maroon,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ToolCard extends StatelessWidget {
  final _Tool tool;
  const _ToolCard({required this.tool});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () {
        launchUrl(Uri.parse(tool.url), mode: LaunchMode.externalApplication);
      },
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.gold.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(tool.icon, color: AppTheme.gold, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tool.name,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tool.desc,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textMuted,
                      height: 1.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.open_in_new, size: 14, color: AppTheme.gold),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Animated Timeline for Important Dates
// ---------------------------------------------------------------------------
class _AnimatedTimeline extends StatelessWidget {
  final List<_Date> dates;
  final bool isWide;
  const _AnimatedTimeline({required this.dates, required this.isWide});

  @override
  Widget build(BuildContext context) {
    // Icon mapping for each date to make it visually distinct
    const icons = [
      Icons.edit_calendar_outlined,
      Icons.app_registration_outlined,
      Icons.science_outlined,
      Icons.emoji_events_outlined,
      Icons.school_outlined,
      Icons.grading_outlined,
    ];
    // Accent colours cycle
    const accents = [
      AppTheme.maroon,
      Color(0xFF1D4ED8),
      Color(0xFF2D6A4F),
      AppTheme.gold,
      AppTheme.maroon,
      Color(0xFF1D4ED8),
    ];

    return Column(
      children: dates.asMap().entries.map((e) {
        final i = e.key;
        final d = e.value;
        final isLast = i == dates.length - 1;
        final accent = accents[i % accents.length];
        final icon = icons[i % icons.length];
        final isLeft = isWide && i.isEven;

        return _TimelineEntry(
          date: d,
          index: i,
          isLast: isLast,
          accent: accent,
          icon: icon,
          isLeft: isLeft,
          isWide: isWide,
        );
      }).toList(),
    );
  }
}

class _TimelineEntry extends StatefulWidget {
  final _Date date;
  final int index;
  final bool isLast;
  final Color accent;
  final IconData icon;
  final bool isLeft;
  final bool isWide;

  const _TimelineEntry({
    required this.date,
    required this.index,
    required this.isLast,
    required this.accent,
    required this.icon,
    required this.isLeft,
    required this.isWide,
  });

  @override
  State<_TimelineEntry> createState() => _TimelineEntryState();
}

class _TimelineEntryState extends State<_TimelineEntry>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600 + widget.index * 100),
    );
    _fadeAnim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: Offset(widget.isLeft ? -0.15 : 0.15, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    // Stagger the animation entry
    Future.delayed(Duration(milliseconds: 120 * widget.index), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final card = _buildCard(context);

    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.isWide && widget.isLeft) ...[
                Expanded(child: card),
                const SizedBox(width: 20),
              ],
              // Central timeline spine
              SizedBox(
                width: 48,
                child: Column(
                  children: [
                    // Dot
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: _hovered ? 20 : 16,
                      height: _hovered ? 20 : 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.accent,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: widget.accent.withValues(alpha: 0.35),
                            blurRadius: _hovered ? 12 : 6,
                            spreadRadius: _hovered ? 2 : 0,
                          ),
                        ],
                      ),
                    ),
                    // Connecting line
                    if (!widget.isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                widget.accent.withValues(alpha: 0.5),
                                widget.accent.withValues(alpha: 0.1),
                              ],
                            ),
                          ),
                        ),
                      )
                    else
                      const Expanded(child: SizedBox()),
                  ],
                ),
              ),
              if (widget.isWide && !widget.isLeft) ...[
                const SizedBox(width: 20),
                Expanded(child: card),
              ],
              if (!widget.isWide) ...[
                const SizedBox(width: 16),
                Expanded(child: card),
              ],
              // Spacer for alternating layout
              if (widget.isWide && widget.isLeft)
                const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _hovered
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.surface.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _hovered
                  ? widget.accent.withValues(alpha: 0.3)
                  : AppTheme.divider,
            ),
            boxShadow: [
              BoxShadow(
                color: _hovered
                    ? widget.accent.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.03),
                blurRadius: _hovered ? 16 : 8,
                offset: Offset(0, _hovered ? 6 : 2),
              ),
            ],
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: widget.accent.withValues(
                    alpha: _hovered ? 0.12 : 0.07,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(widget.icon, color: widget.accent, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.date.date,
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: widget.accent,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.date.label,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textDark,
                        height: 1.4,
                        fontWeight: FontWeight.w500,
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

class _FaqRow extends StatelessWidget {
  final _FAQ faq;
  final int index;
  final bool isOpen;
  final VoidCallback onTap;
  const _FaqRow({
    required this.faq,
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    faq.q,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
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
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 18),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.maroon.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.divider),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        faq.a,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textMuted,
                          height: 1.65,
                        ),
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
