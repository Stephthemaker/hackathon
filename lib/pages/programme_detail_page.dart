import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../settings/app_settings.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/breadcrumb.dart';

class ProgrammeDetailPage extends StatelessWidget {
  final String id;
  const ProgrammeDetailPage({super.key, required this.id});

  static const _programmes = {
    'bsc': _ProgDetail(
      name: 'BSc Computer Science',
      level: 'Undergraduate',
      duration: '3 years full-time',
      accent: AppTheme.maroon,
      icon: Icons.school_outlined,
      overview:
          'The Bachelor of Science in Computer Science provides a comprehensive foundation in computational thinking, programming, and systems design. Students develop skills in software engineering, data structures, algorithms, and applied mathematics.',
      careerPaths: [
        'Software Developer',
        'Data Analyst',
        'Systems Engineer',
        'Web Developer',
        'IT Consultant',
        'Quality Assurance Engineer',
      ],
      entryRequirements: [
        'National Senior Certificate (NSC) with Bachelor\'s endorsement',
        'Mathematics: Level 6 (70%+)',
        'Physical Science or Information Technology: Level 5 (60%+)',
        'English: Level 4 (50%+)',
        'APS score of at least 34',
      ],
      curriculum: {
        'Year 1': [
          'CS 114 — Introductory CS 1',
          'CS 144 — Introductory CS 2',
          'Mathematics 114 & 144',
          'Applied Mathematics 114 & 144',
        ],
        'Year 2': [
          'CSE 214 — Object-Oriented Programming',
          'CS 214 — Data Structures and Algorithms',
          'CS 244 — Computer Architecture',
          'Mathematics 214 & 244',
        ],
        'Year 3': [
          'CS 313 — Computer Networks',
          'CS 314 — Concurrency',
          'CS 315 — Machine Learning',
          'CS 343 — Databases & Web Centric Programming',
          'CS 344 — Program Design',
          'CS 345 — Computability and Automata Theory',
        ],
      },
      applyUrl:
          'https://www.sun.ac.za/english/faculty/science/Pages/Applying-to-the-Faculty.aspx',
    ),
    'hons': _ProgDetail(
      name: 'BScHons Computer Science',
      level: 'Honours',
      duration: '1 year full-time',
      accent: AppTheme.gold,
      icon: Icons.workspace_premium_outlined,
      overview:
          'The Honours programme deepens knowledge in advanced computer science topics including algorithms, machine learning, and a substantial independent research project. This programme prepares students for both industry and further postgraduate study.',
      careerPaths: [
        'Machine Learning Engineer',
        'Research Scientist',
        'Senior Software Engineer',
        'Data Scientist',
        'Security Analyst',
        'Systems Architect',
      ],
      entryRequirements: [
        'BSc degree with Computer Science as a major',
        'Minimum 60% average in final-year CS modules',
        'Approval from the Head of Division',
        'Strong mathematical foundation',
      ],
      curriculum: {
        'Honours Year': [
          'CS 712 — Advanced Algorithms',
          'CS 716 — Adv. Topics I — Vulnerability Discovery',
          'CS 742 — Machine Learning A',
          'CS 745 — Software Construction — Compilers',
          'CS 771 — Honours Project in CS (32 credits)',
          '+ Elective modules',
        ],
      },
      applyUrl:
          'https://www.sun.ac.za/english/faculty/science/Pages/Applying-to-the-Faculty.aspx',
    ),
    'msc': _ProgDetail(
      name: 'MSc Computer Science',
      level: 'Postgraduate',
      duration: '1–2 years full-time',
      accent: Color(0xFF1D4ED8),
      icon: Icons.biotech_outlined,
      overview:
          'The Master\'s programme focuses on independent research in a specialised area of computer science, culminating in a thesis. Students work closely with a supervisor from one of the division\'s research groups.',
      careerPaths: [
        'Research Engineer',
        'AI/ML Researcher',
        'Lead Software Architect',
        'CTO / Technical Co-Founder',
        'University Lecturer',
        'Specialist Consultant',
      ],
      entryRequirements: [
        'BScHons in Computer Science or equivalent',
        'Minimum 65% average at Honours level',
        'Research proposal approved by a faculty supervisor',
        'Two academic references',
      ],
      curriculum: {
        'Year 1–2': [
          'Independent research under faculty supervision',
          'Thesis writing and defence',
          'Optional: Attendance at research colloquia',
          'Optional: One taught module by arrangement',
        ],
      },
      applyUrl:
          'https://www.sun.ac.za/english/faculty/science/Pages/Applying-to-the-Faculty.aspx',
    ),
    'phd': _ProgDetail(
      name: 'PhD Computer Science',
      level: 'Doctoral',
      duration: '3–5 years full-time',
      accent: Color(0xFF2D6A4F),
      icon: Icons.emoji_events_outlined,
      overview:
          'The PhD programme requires original research that makes a significant contribution to the field. Candidates produce a doctoral dissertation and are expected to publish in peer-reviewed venues.',
      careerPaths: [
        'Professor / Academic',
        'Research Director',
        'Chief Scientist',
        'Principal Engineer',
        'Postdoctoral Researcher',
        'Government Science Advisor',
      ],
      entryRequirements: [
        'MSc in Computer Science or closely related field',
        'Strong research publication record preferred',
        'Detailed research proposal',
        'Supervisor must agree to supervise',
        'Interview with the postgraduate committee',
      ],
      curriculum: {
        'Year 1–5': [
          'Original research in a specialised area',
          'Doctoral dissertation',
          'At least one peer-reviewed publication',
          'Oral defence (viva voce)',
        ],
      },
      applyUrl:
          'https://www.sun.ac.za/english/faculty/science/Pages/Applying-to-the-Faculty.aspx',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    final prog = _programmes[id];

    if (prog == null) {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(80),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.school_outlined,
                size: 64,
                color: AppTheme.textMuted,
              ),
              const SizedBox(height: 16),
              Text(
                'Programme not found',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => context.go('/programmes'),
                icon: const Icon(Icons.arrow_back, size: 16),
                label: const Text('Back to Programmes'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.maroon,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 920),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Breadcrumb
                Breadcrumb(
                  items: [
                    BreadcrumbItem(
                      label: s.tr('nav.programmes'),
                      route: '/programmes',
                    ),
                    BreadcrumbItem(label: prog.name),
                  ],
                ),
                const SizedBox(height: 32),

                // Header
                _ProgrammeHeader(prog: prog),
                const SizedBox(height: 40),

                // Overview
                _SectionTitle(
                  label: s.tr('prog.detail.overview'),
                  color: prog.accent,
                ),
                const SizedBox(height: 16),
                SelectionArea(
                  child: Text(
                    prog.overview,
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      color: AppTheme.textDark,
                      height: 1.8,
                    ),
                  ),
                ),
                const SizedBox(height: 48),

                // Entry requirements
                _SectionTitle(
                  label: s.tr('prog.detail.requirements'),
                  color: prog.accent,
                ),
                const SizedBox(height: 16),
                ...prog.entryRequirements.map(
                  (r) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: prog.accent,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            r,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: AppTheme.textDark,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 48),

                // Curriculum
                _SectionTitle(
                  label: s.tr('prog.detail.curriculum'),
                  color: prog.accent,
                ),
                const SizedBox(height: 16),
                ...prog.curriculum.entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: prog.accent.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            entry.key,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: prog.accent,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...entry.value.map(
                          (mod) => Padding(
                            padding: const EdgeInsets.only(bottom: 8, left: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: AppTheme.textMuted,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    mod,
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: AppTheme.textDark,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 48),

                // Career paths
                _SectionTitle(
                  label: s.tr('prog.detail.careers'),
                  color: prog.accent,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: prog.careerPaths
                      .map(
                        (c) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: prog.accent.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: prog.accent.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Text(
                            c,
                            style: GoogleFonts.openSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: prog.accent,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 56),

                // Apply CTA
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        prog.accent,
                        prog.accent.withValues(alpha: 0.85),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        s.tr('prog.detail.apply_title'),
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        s.tr('prog.detail.apply_body'),
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => launchUrl(
                              Uri.parse(prog.applyUrl),
                              mode: LaunchMode.externalApplication,
                            ),
                            icon: const Icon(Icons.launch, size: 16),
                            label: Text(s.tr('prog.detail.apply_btn')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: prog.accent,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => context.go('/contact'),
                            icon: const Icon(Icons.email_outlined, size: 16),
                            label: Text(s.tr('prog.detail.contact_btn')),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: BorderSide(
                                color: Colors.white.withValues(alpha: 0.5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Back
                Center(
                  child: TextButton.icon(
                    onPressed: () => context.go('/programmes'),
                    icon: const Icon(Icons.arrow_back, size: 16),
                    label: Text(s.tr('prog.detail.back')),
                    style: TextButton.styleFrom(
                      foregroundColor: AppTheme.maroon,
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
}

class _ProgrammeHeader extends StatelessWidget {
  final _ProgDetail prog;
  const _ProgrammeHeader({required this.prog});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: prog.accent.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: prog.accent.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: prog.accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(prog.icon, size: 28, color: prog.accent),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: prog.accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    prog.level,
                    style: GoogleFonts.openSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: prog.accent,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  prog.name,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  prog.duration,
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: AppTheme.textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String label;
  final Color color;
  const _SectionTitle({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.textDark,
          ),
        ),
      ],
    );
  }
}

class _ProgDetail {
  final String name, level, duration, overview, applyUrl;
  final Color accent;
  final IconData icon;
  final List<String> careerPaths, entryRequirements;
  final Map<String, List<String>> curriculum;

  const _ProgDetail({
    required this.name,
    required this.level,
    required this.duration,
    required this.accent,
    required this.icon,
    required this.overview,
    required this.careerPaths,
    required this.entryRequirements,
    required this.curriculum,
    required this.applyUrl,
  });
}
