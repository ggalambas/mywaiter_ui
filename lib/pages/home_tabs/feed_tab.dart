import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mywaiter_design/pages/home_page.dart';

class FeedTab extends StatelessWidget with HomeTab {
  @override
  final String label = 'Home';
  @override
  final Widget icon = SvgPicture.asset(
    'assets/home.svg',
    height: 24,
  );
  @override
  final Widget selectedIcon = SvgPicture.asset(
    'assets/home_filled.svg',
    height: 24,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Feed'),
    );
  }
}
