import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedSection extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return child
        .animate(delay: delay)
        .fade(duration: duration, curve: Curves.easeOut)
        .slideY(
          begin: 0.05,
          end: 0,
          duration: duration,
          curve: Curves.easeOutQuart,
        );
  }
}
