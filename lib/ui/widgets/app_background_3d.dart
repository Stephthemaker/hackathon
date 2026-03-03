import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../layout/app_shell.dart';
import '../../theme/app_theme.dart';
import '../../settings/app_settings.dart';
import 'animated_3d_scroll_model.dart';

class Global3DBackground extends StatelessWidget {
  const Global3DBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // Skip all background animations when reduce motion is on
    if (AppSettingsProvider.of(context).reduceMotion) {
      return const SizedBox.expand();
    }

    final scrollCtrl = ScrollProvider.of(context);
    final offset = scrollCtrl.hasClients ? scrollCtrl.offset : 0.0;

    final width = MediaQuery.of(context).size.width;
    final currentPath = GoRouterState.of(context).uri.path;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Top right 3D cube moving slowly downwards
        // Hide on home page to avoid clashing with the hero section's 3D model
        if (currentPath != '/')
          Positioned(
            top: 100 - (offset * 0.4),
            right: width * 0.1,
            child: Opacity(
              opacity: 0.6,
              child: Interactive3DScrollModel(
                size: 250,
                variant: 1, // 1 = Stellenbosch location
              ),
            ),
          ),
        // Bottom right floating glass pane
        Positioned(
          top: 400 - (offset * 0.6),
          left: width * 0.8,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(0.7 - offset * 0.001)
              ..rotateZ(0.2 + offset * 0.002),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    AppTheme.goldLight.withValues(alpha: 0.4),
                    Colors.transparent,
                  ],
                ),
                border: Border.all(color: AppTheme.gold.withValues(alpha: 0.2)),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.gold.withValues(alpha: 0.1),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
