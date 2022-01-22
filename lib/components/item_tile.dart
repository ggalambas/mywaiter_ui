import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:mywaiter_design/config/constants.dart';

class ItemTile extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final VoidCallback? onTap;
  final Widget? subtitle;
  final Widget? trailing;

  const ItemTile({
    this.imageUrl,
    required this.title,
    this.onTap,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kScreenPadding, vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              foregroundImage:
                  imageUrl != null ? NetworkImage(imageUrl!) : null,
              backgroundImage: Svg(
                'assets/logo.svg',
                color: theme.colorScheme.onSurface,
              ),
              backgroundColor: theme.colorScheme.surface,
            ),
            SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.bodyText1),
                if (subtitle != null) ...[
                  SizedBox(height: 4),
                  subtitle!,
                ],
              ],
            ),
            Spacer(),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
