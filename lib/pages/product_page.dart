import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:mywaiter_design/components/quantity_buttons.dart';
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

  var quantity = 1;

  double get screenHeight =>
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const aspectRatio = 5 / 4;
    return SheetScaffold(
      minHeight: screenHeight - screenWidth / aspectRatio,
      background: AspectRatio(
        aspectRatio: aspectRatio,
        child: Image(
          image: Svg(
            'assets/logo.svg',
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () {},
        child: Text('Add to cart'),
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
              QuantityButtons(
                quantity: quantity,
                onChanged: (qty) => setState(() => quantity = qty),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(color: theme.colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
