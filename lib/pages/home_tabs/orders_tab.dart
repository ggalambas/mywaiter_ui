import 'package:flutter/material.dart';
import 'package:mywaiter_design/pages/home_page.dart';
import 'package:mywaiter_design/widgets/svg_icon.dart';

class OrdersTab extends StatelessWidget with HomeTab {
  @override
  final String label = 'Orders';
  @override
  final Widget icon = SvgIcon('assets/clipboard_list.svg');
  @override
  final Widget activeIcon = SvgIcon('assets/clipboard_list_filled.svg');

  //* to do:
  //* profile button and page

  @override
  PreferredSizeWidget get appBar => AppBar(
        automaticallyImplyLeading: false,
        title: Text('Your Orders'),
        actions: [
          //! profile
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < 5; i++) ...[OrderTile(), SizedBox(height: 16)]
      ],
    );
  }
}

class OrderTile extends StatelessWidget {
  final double height = 48;
  final String name = 'Fábrica Bolina';
  final String price = '34,85';

  // final String name = 'Bo';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: height,
      child: Row(
        children: [
          CircleAvatar(
            // the restaurant image
            foregroundImage: NetworkImage(
              'https://via.placeholder.com/'
              '150/FFD800/FFFFFF/?text=${name.substring(0, 2)}',
            ),
            // a default image of the assets instead of color
            // backgroundImage: ,
            backgroundColor: theme.colorScheme.surface,
            radius: height / 2,
          ),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Row(
                children: [
                  Price(
                    price,
                    style: theme.textTheme.headline6,
                  ),
                  SizedBox(width: 8),
                  Text('Pending'),
                ],
              )
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('17/10'),
              Text('15/34'),
            ],
          )
        ],
      ),
    );
  }
}

class Price extends StatelessWidget {
  final String price;
  final TextStyle? style;

  const Price(this.price, {this.style});

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.bodyText2!;
    final style =
        this.style == null ? defaultStyle : defaultStyle.merge(this.style);
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
                style: TextStyle(fontSize: style.fontSize! * 2 / 3),
              ),
            ),
          ),
          TextSpan(text: price),
        ],
      ),
    );
  }
}
