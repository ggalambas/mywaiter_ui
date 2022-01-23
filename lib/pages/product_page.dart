import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/widgets/price.dart';
import 'package:mywaiter_design/widgets/sheet_scaffold.dart';

class ProductPage extends StatefulWidget {
  static String route = '/product';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final category = 'Drinks';
  final title = 'Whiskey The Balvenie 12 Years';
  final price = '6,90';
  final description =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo sodales dignissim. Etiam dapibus ut massa et pharetra. Praesent sit amet vehicula mauris, id congue nibh. Nullam consectetur pharetra velit, quis auctor magna interdum vitae. Proin enim lectus, eleifend ac neque a, dignissim blandit odio.';

  var quantity = 0;
  void changeQuantity(int increment) => setState(() => quantity += increment);

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const aspectRatio = 5 / 4;
    return SheetScaffold(
      backgroundHeight: screenWidth(context) / aspectRatio,
      background: AspectRatio(
        aspectRatio: aspectRatio,
        child: Image(
          image: Svg(
            'assets/logo.svg',
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            category,
            style: theme.textTheme.bodyText1!.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: theme.textTheme.headline4!.copyWith(height: 1),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Price(price, style: theme.textTheme.headline4),
              StatefulBuilder(builder: (context, setPrice) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    quantityButton(
                      context,
                      icon: LucideIcons.minus,
                      onTap: () => setPrice(() => changeQuantity(-1)),
                    ),
                    SizedBox.square(
                      dimension: 30,
                      child: Center(
                        child: Text(
                          '$quantity',
                          style: theme.textTheme.bodyText2,
                        ),
                      ),
                    ),
                    quantityButton(
                      context,
                      icon: LucideIcons.plus,
                      onTap: () => setPrice(() => changeQuantity(1)),
                    ),
                  ],
                );
              }),
            ],
          ),
          SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(color: theme.colorScheme.onSurface),
          )
        ],
      ),
    );
  }

  Widget quantityButton(
    BuildContext context, {
    required IconData icon,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(15);
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: theme.primaryColor),
          borderRadius: borderRadius,
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: kSmallIconSize,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
