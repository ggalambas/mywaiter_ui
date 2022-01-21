import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/pages/home_page.dart';

class FeedTab extends StatelessWidget with HomeTab {
  @override
  final Widget icon = Icon(LucideIcons.home);
  @override
  final Widget selectedIcon = SvgPicture.asset(
    'assets/home_filled.svg',
    // height: 32,
  );
  @override
  final String label = 'Home';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Feed'),
    );
  }
}
