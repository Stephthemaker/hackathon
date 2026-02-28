import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/app_theme.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.darkBg,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row
                Wrap(
                  spacing: 48,
                  runSpacing: 48,
                  children: [
                    _FooterBrand(),
                    _FooterLinks(
                      title: 'Department',
                      links: const [
                        _Link('Overview', '/'),
                        _Link('Academic Staff', '/staff'),
                        _Link('Research Groups', '/research'),
                        _Link('Programmes', '/programmes'),
                      ],
                    ),
                    _FooterLinks(
                      title: 'Resources',
                      links: const [
                        _Link('News & Events', '/news'),
                        _Link('Student Resources', '/resources'),
                        _Link('Contact Us', '/contact'),
                        _Link('SunLearn', 'https://learn.sun.ac.za'),
                      ],
                    ),
                    _FooterLinks(
                      title: 'Useful Links',
                      links: const [
                        _Link('my.SUN Portal', 'https://my.sun.ac.za'),
                        _Link('SU Library', 'https://library.sun.ac.za'),
                        _Link('SU Main Website', 'https://www.sun.ac.za'),
                        _Link('DevSoc', 'https://hackathon.devsoc.co.za'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Divider(color: Colors.white.withValues(alpha: 0.1)),
                const SizedBox(height: 24),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 16,
                  runSpacing: 8,
                  children: [
                    Text(
                      '© 2026 Department of Computer Science, Stellenbosch University.',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.4),
                      ),
                    ),
                    Text(
                      'Private Bag X1, Matieland 7602',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: SvgPicture.asset(
                  'web/assets/favicon.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Computer Science',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Stellenbosch University',
                    style: GoogleFonts.inter(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Advancing computer science through world-class research, innovative teaching, and community impact in Africa.',
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 13,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _SocialIcon(Icons.language, 'cs.sun.ac.za'),
              const SizedBox(width: 8),
              _SocialIcon(Icons.alternate_email, '@SUCompSci'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  const _SocialIcon(this.icon, this.tooltip);

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Tooltip(
        message: widget.tooltip,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _hovered
                ? AppTheme.gold.withValues(alpha: 0.2)
                : Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            widget.icon,
            color: _hovered
                ? AppTheme.gold
                : Colors.white.withValues(alpha: 0.5),
            size: 18,
          ),
        ),
      ),
    );
  }
}

class _FooterLinks extends StatelessWidget {
  final String title;
  final List<_Link> links;

  const _FooterLinks({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map(
          (l) =>
              _FooterLinkItem(label: l.label, route: l.route, context: context),
        ),
      ],
    );
  }
}

class _Link {
  final String label;
  final String route;
  const _Link(this.label, this.route);
}

class _FooterLinkItem extends StatefulWidget {
  final String label;
  final String route;
  final BuildContext context;

  const _FooterLinkItem({
    required this.label,
    required this.route,
    required this.context,
  });

  @override
  State<_FooterLinkItem> createState() => _FooterLinkItemState();
}

class _FooterLinkItemState extends State<_FooterLinkItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (widget.route.startsWith('http')) {
            launchUrl(
              Uri.parse(widget.route),
              mode: LaunchMode.externalApplication,
            );
          } else {
            context.go(widget.route);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: GoogleFonts.inter(
              fontSize: 13,
              color: _hovered
                  ? AppTheme.gold
                  : Colors.white.withValues(alpha: 0.5),
              height: 1.5,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
