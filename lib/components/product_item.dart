import 'package:flutter/material.dart';

enum View { card, tile }

class ProductCard extends StatelessWidget {
  final View? view;

  const ProductCard({
    Key? key,
    this.view,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (view) {
      case View.tile:
        return tile;
      case View.card:
      default:
        return card;
    }
  }

  Widget get card => Container(
        child: Column(
          children: [
            // image
            // title
            Row(
              children: [
                // price
                // add
              ],
            )
          ],
        ),
      );

  Widget get tile => Container(
        child: Row(
          children: [
            // image
            Column(
              children: [
                // title
                // price
              ],
              // add
            )
          ],
        ),
      );
}
