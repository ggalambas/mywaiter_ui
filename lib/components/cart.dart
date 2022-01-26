import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/widgets/price.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {},
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(kBorderRadius),
        ),
        child: Container(
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Icon(LucideIcons.shoppingCart, size: kSmallIconSize),
              SizedBox(width: 16),
              Expanded(child: _ProductsList()),
              SizedBox(width: 16),
              Price('13,80', style: theme.textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductsList extends StatelessWidget {
  final products = {
    for (var e in List.generate(7, (i) => i)) e: Random().nextInt(4)
  };

  final String name = 'Fábrica Bolina';
  late final String? imageUrl = 'https://via.placeholder.com/'
      '150/FFD800/FFFFFF/?text=${name.substring(0, 2)}';

  final itemWidth = 36.0;
  final spacing = 4.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      final maxItems =
          (constraints.maxWidth - itemWidth) ~/ (itemWidth + spacing);
      return Row(
        children: [
          for (var i = 0; i < products.length && i < maxItems; i++) ...[
            Builder(builder: (context) {
              final quantity = products.values.toList()[i];
              return Badge(
                elevation: 0,
                animationType: BadgeAnimationType.scale,
                animationDuration: Duration(milliseconds: 200),
                showBadge: quantity > 1,
                badgeColor: theme.primaryColor,
                position: BadgePosition.topEnd(top: -3, end: -3),
                badgeContent: Text(
                  '$quantity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 10,
                  ),
                ),
                child: CircleAvatar(
                  radius: itemWidth / 2,
                  foregroundImage:
                      imageUrl != null ? NetworkImage(imageUrl!) : null,
                  backgroundImage: Svg(
                    'assets/logo.svg',
                    color: theme.colorScheme.onSurface,
                  ),
                  backgroundColor: theme.colorScheme.surface,
                ),
              );
            }),
            SizedBox(width: spacing),
          ],
          if (products.length > maxItems)
            CircleAvatar(
              radius: itemWidth / 2,
              child: Icon(
                LucideIcons.moreHorizontal,
                color: theme.colorScheme.onSurface,
              ),
              backgroundColor: theme.colorScheme.surface,
            )
        ],
      );
    });
  }
}
