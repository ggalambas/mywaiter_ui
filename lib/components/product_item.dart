import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/pages/product_page.dart';
import 'package:mywaiter_design/pages/restaurant_page.dart';
import 'package:mywaiter_design/widgets/price.dart';

class ProductItem extends StatelessWidget {
  final View view;
  const ProductItem({required this.view});

  final productTitle = 'Whiskey The Balvenie 12 Years';
  final productPrice = '6,90';

  @override
  Widget build(BuildContext context) {
    switch (view) {
      case View.list:
        return buildTile(context);
      case View.grid:
        return buildCard(context);
    }
  }

  Widget buildCard(BuildContext context) {
    return Container(
      width: 156,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image(context, aspectRatio: 1),
          SizedBox(height: 10),
          Text(
            productTitle + '\n',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: price(context),
              ),
              addButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTile(BuildContext context) {
    return Container(
      height: 48,
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          image(context, aspectRatio: 5 / 4, borderRadius: 8),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productTitle,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                price(context),
              ],
            ),
          ),
          SizedBox(width: 4),
          addButton(context),
        ],
      ),
    );
  }

  Widget image(
    BuildContext context, {
    required double aspectRatio,
    double borderRadius = kBorderRadius,
  }) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Material(
        color: theme.colorScheme.surface,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, ProductPage.route),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Ink.image(
              image: Svg(
                'assets/logo.svg',
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget price(BuildContext context) {
    final theme = Theme.of(context);
    return Price(
      productPrice,
      style: theme.textTheme.bodyText1!
          .copyWith(color: theme.colorScheme.onSurface),
    );
  }

  Widget addButton(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(15);
    return InkWell(
      onTap: () {},
      borderRadius: borderRadius,
      child: Container(
        width: 45,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: theme.primaryColor),
          borderRadius: borderRadius,
        ),
        alignment: Alignment.center,
        child: Icon(
          LucideIcons.plus,
          size: kSmallIconSize,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
