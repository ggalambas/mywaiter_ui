import 'package:flutter/material.dart';
import 'package:mywaiter_design/config/extensions.dart';
import 'package:mywaiter_design/pages/home_tabs/feed_tab.dart';
import 'package:mywaiter_design/pages/home_tabs/orders_tab.dart';
import 'package:mywaiter_design/pages/home_tabs/search_tab.dart';

mixin HomeTab on Widget {
  IconData get icon;
  String get label;
  PreferredSizeWidget? get appBar => null;
}

class HomePage extends StatefulWidget {
  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;

  final List<HomeTab> tabs = [
    FeedTab(),
    SearchTab(),
    OrdersTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: tabs[tabIndex].appBar,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(top: 8)
                .add(EdgeInsets.symmetric(horizontal: 16)),
            child: tabs[tabIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (index) => setState(() => tabIndex = index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: theme.colorScheme.onBackground,
        unselectedItemColor: theme.colorScheme.onSurface,
        items: tabs
            .mapI((tab, i) => BottomNavigationBarItem(
                  icon: Icon(tab.icon),
                  label: tab.label,
                ))
            .toList(),
      ),
    );
  }
}
