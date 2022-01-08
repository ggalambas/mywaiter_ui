import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomePage extends StatefulWidget {
  static String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final List<Widget> pages = [
    Container(color: Colors.blueAccent),
    Container(color: Colors.greenAccent),
    Container(color: Colors.orangeAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) => setState(() => pageIndex = index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.clipboardList),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
