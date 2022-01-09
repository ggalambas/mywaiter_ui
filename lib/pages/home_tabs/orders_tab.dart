import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/pages/home_page.dart';

class OrdersTab extends HomeTab {
  @override
  final IconData icon = LucideIcons.clipboardList;
  @override
  final String label = 'Orders';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Orders'),
    );
  }
}
