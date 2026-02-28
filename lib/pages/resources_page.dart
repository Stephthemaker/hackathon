import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/section_heading.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});
  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  int? _openFaq;

  static const _links = [
    _RL(
      Icons.school,
      'SUNLearn',
      'blackboard.sun.ac.za',
      'Course content, assignments, and grades.',
    ),
    _RL(
      Icons.computer,
      'CS Lab Booking',
      'labs.cs.sun.ac.za',
      'Reserve a computer lab session.',
    ),
    _RL(
      Icons.library_books,
      'Library E-Resources',
      'library.sun.ac.za',
      'IEEE Xplore, ACM DL, Springer, and more.',
    ),
    _RL(
      Icons.wifi,
      'eduroam Setup',
      'it.sun.ac.za/eduroam',
      'Wireless access across campus.',
    ),
    _RL(
      Icons.cloud,
      'Stellenbosch HPC',
      'hpc.sun.ac.za',
      'High-performance computing cluster access.',
    ),
    _RL(
      Icons.contact_support,
      'IT Help Desk',
      'servicedesk.sun.ac.za',
      '24/7 technical support portal.',
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
  ];

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
                  label: 'Resources',
                  title: 'Student Resources',
                  subtitle:
                      'Everything you need — course portals, lab access, IT support, and answers to common questions.',
                ),
                const SizedBox(height: 48),
                _linksGrid(cols),
                const SizedBox(height: 64),
                Row(
                  children: [
                    Container(width: 3, height: 24, color: AppTheme.gold),
                    const SizedBox(width: 12),
                    Text(
                      'Frequently Asked Questions',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textDark,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
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

  Widget _linksGrid(int cols) {
    final rows = <Widget>[];
    for (int i = 0; i < _links.length; i += cols) {
      final end = (i + cols < _links.length) ? i + cols : _links.length;
      final row = _links.sublist(i, end);
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
                    child: _LinkCard(link: e.value),
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

class _RL {
  final IconData icon;
  final String name, url, desc;
  const _RL(this.icon, this.name, this.url, this.desc);
}

class _FAQ {
  final String q, a;
  const _FAQ(this.q, this.a);
}

class _LinkCard extends StatelessWidget {
  final _RL link;
  const _LinkCard({required this.link});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () {},
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
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.open_in_new, size: 12, color: AppTheme.maroon),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    link.url,
                    style: GoogleFonts.inter(
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
                      child: Text(
                        faq.a,
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
