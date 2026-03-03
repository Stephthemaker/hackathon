import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../settings/app_settings.dart';
import '../ui/widgets/hover_card.dart';
import '../ui/widgets/section_heading.dart';
import '../ui/widgets/google_map_web.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _email = '', _subject = 'General Enquiry', _message = '';
  bool _submitted = false;

  static const _subjectKeys = {
    'General Enquiry': 'contact.subject.general',
    'Undergraduate Admissions': 'contact.subject.ug_admissions',
    'Postgraduate Admissions': 'contact.subject.pg_admissions',
    'Research Collaboration': 'contact.subject.research',
    'Industry Partnership': 'contact.subject.industry',
    'Media / Press': 'contact.subject.media',
    'IT Support': 'contact.subject.it_support',
  };

  static const _subjects = [
    'General Enquiry',
    'Undergraduate Admissions',
    'Postgraduate Admissions',
    'Research Collaboration',
    'Industry Partnership',
    'Media / Press',
    'IT Support',
  ];

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Open the user's email client with pre-filled fields
      final mailUri = Uri(
        scheme: 'mailto',
        path: 'info@cs.sun.ac.za',
        queryParameters: {
          'subject': '[$_subject] from $_name',
          'body': 'From: $_name ($_email)\n\n$_message',
        },
      );
      launchUrl(mailUri);
      setState(() => _submitted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final wide = w > 860;
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
                  label: AppSettingsProvider.of(context).tr('contact.label'),
                  title: AppSettingsProvider.of(context).tr('contact.title'),
                  subtitle: AppSettingsProvider.of(
                    context,
                  ).tr('contact.subtitle'),
                ),
                const SizedBox(height: 48),
                if (wide)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 6, child: _formOrSuccess()),
                      const SizedBox(width: 32),
                      Expanded(flex: 4, child: const _InfoPanel()),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _formOrSuccess(),
                      const SizedBox(height: 32),
                      const _InfoPanel(),
                    ],
                  ),
                const SizedBox(height: 60),
                const GoogleMapWeb(
                  location:
                      'Computer Science Division, Mathematical Sciences, Stellenbosch University, Stellenbosch',
                  height: 400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formOrSuccess() {
    if (_submitted) {
      return HoverCard(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFF15803D),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 32),
              ),
              const SizedBox(height: 20),
              Text(
                AppSettingsProvider.of(context).tr('contact.success.title'),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Text(
                AppSettingsProvider.of(context)
                    .tr('contact.success.body')
                    .replaceAll('{name}', _name)
                    .replaceAll('{email}', _email),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 20),
              SelectionContainer.disabled(
                child: TextButton(
                  onPressed: () => setState(() {
                    _submitted = false;
                    _formKey.currentState?.reset();
                  }),
                  child: Text(
                    AppSettingsProvider.of(
                      context,
                    ).tr('contact.btn.send_another'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return HoverCard(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(width: 3, height: 20, color: AppTheme.gold),
                  const SizedBox(width: 10),
                  Text(
                    AppSettingsProvider.of(context).tr('contact.form.heading'),
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _textField(
                      AppSettingsProvider.of(context).tr('contact.form.name'),
                      onSaved: (v) => _name = v ?? '',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _textField(
                      AppSettingsProvider.of(context).tr('contact.form.email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) => (v?.contains('@') ?? false)
                          ? null
                          : AppSettingsProvider.of(
                              context,
                            ).tr('contact.form.email_error'),
                      onSaved: (v) => _email = v ?? '',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _subject,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  labelText: AppSettingsProvider.of(
                    context,
                  ).tr('contact.form.subject'),
                ),
                items: _subjects
                    .map(
                      (s) => DropdownMenuItem(
                        value: s,
                        child: Text(
                          AppSettingsProvider.of(
                            context,
                          ).tr(_subjectKeys[s] ?? s),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (v) => setState(() => _subject = v ?? _subject),
                onSaved: (v) => _subject = v ?? _subject,
              ),
              const SizedBox(height: 16),
              _textField(
                AppSettingsProvider.of(context).tr('contact.form.message'),
                maxLines: 5,
                onSaved: (v) => _message = v ?? '',
              ),
              const SizedBox(height: 24),
              SelectionContainer.disabled(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.maroon,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      AppSettingsProvider.of(context).tr('contact.btn.send'),
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(
    String label, {
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
  }) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
      validator:
          validator ??
          (v) => (v?.trim().isEmpty ?? true)
              ? AppSettingsProvider.of(context).tr('contact.form.required')
              : null,
      onSaved: onSaved,
    );
  }
}

class _InfoPanel extends StatelessWidget {
  const _InfoPanel();

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HoverCard(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(width: 3, height: 20, color: AppTheme.gold),
                    const SizedBox(width: 10),
                    Text(
                      s.tr('contact.info.heading'),
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const _InfoRow(
                  Icons.location_on,
                  '77 Techno Park Dr, Stellenbosch, 7600',
                ),
                const _InfoRow(Icons.phone, '+27 21 808 4200'),
                const _InfoRow(Icons.email, 'cs@sun.ac.za'),
                _InfoRow(Icons.access_time, s.tr('contact.info.hours')),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        HoverCard(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(width: 3, height: 20, color: AppTheme.gold),
                    const SizedBox(width: 10),
                    Text(
                      s.tr('contact.key_contacts.heading'),
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _KeyContact(
                  s.tr('contact.key_contacts.ug_office'),
                  'ug@cs.sun.ac.za',
                ),
                _KeyContact(
                  s.tr('contact.key_contacts.pg_office'),
                  'pg@cs.sun.ac.za',
                ),
                _KeyContact(
                  s.tr('contact.key_contacts.research_office'),
                  'research@cs.sun.ac.za',
                ),
                _KeyContact(
                  s.tr('contact.key_contacts.it_support'),
                  'it@cs.sun.ac.za',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: AppTheme.maroon),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _KeyContact extends StatefulWidget {
  final String name, email;
  const _KeyContact(this.name, this.email);

  @override
  State<_KeyContact> createState() => _KeyContactState();
}

class _KeyContactState extends State<_KeyContact> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: GoogleFonts.openSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Semantics(
            link: true,
            label: 'Email ${widget.name}: ${widget.email}',
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _hovered = true),
              onExit: (_) => setState(() => _hovered = false),
              child: GestureDetector(
                onTap: () {
                  launchUrl(Uri(scheme: 'mailto', path: widget.email));
                },
                child: SelectionContainer.disabled(
                  child: Text(
                    widget.email,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      color: AppTheme.maroon,
                      decoration: _hovered
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: AppTheme.maroon,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
