import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/components/product_item.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/theme/palette.dart';
import 'package:mywaiter_design/config/theme/theme_config.dart';
import 'package:mywaiter_design/pages/info_page.dart';
import 'package:mywaiter_design/widgets/flexible_space_title.dart';
import 'package:mywaiter_design/widgets/persistent_tab_bar.dart';
import 'package:mywaiter_design/widgets/price.dart';

enum View { grid, list }

extension ViewX on View {
  IconData get swapIcon {
    switch (this) {
      case View.grid:
        return LucideIcons.layoutList;
      case View.list:
        return LucideIcons.layoutGrid;
    }
  }

  View swap() {
    switch (this) {
      case View.grid:
        return View.list;
      case View.list:
        return View.grid;
    }
  }
}

class RestaurantPage extends StatefulWidget {
  static String route = '/restaurant';

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

//TODO:
//* orders
//* search
//* cart: prodcts badge
//* cart sheet
//* checkout

class _RestaurantPageState extends State<RestaurantPage> {
  var view = View.grid;

  final opened = true;
  final categories = [
    'All',
    'Food',
    'Beer',
    'Drinks',
    'Dessert',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: DefaultTabController(
        length: categories.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverAppBar(
                systemOverlayStyle: ThemeConfig.systemOverlayStyle,
                pinned: true,
                expandedHeight: kToolbarHeight + 12 + 20 * 1.5 * 1.2 + 8,
                flexibleSpace: FlexibleSpaceTitle('Bolina'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(LucideIcons.search),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(LucideIcons.clipboardList),
                  ),
                  IconButton(
                    onPressed: () => setState(() => view = view.swap()),
                    icon: Icon(view.swapIcon),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, InfoPage.route),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kScreenPadding,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('R. Vale Formoso 9'),
                            Text.rich(
                              TextSpan(
                                children: [
                                  opened
                                      ? TextSpan(
                                          text: 'Opened',
                                          style:
                                              TextStyle(color: Palette.green),
                                        )
                                      : TextSpan(
                                          text: 'Closed',
                                          style: TextStyle(color: Palette.red),
                                        ),
                                  TextSpan(text: ' ∙ Closes at 23pm'),
                                ],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Tap for more information',
                              style:
                                  TextStyle(color: theme.colorScheme.onSurface),
                            ),
                          ],
                        ),
                        Icon(LucideIcons.chevronRight, size: kSmallIconSize),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: PersistentTabBar(categories: categories),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ...categories.map(
                (_) => SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: view == View.grid ? 8 : 0,
                  ),
                  child: Wrap(
                    children: [
                      for (var i = 0; i < 15; i++) ProductItem(view: view)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: GestureDetector(
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
                Expanded(child: CartList()),
                SizedBox(width: 16),
                Price('13,80', style: theme.textTheme.bodyText1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  // final List<Product> products;
  // const CartList({this.products});

  final products = {
    for (var e in List.generate(7, (i) => i)) e: Random(0).nextInt(2)
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
              return CircleAvatar(
                radius: itemWidth / 2,
                foregroundImage:
                    imageUrl != null ? NetworkImage(imageUrl!) : null,
                backgroundImage: Svg(
                  'assets/logo.svg',
                  color: theme.colorScheme.onSurface,
                ),
                backgroundColor: theme.colorScheme.surface,
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
