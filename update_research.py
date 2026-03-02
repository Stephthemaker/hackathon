import os
import re

file_path = '/Users/stephhenning/Documents/university/2026/other/hackathon/lib/pages/research_page.dart'
with open(file_path, 'r') as f:
    content = f.read()

# Add _Link class and update _RG class
new_classes = """class _Link {
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
}"""

content = re.sub(r'class _RG \{[\s\S]*?\}', new_classes, content)

# Add import
if 'url_launcher/url_launcher.dart' not in content:
    content = content.replace(
        "import 'package:go_router/go_router.dart';",
        "import 'package:go_router/go_router.dart';\nimport 'package:url_launcher/url_launcher.dart';"
    )

# Inject data for Automata
content = content.replace(
    "name: 'Theory and Applications of Automata and Grammars',",
    "name: 'Theory and Applications of Automata and Grammars',\n      officialLinks: [\n        _Link('Group Website', 'http://www.cs.sun.ac.za/~lvzijl/research.html'),\n        _Link('Regex Analysis Project', 'http://www.cs.sun.ac.za/~abvdm/regex.html'),\n      ],"
)

# Inject data for SEV
content = content.replace(
    "name: 'Software Engineering and Verification',",
    "name: 'Software Engineering and Verification',\n      officialLinks: [\n        _Link('COASTAL', 'http://www.cs.sun.ac.za/coastal/'),\n        _Link('ESBMC', 'http://www.esbmc.org/'),\n        _Link('CSeq', 'http://www.southampton.ac.uk/~gp1y10/cseq/'),\n      ],"
)

# Inject data for Broadband
content = content.replace(
    "name: 'Telkom-Siemens CoE in Broadband Networks',",
    "name: 'Telkom-Siemens CoE in Broadband Networks',\n      officialLinks: [\n        _Link('Centre of Excellence', 'http://www.cs.sun.ac.za/~aek1/'),\n      ],"
)

# UI modification
ui_block = """          if (group.officialLinks.isNotEmpty) ...[
            const SizedBox(height: 24),
            Text(
              'OFFICIAL LINKS',
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
              children: group.officialLinks.map((link) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => launchUrl(Uri.parse(link.url)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.link, size: 14, color: AppTheme.gold),
                      const SizedBox(width: 6),
                      Text(
                        link.label,
                        style: GoogleFonts.openSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.maroon,
                          decoration: TextDecoration.underline,
                          decorationColor: AppTheme.maroon.withValues(alpha: 0.3),
                        ),
                      ),
                    ],
                  ),
                ),
              )).toList(),
            ),
          ],
          const SizedBox(height: 28),"""

# We look for the first occurrence of the spacing where we want to insert the links
content = content.replace("const SizedBox(height: 28),", ui_block)

with open(file_path, 'w') as f:
    f.write(content)
