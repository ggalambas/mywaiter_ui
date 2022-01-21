import 'package:flutter/material.dart';

class Price extends StatelessWidget {
  final String price;
  final TextStyle? style;

  const Price(this.price, {this.style});

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.bodyText2!;
    final style = this.style ?? defaultStyle;
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: Padding(
              padding: EdgeInsets.only(top: 2),
              child: Text(
                '€',
                style: style.copyWith(
                  fontSize: (style.fontSize ?? defaultStyle.fontSize!) * 2 / 3,
                ),
              ),
            ),
          ),
          TextSpan(text: price),
        ],
      ),
    );
  }
}
