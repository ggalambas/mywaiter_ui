import 'package:flutter/material.dart';
import 'package:mywaiter_design/pages/home_tabs/feed_tab.dart';
import 'package:mywaiter_design/pages/home_tabs/orders_tab.dart';
import 'package:mywaiter_design/pages/home_tabs/search_tab.dart';

mixin HomeTab on Widget {
  String get label;
  Widget get icon;
  Widget get activeIcon;
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
    return Scaffold(
      appBar: tabs[tabIndex].appBar,
      body: SafeArea(child: tabs[tabIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (index) => setState(() => tabIndex = index),
        items: tabs.map((tab) {
          return BottomNavigationBarItem(
            icon: tab.icon,
            activeIcon: tab.activeIcon,
            label: tab.label,
          );
        }).toList(),
      ),
    );
  }
}
