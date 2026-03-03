import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../settings/app_settings.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/breadcrumb.dart';

/// Full article detail page for /news/:slug
class NewsDetailPage extends StatelessWidget {
  final String slug;
  const NewsDetailPage({super.key, required this.slug});

  // Shared news data — mirrors news_events_page.dart
  static const _allNews = [
    _Article(
      slug: 'prof-fourie-nrf-a-rating',
      title: 'Prof. Fourie receives NRF A-rating',
      cat: 'Research',
      blurb:
          'The NRF has awarded an A-rating to Prof Johan Fourie for groundbreaking work in African-language NLP.',
      date: '12 Jun 2026',
      body:
          '''The National Research Foundation (NRF) has bestowed an A-rating upon Professor Johan Fourie of the Computer Science Division at Stellenbosch University, recognising his sustained and internationally acclaimed contributions to the field of Natural Language Processing for African languages.

An NRF A-rating designates a researcher as a world leader whose peers consider them to be at the forefront of their research area globally. Prof. Fourie's work focuses on developing novel deep-learning architectures for low-resource African languages, including isiXhosa, isiZulu, and Afrikaans.

"This rating underscores the importance of applying cutting-edge AI to preserve and empower African languages in the digital age," said Prof. Fourie. "Our research group has built open-source language models and datasets that are now used by researchers and practitioners across the continent."

The department head, Prof. Brink van der Merwe, congratulated Prof. Fourie, describing the achievement as "a landmark for the division and a testament to the world-class research happening right here in Stellenbosch."''',
    ),
    _Article(
      slug: 'cs-students-win-devsoc-hackathon',
      title: 'CS students win DevSoc Hackathon 2026',
      cat: 'Awards',
      blurb:
          'Two teams swept the top spots at the DevSoc 24-hour hackathon with AI-powered solutions.',
      date: '4 May 2026',
      body:
          '''Two student teams from Stellenbosch University's Computer Science Division dominated the annual DevSoc Hackathon, taking home first and second place in the 24-hour coding marathon held at the Neelsie Student Centre.

The winning team, "Matie Minds," developed an AI-powered campus accessibility navigator that uses computer vision to map wheelchair-friendly routes in real-time. The runner-up team, "StellenBot," built a smart tutoring system that generates personalised practice exercises for first-year programming students.

"We barely slept, but the adrenaline of building something genuinely useful kept us going," said team captain Liam Petersen, a third-year BSc Computer Science student. "The judges were impressed by how we integrated real campus data with the Google Maps API."

The hackathon attracted over 200 participants from 12 South African universities. DevSoc, the department's student-led developer society, organises the event annually to foster innovation and collaboration.''',
    ),
    _Article(
      slug: 'new-ai-lab-opens',
      title: 'New AI Lab opens in Engineering A Building',
      cat: 'Research',
      blurb:
          'The department inaugurates a state-of-the-art GPU cluster lab for large-scale model training.',
      date: '28 Apr 2026',
      body:
          '''Stellenbosch University's Computer Science Division has officially opened a cutting-edge AI research laboratory in the Engineering A Building, featuring a high-performance GPU cluster capable of training large-scale machine learning models.

The lab houses 16 NVIDIA A100 GPU nodes interconnected with high-speed InfiniBand networking, along with dedicated workstations for researchers and postgraduate students. The facility is part of a R25 million investment in computational research infrastructure.

Professor Andries Engelbrecht, who leads the division's Artificial Intelligence group, described the lab as "a game-changer for our research ambitions." The new facility will support projects ranging from federated learning in medical imaging to generative AI for African languages.

The lab is available to all postgraduate students and research staff within the division, with a booking system managed through SUNLearn.''',
    ),
    _Article(
      slug: 'industry-day-2026',
      title: 'Industry Day 2026 — over 40 companies attending',
      cat: 'Industry',
      blurb:
          'Our annual Industry Day connects final-year students with top tech employers across the Western Cape.',
      date: '15 Mar 2026',
      body:
          '''The Computer Science Division's annual Industry Day returns this September with a record 40+ companies confirmed to attend, creating a prime opportunity for final-year undergraduate and postgraduate students to connect with leading tech employers.

Companies ranging from established enterprises like Discovery, Standard Bank, and Takealot to innovative start-ups like OfferZen, Luno, and Praelexis will set up exhibition stands, conduct on-the-spot interviews, and present lightning talks on their technology stacks and graduate programmes.

"Industry Day is the single most impactful career event our students attend," said the event organiser, Dr Marcel Dunaiski. "Last year, over 60% of our final-year students received at least one job offer within three months of the event."

Students are encouraged to update their CVs and GitHub profiles ahead of the event. The Career Development Office will run CV review workshops throughout August.''',
    ),
    _Article(
      slug: 'undergraduate-open-day',
      title: 'Undergraduate open day report',
      cat: 'Events',
      blurb:
          'Over 800 prospective students visited campus; virtual sessions drew another 1,200 attendees online.',
      date: '5 Mar 2026',
      body:
          '''The Computer Science Division welcomed over 800 prospective students and their families to campus during the university's annual Open Day, while an additional 1,200 attended virtually through live-streamed presentations and interactive Q&A sessions.

Visitors toured the CS labs, experienced live coding demonstrations, and attended mini-lectures on topics ranging from "What is Computer Science?" to "Careers in AI and Data Science." The DevSoc club ran a popular build-your-first-website workshop for prospective students.

"We were thrilled by the turnout and the quality of questions from prospective students," said the Undergraduate Programme Coordinator. "Many were already coding in high school and eager to understand how our BSc programme can take their skills to the next level."

Virtual attendees could participate in a live chat with current students and academic staff, download programme brochures, and schedule one-on-one consultations. The event recording is available on the division's YouTube channel.''',
    ),
    _Article(
      slug: 'phd-nature-machine-intelligence',
      title: 'PhD student publishes in Nature Machine Intelligence',
      cat: 'Research',
      blurb:
          'Doctoral candidate Lena Botha co-authored a landmark paper on federated learning for medical imaging.',
      date: '20 Feb 2026',
      body:
          '''Lena Botha, a doctoral candidate in the Computer Science Division at Stellenbosch University, has co-authored a paper published in Nature Machine Intelligence — one of the world's most prestigious journals for AI research.

The paper, titled "Privacy-Preserving Federated Learning for Multi-Institutional Brain MRI Segmentation," presents a novel framework that allows multiple hospitals to collaboratively train diagnostic AI models without sharing sensitive patient data.

"Federated learning is the key to unlocking AI's potential in healthcare while respecting patient privacy," said Botha. "Our framework achieved segmentation accuracy comparable to centralised training while keeping all data local to each hospital."

The work was supervised by Prof. Andries Engelbrecht and conducted in collaboration with researchers at the University of Cape Town's medical informatics team and Tygerberg Hospital.

Ms. Botha is expected to defend her dissertation later this year.''',
    ),
  ];

  static const _catColors = {
    'Research': AppTheme.maroon,
    'Awards': Color(0xFFB45309),
    'Events': Color(0xFF1D4ED8),
    'Student Life': Color(0xFF15803D),
    'Industry': Color(0xFF6D28D9),
  };

  static const _catTranslationKeys = {
    'Research': 'news.cat.research',
    'Awards': 'news.cat.awards',
    'Events': 'news.cat.events',
    'Student Life': 'news.cat.student_life',
    'Industry': 'news.cat.industry',
  };

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    final article = _allNews.where((a) => a.slug == slug).firstOrNull;

    if (article == null) {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.all(80),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.article_outlined,
                size: 64,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 16),
              Text(
                'Article not found',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => context.go('/news'),
                icon: const Icon(Icons.arrow_back, size: 16),
                label: Text(s.tr('news.back')),
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

    final color = _catColors[article.cat] ?? AppTheme.maroon;
    final related = _allNews
        .where((a) => a.slug != slug && a.cat == article.cat)
        .take(2)
        .toList();
    final w = MediaQuery.of(context).size.width;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 860),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Breadcrumb
                Breadcrumb(
                  items: [
                    BreadcrumbItem(label: s.tr('nav.news'), route: '/news'),
                    BreadcrumbItem(label: article.title),
                  ],
                ),
                const SizedBox(height: 32),

                // Category + date
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        s.tr(_catTranslationKeys[article.cat] ?? article.cat),
                        style: GoogleFonts.openSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: color,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      article.date,
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Title
                SelectionArea(
                  child: Text(
                    article.title,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                      height: 1.25,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Blurb
                SelectionArea(
                  child: Text(
                    article.blurb,
                    style: GoogleFonts.openSans(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      height: 1.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Divider
                Container(height: 1, color: Theme.of(context).dividerColor),
                const SizedBox(height: 32),

                // Body text
                SelectionArea(
                  child: Text(
                    article.body,
                    style: GoogleFonts.openSans(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onSurface,
                      height: 1.85,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Share buttons
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: Row(
                    children: [
                      Text(
                        s.tr('news.share'),
                        style: GoogleFonts.openSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                      _ShareButton(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        onTap: () {
                          final uri = Uri(
                            scheme: 'mailto',
                            queryParameters: {
                              'subject': article.title,
                              'body':
                                  '${article.blurb}\n\nRead more: ${Uri.base}',
                            },
                          );
                          launchUrl(uri);
                        },
                      ),
                      const SizedBox(width: 8),
                      _ShareButton(
                        icon: Icons.link,
                        label: s.tr('news.copy_link'),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(s.tr('news.link_copied')),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // Related articles
                if (related.isNotEmpty) ...[
                  Text(
                    s.tr('news.related'),
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...related.map(
                    (r) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: HoverCard(
                        onTap: () => context.go('/news/${r.slug}'),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: _catColors[r.cat] ?? AppTheme.maroon,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      r.title,
                                      style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      r.date,
                                      style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 32),

                // Back to news
                Center(
                  child: TextButton.icon(
                    onPressed: () => context.go('/news'),
                    icon: const Icon(Icons.arrow_back, size: 16),
                    label: Text(s.tr('news.back')),
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

class _ShareButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ShareButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface,
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

class _Article {
  final String slug, title, cat, blurb, date, body;
  const _Article({
    required this.slug,
    required this.title,
    required this.cat,
    required this.blurb,
    required this.date,
    required this.body,
  });
}
