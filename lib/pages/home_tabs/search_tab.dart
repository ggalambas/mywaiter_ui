import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/pages/home_page.dart';

class SearchTab extends HomeTab {
  @override
  final IconData icon = LucideIcons.search;
  @override
  final String label = 'Search';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search'),
    );
  }
}
