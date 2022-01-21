import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mywaiter_design/pages/home_page.dart';

class OrdersTab extends StatelessWidget with HomeTab {
  @override
  final String label = 'Orders';
  @override
  final Widget icon = SvgPicture.asset(
    'assets/clipboard_list.svg',
    height: 24,
  );
  @override
  final Widget selectedIcon = SvgPicture.asset(
    'assets/clipboard_list_filled.svg',
    height: 24,
  );

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
  final String price = '€34,85';

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
                  Text(price),
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
