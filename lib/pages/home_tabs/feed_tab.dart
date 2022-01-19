import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/pages/home_page.dart';

class FeedTab extends StatelessWidget with HomeTab {
  @override
  final IconData icon = LucideIcons.home;
  @override
  final String label = 'Home';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Feed'),
    );
  }
}
