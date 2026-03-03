import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import '../layout/app_shell.dart';
import '../../theme/app_theme.dart';

class Interactive3DScrollModel extends StatefulWidget {
  final double size;
  final int
  variant; // 0 = layered squares, 1 = stellenbosch location, 2 = terrain
  const Interactive3DScrollModel({
    super.key,
    this.size = 200,
    this.variant = 0,
  });

  @override
  State<Interactive3DScrollModel> createState() =>
      _Interactive3DScrollModelState();
}

class _Interactive3DScrollModelState extends State<Interactive3DScrollModel>
    with SingleTickerProviderStateMixin {
  late AnimationController _animCtrl;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Rebuilds smoothly whenever scroll offset changes!
    final scrollCtrl = ScrollProvider.of(context);
    final offset = scrollCtrl.hasClients ? scrollCtrl.offset : 0.0;

    return AnimatedBuilder(
      animation: _animCtrl,
      builder: (context, _) {
        final timePlay =
            _animCtrl.value * math.pi * 2; // Continuous time 0 -> 2pi

        if (widget.variant == 1) {
          // Removed '|| variant == 2' to fix the duplicate Stellenbosch badges
          return _buildStellenboschLocation(
            offset + (timePlay * 100),
          ); // Blend offset and time slightly
        }

        // Use a complex rotation formula for multiple axes
        // Added seamless breathing animation to the layers
        final rotX = offset * 0.003 + math.sin(timePlay) * 0.05;
        final rotY = offset * 0.004 + math.cos(timePlay) * 0.05;
        final rotZ = offset * 0.001 + math.sin(timePlay * 0.5) * 0.02;
        final breath = math.sin(timePlay * 2) * 15; // Continuous breathing

        return SizedBox(
          width: widget.size * 1.5, // expanded size for rings
          height: widget.size * 1.5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outer orbit ring 1
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(rotX * 2.0)
                  ..rotateY(rotY * 1.5)
                  ..rotateZ(timePlay * 1.2),
                child: Container(
                  width: widget.size * 1.2,
                  height: widget.size * 1.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.gold.withValues(alpha: 0.1),
                      width: 1,
                    ),
                  ),
                ),
              ),
              // Outer orbit ring 2
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(rotY * 2.5)
                  ..rotateY(rotX * 1.8)
                  ..rotateZ(-timePlay * 0.8),
                child: Container(
                  width: widget.size * 1.35,
                  height: widget.size * 1.35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.maroonLight.withValues(alpha: 0.15),
                      width: 1,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppTheme.goldLight,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: AppTheme.goldLight, blurRadius: 6),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Inner glowing core background (Subtle)
              Container(
                width: widget.size * 0.8,
                height: widget.size * 0.8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.gold.withValues(alpha: 0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              // The main layered cube
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002) // subtle perspective
                  ..rotateX(0.5 + rotX)
                  ..rotateY(-0.5 + rotY)
                  ..rotateZ(0.2 + rotZ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Creating a layered 3D tech / glassmorphism cube effect tailored to Stellenbosch CS
                    // Base layer: Network / Core
                    _buildLayer(
                      0 - breath * 0.5,
                      color: AppTheme.maroonDark.withValues(alpha: 0.25),
                      borderColor: AppTheme.maroon.withValues(alpha: 0.5),
                      glowColor: AppTheme.maroon.withValues(alpha: 0.3),
                      icon: Icons.hub, // Network topology
                    ),
                    // Middle layer 1: Data / Algorithms
                    _buildLayer(
                      40 - breath * 0.25,
                      color: AppTheme.gold.withValues(alpha: 0.2),
                      borderColor: AppTheme.gold.withValues(alpha: 0.4),
                      glowColor: AppTheme.gold.withValues(alpha: 0.2),
                      icon: Icons.data_object,
                    ),
                    // Middle layer 2: AI / ML
                    _buildLayer(
                      80 + breath * 0.25,
                      color: AppTheme.maroonLight.withValues(alpha: 0.3),
                      borderColor: AppTheme.maroonLight.withValues(alpha: 0.6),
                      glowColor: AppTheme.maroonLight.withValues(alpha: 0.3),
                      icon: Icons.psychology, // AI
                    ),
                    // Top layer: Software Engineering / Terminal
                    _buildLayer(
                      120 + breath * 0.5,
                      color: AppTheme.maroon.withValues(alpha: 0.85),
                      borderColor: AppTheme.goldLight.withValues(alpha: 0.8),
                      glowColor: AppTheme.gold.withValues(alpha: 0.5),
                      icon: Icons.terminal,
                      iconColor: AppTheme.goldLight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLayer(
    double translateZ, {
    required Color color,
    Color? borderColor,
    Color? glowColor,
    Color? iconColor,
    IconData? icon,
  }) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..setTranslationRaw(0.0, 0.0, translateZ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: borderColor ?? Colors.white.withValues(alpha: 0.4),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: glowColor ?? color.withValues(alpha: 0.2),
              blurRadius: 25,
              spreadRadius: 5,
            ),
          ],
        ),
        child: SizedBox(
          width: widget.size * 0.8,
          height: widget.size * 0.8,
          child: icon != null
              ? Center(
                  child: Icon(
                    icon,
                    size: widget.size * 0.35,
                    color: iconColor ?? Colors.white.withValues(alpha: 0.9),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  Widget _buildStellenboschLocation(double offset) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Golden Glow
          Transform.scale(
            scale: 1.0 + math.sin(offset * 0.005) * 0.1,
            child: Container(
              width: widget.size * 1.5,
              height: widget.size * 1.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.goldLight.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                  stops: const [0.2, 0.8],
                ),
              ),
            ),
          ),
          // Parallax Mountains (Terrain Analysis Theme)
          ...List.generate(3, (index) {
            final depth = (index + 1) * 0.001;
            final parallaxY = math.cos(offset * depth) * 20.0;
            final parallaxX = math.sin(offset * depth) * 15.0;
            return Transform.translate(
              offset: Offset(parallaxX, 20.0 + (index * 15.0) + parallaxY),
              child: Opacity(
                opacity: 0.4 - (index * 0.1),
                child: Icon(
                  Icons.landscape,
                  size: widget.size * (0.8 - (index * 0.1)),
                  color: AppTheme.maroon,
                ),
              ),
            );
          }),
          // Meaningful Computer Science Orbital Rings with unique tech icons
          ...List.generate(3, (index) {
            // Distinct speeds so they don't overlap redundantly
            final speed = 0.0015 + (index * 0.0008);
            // 3 specific meaningful pillars: Code, Hardware/Memory, Cloud/Data
            final icons = [Icons.code, Icons.memory, Icons.cloud_sync];
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX((offset * speed) + (index * 0.8))
                ..rotateY((offset * speed * 1.2))
                ..rotateZ((offset * speed * 0.4)),
              child: Container(
                width: widget.size * (0.6 + (index * 0.12)), // Tighter grouping
                height: widget.size * (0.6 + (index * 0.12)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: index == 1
                        ? AppTheme.gold.withValues(alpha: 0.5)
                        : AppTheme.maroonLight.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.goldLight, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.goldLight.withValues(alpha: 0.4),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Icon(icons[index], size: 16, color: AppTheme.maroon),
                  ),
                ),
              ),
            );
          }),
          // Floating Location Pin / Badge - Computer Science themed
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.003)
              ..rotateY(offset * 0.002)
              ..rotateX(-0.1 + math.sin(offset * 0.003) * 0.1),
            child: Container(
              width: widget.size * 0.35,
              height: widget.size * 0.35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Tech light mode aesthetic
                border: Border.all(color: AppTheme.gold, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.gold.withValues(alpha: 0.4),
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  ),
                  BoxShadow(
                    color: AppTheme.maroon.withValues(alpha: 0.3),
                    spreadRadius: 8,
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Inner tech grid / radar lines
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.maroon.withValues(alpha: 0.1),
                        width: 1,
                      ),
                    ),
                  ),
                  // Render the SU logo
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: SvgPicture.asset(
                        'web/assets/general/logo.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
