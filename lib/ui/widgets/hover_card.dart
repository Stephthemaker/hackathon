import 'package:flutter/material.dart';
import '../../settings/app_settings.dart';
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
    final reduceMotion = AppSettingsProvider.of(context).reduceMotion;
    Matrix4 transform = Matrix4.identity();
    double activeDepth = widget.depth;

    if (_hovered && !reduceMotion) {
      final RenderBox? box =
          _key.currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        final size = box.size;
        final center = Offset(size.width / 2, size.height / 2);

        // Adaptive lift dependent on widget dimensions and interaction.
        // Larger items float less to appear naturally heavier.
        double area = size.width * size.height;
        double areaScale = area > 0 ? (60000 / area).clamp(0.2, 1.0) : 1.0;
        double interactionScale = widget.onTap != null ? 1.0 : 0.2;
        activeDepth = widget.depth * areaScale * interactionScale;

        double dx = (_mousePos.dx - center.dx) / center.dx;
        double dy = (_mousePos.dy - center.dy) / center.dy;

        dx = dx.clamp(-1.0, 1.0);
        dy = dy.clamp(-1.0, 1.0);

        // Calculate mathematically consistent depth limit based on card dimensions
        double maxAngleX = 6.0 / (center.dy > 1 ? center.dy : 1);
        double maxAngleY = 6.0 / (center.dx > 1 ? center.dx : 1);

        // Bound cards from over-rotating or under-rotating
        maxAngleX = maxAngleX.clamp(0.005, 0.02);
        maxAngleY = maxAngleY.clamp(0.005, 0.02);

        transform
          ..setEntry(3, 2, 0.001) // perspective
          ..rotateX(-dy * maxAngleX * activeDepth) // pitch up/down
          ..rotateY(dx * maxAngleY * activeDepth); // yaw left/right

        transform = Matrix4.translationValues(0.0, -3.5 * activeDepth, 0.0)
          ..multiply(transform); // lift slightly
      }
    }

    return Semantics(
      button: widget.onTap != null,
      enabled: widget.onTap != null,
      child: MouseRegion(
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
                color: widget.color ?? Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: _hovered
                      ? AppTheme.maroon.withValues(alpha: 0.8)
                      : Theme.of(context).dividerColor,
                  width: _hovered ? 1.2 : 1.0,
                ),
                boxShadow: [
                  if (_hovered)
                    BoxShadow(
                      color: AppTheme.maroon.withValues(
                        alpha: 0.16 * activeDepth.clamp(0.2, 1.0),
                      ), // Deepened shadow for 3D effect scaled by depth
                      blurRadius: 20 * activeDepth,
                      spreadRadius: 5 * activeDepth,
                      offset: Offset(0, 8 * activeDepth),
                    ),
                ],
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
