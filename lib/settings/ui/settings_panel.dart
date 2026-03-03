import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../translations.dart';
import '../app_settings.dart';

/// A slide-out settings panel shown from the right edge.
class SettingsPanel extends StatelessWidget {
  const SettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    final isDark = s.darkMode;
    final bg = isDark ? const Color(0xFF1A1A2E) : Colors.white;
    final fg = isDark ? Colors.white : AppTheme.textDark;
    final muted = isDark ? Colors.white60 : AppTheme.textMuted;
    final divider = isDark
        ? Colors.white.withValues(alpha: 0.08)
        : AppTheme.divider;

    return Material(
      color: bg,
      child: SafeArea(
        child: SizedBox(
          width: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ─────────────────────────────────────────────
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: divider)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.tune_rounded, color: AppTheme.maroon, size: 22),
                    const SizedBox(width: 10),
                    Text(
                      s.tr('settings.title'),
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: fg,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.close, color: muted, size: 20),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),

              // ── Scrollable body ────────────────────────────────────
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  children: [
                    // ── Language ───────────────────────────────────────
                    _SectionLabel(s.tr('settings.language'), fg),
                    const SizedBox(height: 12),
                    ...AppLocale.values.map(
                      (loc) => _LanguageTile(
                        locale: loc,
                        isSelected: s.locale == loc,
                        fg: fg,
                        isDark: isDark,
                        onTap: () => s.locale = loc,
                      ),
                    ),

                    const SizedBox(height: 28),
                    Divider(color: divider),
                    const SizedBox(height: 20),

                    // ── Appearance ─────────────────────────────────────
                    _SectionLabel(s.tr('settings.appearance'), fg),
                    const SizedBox(height: 12),
                    _ToggleTile(
                      icon: Icons.dark_mode_outlined,
                      label: s.tr('settings.darkmode'),
                      value: s.darkMode,
                      fg: fg,
                      onChanged: (v) => s.darkMode = v,
                    ),
                    const SizedBox(height: 8),
                    _ToggleTile(
                      icon: Icons.contrast,
                      label: s.tr('settings.highcontrast'),
                      value: s.highContrast,
                      fg: fg,
                      onChanged: (v) => s.highContrast = v,
                    ),

                    const SizedBox(height: 28),
                    Divider(color: divider),
                    const SizedBox(height: 20),

                    // ── Font Size ──────────────────────────────────────
                    _SectionLabel(s.tr('settings.fontsize'), fg),
                    const SizedBox(height: 12),
                    _FontSizeSelector(fg: fg, muted: muted, isDark: isDark),

                    const SizedBox(height: 28),
                    Divider(color: divider),
                    const SizedBox(height: 20),

                    // ── Accessibility ──────────────────────────────────
                    _SectionLabel(s.tr('settings.accessibility'), fg),
                    const SizedBox(height: 12),
                    _ToggleTile(
                      icon: Icons.animation,
                      label: s.tr('settings.reducemotion'),
                      value: s.reduceMotion,
                      fg: fg,
                      onChanged: (v) => s.reduceMotion = v,
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

// ---------------------------------------------------------------------------
// Section label
// ---------------------------------------------------------------------------
class _SectionLabel extends StatelessWidget {
  final String text;
  final Color fg;
  const _SectionLabel(this.text, this.fg);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.openSans(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.8,
        color: AppTheme.gold,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Language tile
// ---------------------------------------------------------------------------
class _LanguageTile extends StatefulWidget {
  final AppLocale locale;
  final bool isSelected;
  final Color fg;
  final bool isDark;
  final VoidCallback onTap;

  const _LanguageTile({
    required this.locale,
    required this.isSelected,
    required this.fg,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<_LanguageTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final selectedBg = widget.isDark
        ? AppTheme.maroon.withValues(alpha: 0.25)
        : AppTheme.maroon.withValues(alpha: 0.06);
    final hoverBg = widget.isDark
        ? Colors.white.withValues(alpha: 0.05)
        : Colors.grey.withValues(alpha: 0.05);

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? selectedBg
                  : (_hovered ? hoverBg : Colors.transparent),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.isSelected
                    ? AppTheme.maroon.withValues(alpha: 0.4)
                    : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Text(widget.locale.flag, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.locale.label,
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: widget.isSelected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: widget.fg,
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.isSelected)
                  Icon(Icons.check_circle, color: AppTheme.maroon, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Toggle tile
// ---------------------------------------------------------------------------
class _ToggleTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool value;
  final Color fg;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.fg,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppTheme.textMuted),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: fg,
            ),
          ),
        ),
        SizedBox(
          height: 28,
          child: Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppTheme.maroon,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Font size selector
// ---------------------------------------------------------------------------
class _FontSizeSelector extends StatelessWidget {
  final Color fg;
  final Color muted;
  final bool isDark;
  const _FontSizeSelector({
    required this.fg,
    required this.muted,
    required this.isDark,
  });

  static const _sizes = [
    (0.85, 'settings.fontsize.small', 'A'),
    (1.0, 'settings.fontsize.medium', 'A'),
    (1.2, 'settings.fontsize.large', 'A'),
  ];

  @override
  Widget build(BuildContext context) {
    final s = AppSettingsProvider.of(context);
    return Row(
      children: _sizes.map((entry) {
        final (scale, key, letter) = entry;
        final selected = (s.fontScale - scale).abs() < 0.01;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _FontSizeButton(
              letter: letter,
              label: s.tr(key),
              fontSize: 14 * scale,
              selected: selected,
              fg: fg,
              isDark: isDark,
              onTap: () => s.fontScale = scale,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _FontSizeButton extends StatefulWidget {
  final String letter;
  final String label;
  final double fontSize;
  final bool selected;
  final Color fg;
  final bool isDark;
  final VoidCallback onTap;

  const _FontSizeButton({
    required this.letter,
    required this.label,
    required this.fontSize,
    required this.selected,
    required this.fg,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_FontSizeButton> createState() => _FontSizeButtonState();
}

class _FontSizeButtonState extends State<_FontSizeButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final selBg = widget.isDark
        ? AppTheme.maroon.withValues(alpha: 0.3)
        : AppTheme.maroon.withValues(alpha: 0.08);
    final hovBg = widget.isDark
        ? Colors.white.withValues(alpha: 0.05)
        : Colors.grey.withValues(alpha: 0.06);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: widget.selected
                ? selBg
                : (_hovered ? hovBg : Colors.transparent),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: widget.selected
                  ? AppTheme.maroon.withValues(alpha: 0.4)
                  : (widget.isDark
                        ? Colors.white.withValues(alpha: 0.08)
                        : AppTheme.divider),
            ),
          ),
          child: Column(
            children: [
              Text(
                widget.letter,
                style: GoogleFonts.openSans(
                  fontSize: widget.fontSize,
                  fontWeight: widget.selected
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: widget.selected ? AppTheme.maroon : widget.fg,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.label,
                style: GoogleFonts.openSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: widget.selected ? AppTheme.maroon : AppTheme.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
