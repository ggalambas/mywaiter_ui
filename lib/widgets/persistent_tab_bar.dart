import 'package:flutter/material.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  final List<String> categories;
  const PersistentTabBar({required this.categories});

  @override
  double get maxExtent => kTextTabBarHeight;
  @override
  double get minExtent => kTextTabBarHeight;

  @override
  bool shouldRebuild(
    covariant SliverPersistentHeaderDelegate oldDelegate,
  ) =>
      true;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    return Material(
      // elevation: overlapsContent ? 4 : 0,
      color: theme.backgroundColor,
      child: TabBar(
        isScrollable: true,
        padding: EdgeInsets.symmetric(horizontal: kScreenPadding),
        indicatorPadding: EdgeInsets.only(top: 12),
        indicator: DotIndicator(
          radius: 4,
          color: theme.colorScheme.onBackground,
        ),
        labelColor: theme.colorScheme.onBackground,
        unselectedLabelColor: theme.colorScheme.onSurface,
        tabs: [...categories.map((category) => Tab(text: category))],
      ),
    );
  }
}
