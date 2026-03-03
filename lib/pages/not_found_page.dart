import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../settings/app_settings.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  final List<String> _lines = [];
  int _currentLine = 0;
  bool _showInput = false;
  final _inputController = TextEditingController();
  final _inputFocus = FocusNode();

  static const _bootLines = [
    '> Initiating CS Department server...',
    '> Loading page resources...',
    '> ERROR 404: Page not found.',
    '> The requested resource does not exist on this server.',
    '> Suggestion: navigate to a known route.',
    '',
    'Type "home" to return, or "help" for options.',
  ];

  @override
  void initState() {
    super.initState();
    _typeNextLine();
  }

  @override
  void dispose() {
    _inputController.dispose();
    _inputFocus.dispose();
    super.dispose();
  }

  void _typeNextLine() {
    if (_currentLine >= _bootLines.length) {
      setState(() => _showInput = true);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _inputFocus.requestFocus();
      });
      return;
    }
    Timer(Duration(milliseconds: _currentLine == 0 ? 300 : 400), () {
      if (!mounted) return;
      setState(() {
        _lines.add(_bootLines[_currentLine]);
        _currentLine++;
      });
      _typeNextLine();
    });
  }

  void _handleCommand(String input) {
    final cmd = input.trim().toLowerCase();
    setState(() {
      _lines.add('matie@cs:\$ $input');
    });
    _inputController.clear();

    switch (cmd) {
      case 'home':
      case 'cd ~':
      case 'cd /':
        setState(() => _lines.add('> Redirecting to home...'));
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) context.go('/');
        });
        break;
      case 'help':
        setState(() {
          _lines.addAll([
            'Available commands:',
            '  home      — Go to the home page',
            '  staff     — View staff directory',
            '  research  — View research groups',
            '  programmes — View programmes',
            '  news      — View news & events',
            '  contact   — Contact information',
            '  clear     — Clear terminal',
          ]);
        });
        break;
      case 'staff':
      case 'research':
      case 'programmes':
      case 'news':
      case 'contact':
        setState(() => _lines.add('> Navigating to /$cmd...'));
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) context.go('/$cmd');
        });
        break;
      case 'clear':
        setState(() => _lines.clear());
        break;
      case 'sudo':
      case 'sudo rm -rf /':
        setState(() => _lines.add('> Nice try. 🙃'));
        break;
      default:
        setState(() => _lines.add('> Command not found: $cmd'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w < 600 ? 16 : 40,
            vertical: w < 600 ? 80 : 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 404 header
              Text(
                '404',
                style: GoogleFonts.playfairDisplay(
                  fontSize: w < 600 ? 52 : 72,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppSettingsProvider.of(context).tr('notfound.title'),
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 32),
              // Terminal widget
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 600,
                  maxHeight: w < 600 ? 300 : 360,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Title bar
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D2D2D),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(11),
                          ),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white.withValues(alpha: 0.05),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            _dot(const Color(0xFFFF5F56)),
                            const SizedBox(width: 8),
                            _dot(const Color(0xFFFFBD2E)),
                            const SizedBox(width: 8),
                            _dot(const Color(0xFF27C93F)),
                            const SizedBox(width: 16),
                            Text(
                              'cs-terminal — 404',
                              style: GoogleFonts.firaCode(
                                color: Colors.white.withValues(alpha: 0.5),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Terminal output
                      Expanded(
                        child: SelectionArea(
                          child: ListView(
                            padding: const EdgeInsets.all(16),
                            children: [
                              ..._lines.map(
                                (line) => Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    line,
                                    style: GoogleFonts.firaCode(
                                      fontSize: 13,
                                      color: line.startsWith('> ERROR')
                                          ? const Color(0xFFFF6B6B)
                                          : line.startsWith('>')
                                          ? const Color(0xFF6A9955)
                                          : const Color(0xFFD4D4D4),
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              if (_showInput)
                                Row(
                                  children: [
                                    Text(
                                      'matie@cs:\$ ',
                                      style: GoogleFonts.firaCode(
                                        fontSize: 13,
                                        color: const Color(0xFF569CD6),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: _inputController,
                                        focusNode: _inputFocus,
                                        style: GoogleFonts.firaCode(
                                          fontSize: 13,
                                          color: const Color(0xFFD4D4D4),
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding: EdgeInsets.zero,
                                          filled: false,
                                        ),
                                        cursorColor: const Color(0xFF569CD6),
                                        onSubmitted: _handleCommand,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SelectionContainer.disabled(
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/'),
                  icon: const Icon(Icons.home_outlined, size: 18),
                  label: Text(
                    AppSettingsProvider.of(context).tr('notfound.btn.home'),
                    style: GoogleFonts.openSans(fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.maroon,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
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

  Widget _dot(Color color) => Container(
    width: 12,
    height: 12,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}
