import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/config/theme/palette.dart';
import 'package:mywaiter_design/pages/home_page.dart';
import 'package:mywaiter_design/pages/restaurant_page.dart';
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

class _SearchTabState extends State<SearchTab> {
  late final controller = TextEditingController()
    ..addListener(() => setState(() {}));

  //* to do:
  //* search tap to unfocus

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
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
        SizedBox(height: 8),
        Expanded(
          child: ListView(
            children: [
              for (var i = 0; i < 30; i++) RestaurantTile(),
            ],
          ),
        ),
      ],
    );
  }
}

class RestaurantTile extends StatelessWidget {
  final String name = 'Fábrica Bolina';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RestaurantPage.route),
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              foregroundImage: NetworkImage(
                'https://via.placeholder.com/'
                '150/FFD800/FFFFFF/?text=${name.substring(0, 2)}',
              ),
              backgroundImage: Svg('assets/logo.svg'),
              backgroundColor: theme.colorScheme.surface,
            ),
            SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  // style: ,
                ),
                Text.rich(
                  TextSpan(
                    // style: ,
                    children: [
                      TextSpan(
                        text: 'Opened',
                        style: TextStyle(color: Palette.green),
                      ),
                      TextSpan(text: ' ∙ Closes at 23pm'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
