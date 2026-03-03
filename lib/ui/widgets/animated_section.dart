import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../settings/app_settings.dart';

class AnimatedSection extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;

  const AnimatedSection({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool _isVisible = false;
  bool _hasTriggered = false;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = AppSettingsProvider.of(context).reduceMotion;

    // If reduce motion is on, skip animations entirely
    if (reduceMotion) return widget.child;

    return VisibilityDetector(
      key: widget.key ?? Key(widget.hashCode.toString()),
      onVisibilityChanged: (info) {
        if (!_hasTriggered && info.visibleFraction > 0.1) {
          setState(() {
            _isVisible = true;
            _hasTriggered = true;
          });
        }
      },
      child: _isVisible
          ? widget.child
                .animate(delay: widget.delay)
                .fade(duration: widget.duration, curve: Curves.easeOut)
                .slideY(
                  begin: 0.1,
                  end: 0,
                  duration: widget.duration,
                  curve: Curves.easeOutQuart,
                )
                // 3D fold-up effect
                .flipH(
                  begin: -0.1,
                  end: 0,
                  perspective: 1.5,
                  duration: widget.duration,
                  curve: Curves.easeOutQuart,
                )
          : Visibility(
              visible: false,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: widget.child,
            ),
    );
  }
}
