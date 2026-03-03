import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';

class CodeSnippetCard extends StatefulWidget {
  const CodeSnippetCard({super.key});

  @override
  State<CodeSnippetCard> createState() => _CodeSnippetCardState();
}

class _CodeSnippetCardState extends State<CodeSnippetCard> {
  bool _copied = false;

  static const _codeText =
      'def optimize_future(students):\n'
      '    """\n'
      '    Algorithms for a better tomorrow.\n'
      '    """\n'
      '    research_output = []\n\n'
      '    for student in students:\n'
      '        innovation = student.innovate()\n'
      '        research_output.append(innovation)\n\n'
      '    return research_output\n\n'
      '# Initialize the next generation\n'
      'impact = optimize_future(SU_Computing)\n';

  void _copyToClipboard() {
    Clipboard.setData(const ClipboardData(text: _codeText));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Classic dark editor theme
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 30,
            offset: const Offset(0, 20),
          ),
          BoxShadow(
            color: AppTheme.maroon.withValues(alpha: 0.3),
            blurRadius: 40,
            spreadRadius: -10,
          ),
        ],
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Mac-like window controls
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF2D2D2D),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(11),
              ),
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withValues(alpha: 0.05),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                _buildDot(const Color(0xFFFF5F56)),
                const SizedBox(width: 8),
                _buildDot(const Color(0xFFFFBD2E)),
                const SizedBox(width: 8),
                _buildDot(const Color(0xFF27C93F)),
                const SizedBox(width: 16),
                Text(
                  'stellenbosch_cs.py',
                  style: GoogleFonts.firaCode(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: _copyToClipboard,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _copied
                          ? Row(
                              key: const ValueKey('copied'),
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check,
                                  size: 14,
                                  color: const Color(0xFF27C93F),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Copied!',
                                  style: GoogleFonts.firaCode(
                                    fontSize: 11,
                                    color: const Color(0xFF27C93F),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              key: const ValueKey('copy'),
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.copy,
                                  size: 14,
                                  color: Colors.white.withValues(alpha: 0.4),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Copy',
                                  style: GoogleFonts.firaCode(
                                    fontSize: 11,
                                    color: Colors.white.withValues(alpha: 0.4),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Code content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text.rich(
              TextSpan(
                style: GoogleFonts.firaCode(
                  fontSize: 14,
                  height: 1.6,
                  color: const Color(0xFFD4D4D4),
                ),
                children: const [
                  TextSpan(
                    text: 'def ',
                    style: TextStyle(color: Color(0xFF569CD6)),
                  ),
                  TextSpan(
                    text: 'optimize_future',
                    style: TextStyle(color: Color(0xFFDCDCAA)),
                  ),
                  TextSpan(
                    text: '(students):\n',
                    style: TextStyle(color: Color(0xFFD4D4D4)),
                  ),

                  TextSpan(
                    text: '    """\n',
                    style: TextStyle(color: Color(0xFF6A9955)),
                  ),
                  TextSpan(
                    text: '    Algorithms for a better tomorrow.\n',
                    style: TextStyle(color: Color(0xFF6A9955)),
                  ),
                  TextSpan(
                    text: '    """\n',
                    style: TextStyle(color: Color(0xFF6A9955)),
                  ),

                  TextSpan(
                    text: '    research_output ',
                    style: TextStyle(color: Color(0xFF9CDCFE)),
                  ),
                  TextSpan(
                    text: '= ',
                    style: TextStyle(color: Color(0xFFD4D4D4)),
                  ),
                  TextSpan(
                    text: '[]\n\n',
                    style: TextStyle(color: Color(0xFFD4D4D4)),
                  ),

                  TextSpan(
                    text: '    for ',
                    style: TextStyle(color: Color(0xFFC586C0)),
                  ),
                  TextSpan(
                    text: 'student ',
                    style: TextStyle(color: Color(0xFF9CDCFE)),
                  ),
                  TextSpan(
                    text: 'in ',
                    style: TextStyle(color: Color(0xFFC586C0)),
                  ),
                  TextSpan(
                    text: 'students:\n',
                    style: TextStyle(color: Color(0xFFD4D4D4)),
                  ),

                  TextSpan(
                    text: '        innovation ',
                    style: TextStyle(color: Color(0xFF9CDCFE)),
                  ),
                  TextSpan(
                    text: '= ',
                    style: TextStyle(color: Color(0xFFD4D4D4)),
                  ),
                  TextSpan(
                    text: 'student.innovate()\n',
                    style: TextStyle(color: Color(0xFFD4D4D4)),
                  ),
                  TextSpan(
                    text: '        research_output.append(innovation)\n\n',
                    style: TextStyle(color: Color(0xFFD4D4D4)),
                  ),

                  TextSpan(
                    text: '    return ',
                    style: TextStyle(color: Color(0xFFC586C0)),
                  ),
                  TextSpan(
                    text: 'research_output\n\n',
                    style: TextStyle(color: Color(0xFFD4D4D4)),
                  ),

                  TextSpan(
                    text: '# Initialize the next generation\n',
                    style: TextStyle(color: Color(0xFF6A9955)),
                  ),
                  TextSpan(
                    text: 'impact ',
                    style: TextStyle(color: Color(0xFF9CDCFE)),
                  ),
                  TextSpan(
                    text: '= ',
                    style: TextStyle(color: Color(0xFFD4D4D4)),
                  ),
                  TextSpan(
                    text: 'optimize_future',
                    style: TextStyle(color: Color(0xFFDCDCAA)),
                  ),
                  TextSpan(
                    text: '(SU_Computing)\n',
                    style: TextStyle(color: Color(0xFFD4D4D4)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
