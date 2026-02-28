import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../layout/app_shell.dart';
import '../../theme/app_theme.dart';

class Interactive3DScrollModel extends StatelessWidget {
  final double size;
  final int variant; // 0 = layered squares, 1 = rings, 2 = globe
  const Interactive3DScrollModel({
    super.key,
    this.size = 200,
    this.variant = 0,
  });

  @override
  Widget build(BuildContext context) {
    // Rebuilds smoothly whenever scroll offset changes!
    final scrollCtrl = ScrollProvider.of(context);
    final offset = scrollCtrl.hasClients ? scrollCtrl.offset : 0.0;

    if (variant == 1) {
      return _buildRingsVariant(offset);
    } else if (variant == 2) {
      return _buildGlobeVariant(offset);
    }

    // Use a complex rotation formula for multiple axes
    final rotX = offset * 0.003;
    final rotY = offset * 0.004;
    final rotZ = offset * 0.001;

    // We can also have an entrance animation using time. Since we only have scroll,
    // let's blend scroll rotation with a baseline 3D perspective.

    return SizedBox(
      width: size,
      height: size,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002) // subtle perspective
          ..rotateX(0.5 + rotX)
          ..rotateY(-0.5 + rotY)
          ..rotateZ(0.2 + rotZ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Creating a layered 3D tech / glassmorphism cube effect
            _buildLayer(0, color: AppTheme.maroon.withValues(alpha: 0.2)),
            _buildLayer(
              40,
              color: AppTheme.gold.withValues(alpha: 0.4),
              icon: Icons.data_object,
            ),
            _buildLayer(
              80,
              color: Colors.blueAccent.withValues(alpha: 0.4),
              icon: Icons.memory,
            ),
            _buildLayer(
              120,
              color: Colors.indigo.withValues(alpha: 0.8),
              icon: Icons.terminal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayer(
    double translateZ, {
    required Color color,
    IconData? icon,
  }) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..setTranslationRaw(0.0, 0.0, translateZ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.4),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.2),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: SizedBox(
          width: size * 0.8,
          height: size * 0.8,
          child: icon != null
              ? Center(
                  child: Icon(icon, size: size * 0.35, color: Colors.white),
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  Widget _buildRingsVariant(double offset) {
    // Elegant, intersecting rotating rings (like an atom or orbital path)
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(4, (index) {
          final speed = 0.002 + (index * 0.001);
          final delay = index * 0.8;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX((offset * speed) + delay)
              ..rotateY((offset * (speed * 1.2)) - delay)
              ..rotateZ((offset * speed * 0.5)),
            child: Container(
              width: size * (0.4 + (index * 0.2)),
              height: size * (0.4 + (index * 0.2)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: index.isEven
                      ? AppTheme.gold.withValues(alpha: 0.5)
                      : AppTheme.maroonLight.withValues(alpha: 0.4),
                  width: 2 + (index * 0.5),
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 10),
                ],
              ),
              child: index == 0
                  ? Center(
                      child: Icon(
                        Icons.hub,
                        color: AppTheme.goldLight,
                        size: size * 0.2,
                      ),
                    )
                  : null,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildGlobeVariant(double offset) {
    // Network mesh / Wireframe sphere simulation
    return SizedBox(
      width: size,
      height: size,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.003)
          ..rotateY(offset * 0.005)
          ..rotateX(offset * 0.002),
        child: Stack(
          alignment: Alignment.center,
          children:
              List.generate(8, (index) {
                final double rotation = (math.pi / 8) * index;
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(rotation),
                  child: Container(
                    width: size * 0.8,
                    height: size * 0.8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.15),
                        width: 1,
                      ),
                    ),
                  ),
                );
              })..addAll(
                // Horizontal latitudinal rings
                List.generate(5, (index) {
                  final double scale = math.sin((math.pi / 5) * (index + 0.5));
                  final double translate =
                      -size * 0.4 + (size * 0.8 / 5) * (index + 0.5);
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setTranslationRaw(0.0, translate, 0.0)
                      ..rotateX(math.pi / 2),
                    child: Container(
                      width: size * 0.8 * scale,
                      height: size * 0.8 * scale,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1),
                          width: 1,
                        ),
                      ),
                    ),
                  );
                }),
              ),
        ),
      ),
    );
  }
}
