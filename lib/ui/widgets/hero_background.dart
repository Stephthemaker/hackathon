import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AnimatedHeroBackground extends StatefulWidget {
  final double height;
  const AnimatedHeroBackground({super.key, required this.height});

  @override
  State<AnimatedHeroBackground> createState() => _AnimatedHeroBackgroundState();
}

class _AnimatedHeroBackgroundState extends State<AnimatedHeroBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, _) {
        return CustomPaint(
          size: Size(double.infinity, widget.height),
          painter: _SpectacularHeroPainter(_ctrl.value),
        );
      },
    );
  }
}

class _SpectacularHeroPainter extends CustomPainter {
  final double t;
  _SpectacularHeroPainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    // Making it transparent to allow Global3DBackground to show through
    // Removed solid darkBg background draw here.

    void drawOrb(double cx, double cy, double radius, Color c) {
      final rect = Rect.fromCircle(center: Offset(cx, cy), radius: radius);
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            c.withValues(alpha: 0.5),
            c.withValues(alpha: 0.1),
            Colors.transparent,
          ],
          stops: const [0.0, 0.4, 1.0],
        ).createShader(rect);
      canvas.drawRect(rect, paint);
    }

    final double phase = t * 2 * math.pi;

    drawOrb(
      size.width * 0.1 + math.cos(phase) * 100,
      size.height * 0.4 + math.sin(phase) * 80,
      size.width * 0.5,
      const Color(0xFF9E1A43),
    ); // AppTheme.maroon

    drawOrb(
      size.width * 0.85 + math.sin(phase * 1.5) * 120,
      size.height * 0.1 + math.cos(phase * 0.8) * 100,
      size.width * 0.4,
      AppTheme.gold,
    );

    drawOrb(
      size.width * 0.7 + math.cos(phase * 0.5) * 150,
      size.height * 0.9 + math.sin(phase * 1.2) * 60,
      size.width * 0.6,
      AppTheme.maroon,
    );

    final dotPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..strokeWidth = 1.0;

    final random = math.Random(42);
    final List<Offset> nodes = [];
    for (int i = 0; i < 60; i++) {
      final nx = random.nextDouble() * size.width;
      final ny = random.nextDouble() * size.height;
      final floatX = math.sin(phase + i) * 20;
      final floatY = math.cos(phase + i * 0.5) * 20;
      nodes.add(Offset(nx + floatX, ny + floatY));
    }

    for (int i = 0; i < nodes.length; i++) {
      canvas.drawCircle(nodes[i], random.nextDouble() * 2 + 1, dotPaint);
      for (int j = i + 1; j < nodes.length; j++) {
        final dist = (nodes[i] - nodes[j]).distance;
        if (dist < 180) {
          final alpha = (1.0 - (dist / 180)).clamp(0.0, 1.0) * 0.15;
          linePaint.color = Colors.white.withValues(alpha: alpha);
          canvas.drawLine(nodes[i], nodes[j], linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _SpectacularHeroPainter old) => old.t != t;
}
