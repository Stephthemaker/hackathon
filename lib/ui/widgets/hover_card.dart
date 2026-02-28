import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

/// A card that lifts slightly and gains a shadow on hover.
class HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double depth;

  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius = 12,
    this.color,
    this.padding,
    this.depth = 1.0,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovered = false;
  Offset _mousePos = Offset.zero;
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Matrix4 transform = Matrix4.identity();
    if (_hovered) {
      final RenderBox? box =
          _key.currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        final size = box.size;
        final center = Offset(size.width / 2, size.height / 2);

        double dx = (_mousePos.dx - center.dx) / center.dx;
        double dy = (_mousePos.dy - center.dy) / center.dy;

        dx = dx.clamp(-1.0, 1.0);
        dy = dy.clamp(-1.0, 1.0);

        // Calculate mathematically consistent depth limit based on card dimensions
        double maxAngleX = 6.0 / (center.dy > 1 ? center.dy : 1);
        double maxAngleY = 6.0 / (center.dx > 1 ? center.dx : 1);

        // Bound cards from over-rotating or under-rotating
        maxAngleX = maxAngleX.clamp(0.01, 0.045);
        maxAngleY = maxAngleY.clamp(0.01, 0.045);

        transform
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(-dy * maxAngleX * widget.depth) // pitch up/down
          ..rotateY(dx * maxAngleY * widget.depth); // yaw left/right

        transform = Matrix4.translationValues(0.0, -4.0 * widget.depth, 0.0)
          ..multiply(transform); // lift slightly
      }
    }

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _mousePos = Offset.zero;
      }),
      onHover: (e) {
        setState(() {
          _hovered = true; // Ensure hovered is true while tracking
          _mousePos = e.localPosition;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: TweenAnimationBuilder<Matrix4>(
          tween: Matrix4Tween(begin: Matrix4.identity(), end: transform),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          builder: (context, mat, child) {
            return Transform(
              alignment: FractionalOffset.center,
              transform: mat,
              child: child,
            );
          },
          child: AnimatedContainer(
            key: _key,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            padding: widget.padding,
            decoration: BoxDecoration(
              color: widget.color ?? Colors.white,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: _hovered
                    ? AppTheme.maroon.withValues(alpha: 0.5)
                    : AppTheme.divider,
              ),
              boxShadow: [
                if (_hovered)
                  BoxShadow(
                    color: AppTheme.maroon.withValues(
                      alpha: 0.15,
                    ), // Deepened shadow for 3D effect
                    blurRadius: 24,
                    spreadRadius: 8,
                    offset: const Offset(0, 12),
                  ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
