import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/pages/home_page.dart';
import 'package:mywaiter_design/pages/restaurant_page.dart';

class SearchTab extends StatefulWidget with HomeTab {
  @override
  final String label = 'Search';
  @override
  final Widget icon = SvgPicture.asset(
    'assets/search.svg',
    height: 24,
  );
  @override
  final Widget selectedIcon = SvgPicture.asset(
    'assets/search_filled.svg',
    height: 24,
  );

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late final TextEditingController controller = TextEditingController()
    ..addListener(() => setState(() {}));

  //* to do:
  //* search tap to unfocus

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* search
        TextField(
          controller: controller,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon:
                IconButton(onPressed: null, icon: Icon(LucideIcons.search)),
            suffixIcon: controller.text.isEmpty
                ? null
                : IconButton(
                    iconSize: 18, // kSmallIconSize
                    tooltip: 'Clear',
                    onPressed: () => controller.text = '',
                    icon: Icon(LucideIcons.x),
                  ),
          ),
        ),
        //* restaurants list
        Column(
          children: [
            for (var i = 0; i < 5; i++) ...[
              RestaurantTile(),
              SizedBox(height: 16)
            ]
          ],
        ),
      ],
    );
  }
}

class RestaurantTile extends StatelessWidget {
  final double height = 48;
  final String name = 'Fábrica Bolina';

  // final String name = 'Bo';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RestaurantPage.route),
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            CircleAvatar(
              // the restaurant image
              foregroundImage: NetworkImage(
                'https://via.placeholder.com/'
                '150/FFD800/FFFFFF/?text=${name.substring(0, 2)}',
              ),
              // a default image of the assets instead of color
              // backgroundImage: ,
              backgroundColor: theme.colorScheme.surface,
              radius: height / 2,
            ),
            SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text('Opened ∙ Closes at 23pm'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
