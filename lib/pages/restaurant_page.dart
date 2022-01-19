import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/components/product_item.dart';

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

class _RestaurantPageState extends State<RestaurantPage>
    with SingleTickerProviderStateMixin {
  View view = View.grid;

  late TabController controller = TabController(
    length: categories.length,
    vsync: this,
  );
  List<String> categories = [
    'All',
    'Food',
    'Beer',
    'Drinks',
    'Dessert',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.search)),
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.clipboardList)),
          IconButton(
              onPressed: () => setState(() => view = view.swap()),
              icon: Icon(view.swapIcon)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bolina'),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('R. Vale Formoso 9'),
                    Text('Opened ∙ Closes at 23pm'),
                    Text('Tap for more information'),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: null, icon: Icon(LucideIcons.chevronRight)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TabBar(
                  controller: controller,
                  isScrollable: true,
                  indicatorColor: theme.primaryColor,
                  tabs: [...categories.map((category) => Tab(text: category))],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller,
                    // filter items by category
                    children: [
                      for (var i = 0; i < categories.length; i++)
                        Wrap(
                          spacing: 8,
                          children: [
                            for (var i = 0; i < 5; i++) ...[
                              ProductItem(view: view),
                              SizedBox(height: 16)
                            ]
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
