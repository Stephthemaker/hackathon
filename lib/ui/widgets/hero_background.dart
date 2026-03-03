import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../settings/app_settings.dart';
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
  Offset _mousePos = Offset.zero;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduce = AppSettingsProvider.of(context).reduceMotion;
    if (reduce && _ctrl.isAnimating) {
      _ctrl.stop();
    } else if (!reduce && !_ctrl.isAnimating) {
      _ctrl.repeat();
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) {
        if (mounted) setState(() => _mousePos = e.localPosition);
      },
      onExit: (e) {
        if (mounted) setState(() => _mousePos = Offset.zero);
      },
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, _) {
          return CustomPaint(
            size: Size(double.infinity, widget.height),
            painter: _SpectacularHeroPainter(
              t: _ctrl.value,
              mousePos: _mousePos,
            ),
          );
        },
      ),
    );
  }
}

class _Particle {
  final double x, y, size;
  final double vx, vy;
  _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.vx,
    required this.vy,
  });
}

class _SpectacularHeroPainter extends CustomPainter {
  final double t;
  final Offset mousePos;

  static List<_Particle>? _particles;

  _SpectacularHeroPainter({required this.t, required this.mousePos}) {
    if (_particles == null) {
      _particles = [];
      final random = math.Random(42);
      for (int i = 0; i < 80; i++) {
        _particles!.add(
          _Particle(
            x: random.nextDouble(),
            y: random.nextDouble(),
            size: random.nextDouble() * 2 + 1,
            vx: (random.nextDouble() - 0.5) * 0.001,
            vy: (random.nextDouble() - 0.5) * 0.001,
          ),
        );
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    void drawOrb(double cx, double cy, double radius, Color c) {
      final rect = Rect.fromCircle(center: Offset(cx, cy), radius: radius);
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [
            c.withValues(alpha: 0.15),
            c.withValues(alpha: 0.05),
            Colors.transparent,
          ],
          stops: const [0.0, 0.5, 1.0],
        ).createShader(rect);
      canvas.drawRect(rect, paint);
    }

    final double phase = t * 2 * math.pi;

    drawOrb(
      size.width * 0.2 + math.cos(phase) * 150,
      size.height * 0.3 + math.sin(phase * 0.8) * 100,
      size.width * 0.6,
      AppTheme.maroonLight,
    );
    drawOrb(
      size.width * 0.8 + math.sin(phase * 1.2) * 200,
      size.height * 0.1 + math.cos(phase * 0.7) * 150,
      size.width * 0.5,
      AppTheme.gold,
    );
    drawOrb(
      size.width * 0.5 + math.cos(phase * 0.5) * 200,
      size.height * 0.9 + math.sin(phase * 1.5) * 150,
      size.width * 0.7,
      Color(0xFF2B0A16),
    );

    final linePaint = Paint()
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()..style = PaintingStyle.fill;

    List<Offset> currentPositions = [];
    for (var p in _particles!) {
      double px = (p.x + p.vx * t * 1000) % 1.0;
      double py = (p.y + p.vy * t * 1000) % 1.0;
      if (px < 0) px += 1.0;
      if (py < 0) py += 1.0;

      px += math.sin(phase * 2 + py * 10) * 0.02;
      py += math.cos(phase * 2 + px * 10) * 0.02;

      double screenX = px * size.width;
      double screenY = py * size.height;

      if (mousePos != Offset.zero) {
        double dx = mousePos.dx - screenX;
        double dy = mousePos.dy - screenY;
        double dist = math.sqrt(dx * dx + dy * dy);
        if (dist < 250) {
          double force = (250 - dist) / 250;
          screenX -= dx * force * 0.1;
          screenY -= dy * force * 0.1;
        }
      }

      currentPositions.add(Offset(screenX, screenY));
    }

    for (int i = 0; i < currentPositions.length; i++) {
      for (int j = i + 1; j < currentPositions.length; j++) {
        double dx = currentPositions[i].dx - currentPositions[j].dx;
        double dy = currentPositions[i].dy - currentPositions[j].dy;
        double dist = math.sqrt(dx * dx + dy * dy);

        if (dist < 150) {
          double opacity = ((150 - dist) / 150) * 0.3;
          linePaint.color = AppTheme.goldLight.withValues(alpha: opacity);
          canvas.drawLine(currentPositions[i], currentPositions[j], linePaint);
        }
      }
    }

    for (int i = 0; i < currentPositions.length; i++) {
      dotPaint.color = AppTheme.goldLight.withValues(alpha: 0.5);
      canvas.drawCircle(currentPositions[i], _particles![i].size, dotPaint);

      dotPaint.color = AppTheme.gold.withValues(alpha: 0.2);
      canvas.drawCircle(currentPositions[i], _particles![i].size * 3, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _SpectacularHeroPainter oldDelegate) =>
      oldDelegate.t != t || oldDelegate.mousePos != mousePos;
}
