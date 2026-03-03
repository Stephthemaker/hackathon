import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';

class BreadcrumbItem {
  final String label;
  final String? route;
  const BreadcrumbItem({required this.label, this.route});
}

/// A simple breadcrumb trail for nested pages.
class Breadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;
  const Breadcrumb({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (int i = 0; i < items.length; i++) ...[
          if (i > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.chevron_right,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          if (items[i].route != null)
            Semantics(
              link: true,
              label: items[i].label,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => context.go(items[i].route!),
                  child: Text(
                    items[i].label,
                    style: GoogleFonts.openSans(
                      fontSize: 13,
                      color: AppTheme.maroon,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: AppTheme.maroon.withValues(alpha: 0.4),
                    ),
                  ),
                ),
              ),
            )
          else
            Text(
              items[i].label,
              style: GoogleFonts.openSans(
                fontSize: 13,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ],
    );
  }
}
