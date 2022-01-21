import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/theme/palette.dart';
import 'package:mywaiter_design/pages/home_page.dart';
import 'package:mywaiter_design/pages/restaurant_page.dart';
import 'package:mywaiter_design/widgets/item_tile.dart';
import 'package:mywaiter_design/widgets/suffix_icon.dart';
import 'package:mywaiter_design/widgets/svg_icon.dart';

class SearchTab extends StatefulWidget with HomeTab {
  @override
  final String label = 'Search';
  @override
  final Widget icon = SvgIcon('assets/search.svg');
  @override
  final Widget activeIcon = SvgIcon('assets/search_filled.svg');
  @override
  State<SearchTab> createState() => _SearchTabState();
}

//* to do
//* placeholder image

class _SearchTabState extends State<SearchTab> {
  late final controller = TextEditingController()
    ..addListener(() => setState(() {}));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(top: 8 + 56 + 8),
          child: Column(
            children: [
              for (var i = 0; i < 30; i++) RestaurantTile(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8).add(
            EdgeInsets.symmetric(horizontal: kScreenPadding),
          ),
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(LucideIcons.search),
              suffixIcon: controller.text.isEmpty
                  ? null
                  : SuffixIcon(
                      LucideIcons.x,
                      onTap: () => controller.text = '',
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class RestaurantTile extends StatelessWidget {
  final String name = 'Fábrica Bolina';
  final bool opened = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ItemTile(
      imageUrl: 'https://via.placeholder.com/'
          '150/FFD800/FFFFFF/?text=${name.substring(0, 2)}',
      title: name,
      onTap: () => Navigator.pushNamed(context, RestaurantPage.route),
      subtitle: Text.rich(
        TextSpan(
          style: theme.textTheme.caption,
          children: [
            opened
                ? TextSpan(
                    text: 'Opened',
                    style: TextStyle(color: Palette.green),
                  )
                : TextSpan(
                    text: 'Closed',
                    style: TextStyle(color: Palette.red),
                  ),
            TextSpan(text: ' ∙ Closes at 23pm'),
          ],
        ),
      ),
    );
  }
}
