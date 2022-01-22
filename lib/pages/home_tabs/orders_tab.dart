import 'package:flutter/material.dart';
import 'package:mywaiter_design/components/item_tile.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/theme/palette.dart';
import 'package:mywaiter_design/pages/home_page.dart';
import 'package:mywaiter_design/widgets/price.dart';
import 'package:mywaiter_design/widgets/svg_icon.dart';

class OrdersTab extends StatelessWidget with HomeTab {
  @override
  final String label = 'Orders';
  @override
  final Widget icon = SvgIcon('assets/clipboard_list.svg');
  @override
  final Widget activeIcon = SvgIcon('assets/clipboard_list_filled.svg');

<<<<<<< HEAD
  //TODO:
  //* profile
  //* orders
=======
  //* to do:
  //* profile button and page
>>>>>>> 4bb010efd485dffb2b244a73febb18b11a11d7d3

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
    return ListView(
      padding: EdgeInsets.only(top: 8),
      children: [for (var i = 0; i < 15; i++) OrderTile()],
    );
  }
}

class OrderTile extends StatelessWidget {
  final String name = 'Fábrica Bolina';
  final String price = '34,85';
  final bool pending = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ItemTile(
      imageUrl: 'https://via.placeholder.com/'
          '150/FFD800/FFFFFF/?text=${name.substring(0, 2)}',
      title: name,
      onTap: () {},
      subtitle: Row(
        children: [
          Price(price, style: TextStyle(color: theme.colorScheme.onSurface)),
          SizedBox(width: 8),
          if (pending)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: Palette.red,
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              child: Text(
                'Pending',
                style: theme.textTheme.caption!.copyWith(color: Colors.white),
              ),
            ),
        ],
      ),
      trailing: Text.rich(
        TextSpan(
          text: '14/01\n',
          style: theme.textTheme.caption,
          children: [TextSpan(text: '16h20')],
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
