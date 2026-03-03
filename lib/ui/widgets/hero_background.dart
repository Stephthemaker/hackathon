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
    return RepaintBoundary(
      child: MouseRegion(
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
      ),
    );
  }
}

class _Particle {
  final double x, y, size;
  final double vx, vy;
  const _Particle({
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

  // Reduced from 80 to 45 particles — still looks great, much less CPU
  static const int _particleCount = 45;
  // Use squared distances to avoid sqrt in the inner loop
  static const double _connectionDist = 130.0;
  static const double _connectionDistSq = _connectionDist * _connectionDist;
  static const double _mouseDist = 250.0;
  static const double _mouseDistSq = _mouseDist * _mouseDist;

  static List<_Particle>? _particles;

  // Pre-allocated reusable Paint objects (avoid per-frame allocation)
  static final Paint _linePaint = Paint()
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke;
  static final Paint _dotPaint = Paint()..style = PaintingStyle.fill;

  _SpectacularHeroPainter({required this.t, required this.mousePos}) {
    if (_particles == null) {
      _particles = [];
      final random = math.Random(42);
      for (int i = 0; i < _particleCount; i++) {
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
    final double phase = t * 2 * math.pi;

    // Draw background orbs
    _drawOrbs(canvas, size, phase);

    // Compute particle positions into flat arrays (avoids Offset allocations)
    final int count = _particles!.length;
    final List<double> xs = List.filled(count, 0.0);
    final List<double> ys = List.filled(count, 0.0);
    final bool hasMouse = mousePos != Offset.zero;

    for (int i = 0; i < count; i++) {
      final p = _particles![i];
      double px = (p.x + p.vx * t * 1000) % 1.0;
      double py = (p.y + p.vy * t * 1000) % 1.0;
      if (px < 0) px += 1.0;
      if (py < 0) py += 1.0;

      px += math.sin(phase * 2 + py * 10) * 0.02;
      py += math.cos(phase * 2 + px * 10) * 0.02;

      double screenX = px * size.width;
      double screenY = py * size.height;

      if (hasMouse) {
        final dx = mousePos.dx - screenX;
        final dy = mousePos.dy - screenY;
        final distSq = dx * dx + dy * dy;
        if (distSq < _mouseDistSq) {
          final dist = math.sqrt(distSq);
          final force = (_mouseDist - dist) / _mouseDist;
          screenX -= dx * force * 0.1;
          screenY -= dy * force * 0.1;
        }
      }

      xs[i] = screenX;
      ys[i] = screenY;
    }

    // Draw connections — early squared-distance reject avoids most sqrt calls
    for (int i = 0; i < count; i++) {
      for (int j = i + 1; j < count; j++) {
        final dx = xs[i] - xs[j];
        final dy = ys[i] - ys[j];
        final distSq = dx * dx + dy * dy;

        if (distSq < _connectionDistSq) {
          final dist = math.sqrt(distSq);
          final opacity = ((_connectionDist - dist) / _connectionDist) * 0.3;
          _linePaint.color = AppTheme.goldLight.withValues(alpha: opacity);
          canvas.drawLine(
            Offset(xs[i], ys[i]),
            Offset(xs[j], ys[j]),
            _linePaint,
          );
        }
      }
    }

    // Draw particle dots
    for (int i = 0; i < count; i++) {
      final pos = Offset(xs[i], ys[i]);
      _dotPaint.color = AppTheme.goldLight.withValues(alpha: 0.5);
      canvas.drawCircle(pos, _particles![i].size, _dotPaint);

      _dotPaint.color = AppTheme.gold.withValues(alpha: 0.2);
      canvas.drawCircle(pos, _particles![i].size * 3, _dotPaint);
    }
  }

  void _drawOrbs(Canvas canvas, Size size, double phase) {
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
      const Color(0xFF2B0A16),
    );
  }

  @override
  bool shouldRepaint(covariant _SpectacularHeroPainter oldDelegate) =>
      oldDelegate.t != t || oldDelegate.mousePos != mousePos;
}
