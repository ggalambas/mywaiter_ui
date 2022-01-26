import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/components/cart.dart';
import 'package:mywaiter_design/components/product_item.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/theme/palette.dart';
import 'package:mywaiter_design/config/theme/theme_config.dart';
import 'package:mywaiter_design/pages/info_page.dart';
import 'package:mywaiter_design/widgets/flexible_space_title.dart';
import 'package:mywaiter_design/widgets/persistent_tab_bar.dart';

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
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Scaffold(
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
                        onTap: () =>
                            Navigator.pushNamed(context, InfoPage.route),
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
                                                style: TextStyle(
                                                    color: Palette.green),
                                              )
                                            : TextSpan(
                                                text: 'Closed',
                                                style: TextStyle(
                                                    color: Palette.red),
                                              ),
                                        TextSpan(text: ' ∙ Closes at 23pm'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Tap for more information',
                                    style: TextStyle(
                                        color: theme.colorScheme.onSurface),
                                  ),
                                ],
                              ),
                              Icon(LucideIcons.chevronRight,
                                  size: kSmallIconSize),
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
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Cart(),
          ),
        ],
      ),
    );
  }
}
