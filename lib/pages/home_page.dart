import 'package:flutter/material.dart';
import 'package:mywaiter_design/pages/home_tabs/feed_tab.dart';
import 'package:mywaiter_design/pages/home_tabs/orders_tab.dart';
import 'package:mywaiter_design/pages/home_tabs/search_tab.dart';

abstract class HomeTab extends StatelessWidget {
  IconData get icon;
  String get label;
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
      body: tabs[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (index) => setState(() => tabIndex = index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: tabs
            .map((tab) => BottomNavigationBarItem(
                  icon: Icon(tab.icon),
                  label: tab.label,
                ))
            .toList(),
      ),
    );
  }
}