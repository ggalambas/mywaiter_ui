import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/pages/restaurant_page.dart';

class ProductItem extends StatelessWidget {
  final View view;
  const ProductItem({required this.view});

  @override
  Widget build(BuildContext context) {
    late final Widget item;
    switch (view) {
      case View.list:
        item = buildTile(context);
        break;
      case View.grid:
        item = buildCard(context);
        break;
    }
    return InkWell(
      onTap: () {},
      child: item,
    );
  }

  Widget buildCard(BuildContext context) {
    return SizedBox(
      width: 162,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image(height: 130),
          title(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              price(),
              Spacer(),
              addButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTile(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          image(width: 59),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(),
              price(),
            ],
            // add
          ),
          Spacer(),
          addButton(),
        ],
      ),
    );
  }

  Widget image({double? height, double? width}) {
    return Container(
      color: Colors.greenAccent,
      height: height,
      width: width,
    );
  }

  Widget title() {
    return Text('Whiskey The Balvenie');
  }

  Widget price() {
    return Text('€6,90');
  }

  Widget addButton() {
    return IconButton(onPressed: () {}, icon: Icon(LucideIcons.plus));
  }
}
