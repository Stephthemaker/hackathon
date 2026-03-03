import 'package:flutter/material.dart';

/// Provides a shared animation controller for all skeleton loaders
/// to avoid creating dozens of independent controllers.
class _SkeletonAnimationProvider extends StatefulWidget {
  final Widget child;
  const _SkeletonAnimationProvider({required this.child});

  @override
  State<_SkeletonAnimationProvider> createState() =>
      _SkeletonAnimationProviderState();
}

class _SkeletonAnimationProviderState extends State<_SkeletonAnimationProvider>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _SkeletonAnimationScope(
      controller: _controller,
      child: widget.child,
    );
  }
}

class _SkeletonAnimationScope extends InheritedWidget {
  final AnimationController controller;
  const _SkeletonAnimationScope({
    required this.controller,
    required super.child,
  });

  static AnimationController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_SkeletonAnimationScope>()
        ?.controller;
  }

  @override
  bool updateShouldNotify(_SkeletonAnimationScope oldWidget) =>
      controller != oldWidget.controller;
}

/// A shimmer-effect skeleton placeholder for loading states.
/// Uses a shared animation controller when nested inside SkeletonCard/SkeletonGrid,
/// or creates its own if used standalone.
class SkeletonLoader extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const SkeletonLoader({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  AnimationController? _ownController;

  AnimationController _getController() {
    final shared = _SkeletonAnimationScope.of(context);
    if (shared != null) return shared;
    // Fallback: create own controller if used standalone
    _ownController ??= AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
    return _ownController!;
  }

  @override
  void dispose() {
    _ownController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _getController();
    final dividerColor = Theme.of(context).dividerColor;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final t = controller.value;
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment(-1.0 + (2.0 * t), -0.3),
              end: Alignment(-0.2 + (2.0 * t), 0.3),
              colors: [
                dividerColor.withValues(alpha: 0.3),
                dividerColor.withValues(alpha: 0.6),
                dividerColor.withValues(alpha: 0.3),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// A skeleton placeholder shaped like a typical card.
/// Wraps children in a shared animation provider so all
/// SkeletonLoaders inside share one AnimationController.
class SkeletonCard extends StatelessWidget {
  final double height;
  const SkeletonCard({super.key, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return _SkeletonAnimationProvider(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SkeletonLoader(height: 16, width: 100, borderRadius: 4),
            const SizedBox(height: 12),
            const SkeletonLoader(height: 20, width: 200, borderRadius: 4),
            const SizedBox(height: 10),
            const SkeletonLoader(height: 14, borderRadius: 4),
            const SizedBox(height: 8),
            const SkeletonLoader(height: 14, width: 260, borderRadius: 4),
            const Spacer(),
            Row(
              children: const [
                SkeletonLoader(height: 24, width: 60, borderRadius: 12),
                SizedBox(width: 8),
                SkeletonLoader(height: 24, width: 80, borderRadius: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// A skeleton grid for lists of cards
class SkeletonGrid extends StatelessWidget {
  final int count;
  final int cols;
  final double cardHeight;

  const SkeletonGrid({
    super.key,
    this.count = 6,
    this.cols = 3,
    this.cardHeight = 200,
  });

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (int i = 0; i < count; i += cols) {
      final end = (i + cols < count) ? i + cols : count;
      final rowCount = end - i;
      final fill = cols - rowCount;
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...List.generate(
                  rowCount,
                  (j) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: j < rowCount - 1 ? 20 : 0,
                      ),
                      child: SkeletonCard(height: cardHeight),
                    ),
                  ),
                ),
                ...List.generate(
                  fill,
                  (_) => const Expanded(child: SizedBox()),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}
