import 'package:flutter/material.dart';
import 'package:mywaiter_design/components/item_tile.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/theme/palette.dart';
import 'package:mywaiter_design/config/theme/theme_config.dart';
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

  //TODO:
  //* profile
  //* orders

  @override
  PreferredSizeWidget get appBar => AppBar(
        systemOverlayStyle: ThemeConfig.systemOverlayStyle,
        automaticallyImplyLeading: false,
        title: Text('Your Orders'),
        actions: [
          //! profile
        ],
      );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 8),
      itemCount: 15,
      itemBuilder: (context, i) => OrderTile(),
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
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('14/01', style: theme.textTheme.caption),
          SizedBox(height: 4),
          Text('16h20', style: theme.textTheme.caption),
        ],
      ),
    );
  }
}
