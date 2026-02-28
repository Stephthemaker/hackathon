import 'package:flutter/material.dart';

/// A card that lifts slightly and gains a shadow on hover.
class HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius = 12,
    this.color,
    this.padding,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: widget.padding,
          transform: Matrix4.translationValues(0, _hovered ? -4.0 : 0.0, 0),
          decoration: BoxDecoration(
            color: widget.color ?? Colors.white,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: _hovered
                  ? const Color(0xFF7C1033).withValues(alpha: 0.25)
                  : const Color(0xFFE5E0D8),
            ),
            boxShadow: [
              BoxShadow(
                color: _hovered
                    ? const Color(0xFF7C1033).withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.04),
                blurRadius: _hovered ? 24 : 8,
                offset: Offset(0, _hovered ? 8 : 2),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
