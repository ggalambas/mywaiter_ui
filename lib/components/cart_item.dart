import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/components/quantity_buttons.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/widgets/price.dart';

class CartItem extends StatefulWidget {
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final category = 'Drinks';
  final title = 'Whiskey The Balvenie 12 Years';
  final price = '6,90';

  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: kScreenPadding),
      child: Row(
        children: [
          image(context),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  category,
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Price(price, style: theme.textTheme.bodyText1),
                    ),
                    QuantityButtons(
                      quantity: quantity,
                      onChanged: (qty) => setState(() => quantity = qty),
                      onRemoved: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget image(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: theme.colorScheme.surface,
        child: AspectRatio(
          aspectRatio: 5 / 4,
          child: Image(
            image: Svg(
              'assets/logo.svg',
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
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
