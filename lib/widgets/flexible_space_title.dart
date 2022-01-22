import 'package:flutter/material.dart';

class FlexibleSpaceTitle extends StatelessWidget {
  final String text;
  final EdgeInsets padding;

  const FlexibleSpaceTitle(
    this.text, {
    this.padding = const EdgeInsets.only(left: 16, bottom: 8),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, _) {
        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
        final maxExtent = settings.maxExtent - settings.minExtent;
        final currentExtent = settings.currentExtent - settings.minExtent;
        final scrollRate = (1.0 - currentExtent / maxExtent).clamp(0.0, 1.0);
        // 0.0 -> Expanded
        // 1.0 -> Collapsed

        return FlexibleSpaceBar(
          title: Text(
            text,
            style: TextStyle(
              fontWeight: scrollRate == 1 ? null : FontWeight.w600,
            ),
          ),
          titlePadding: EdgeInsets.only(
            left: padding.left + (72 - padding.left) * scrollRate,
            bottom: padding.bottom + (16 - padding.bottom) * scrollRate,
          ),
        );
      },
    );
  }
}
