import 'package:flutter/material.dart';
import 'package:mywaiter_design/pages/home_page.dart';
import 'package:mywaiter_design/widgets/svg_icon.dart';

class FeedTab extends StatelessWidget with HomeTab {
  @override
  final String label = 'Home';
  @override
  final Widget icon = SvgIcon('assets/home.svg');
  @override
  final Widget activeIcon = SvgIcon('assets/home_filled.svg');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Feed'),
    );
  }
}
