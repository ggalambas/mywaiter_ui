import 'package:flutter/material.dart';
import 'package:mywaiter_design/components/cart_item.dart';
import 'package:mywaiter_design/config/constants.dart';

class CartSheet extends StatefulWidget {
  static void open(BuildContext context) => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        builder: (context) => Padding(
          padding: MediaQueryData.fromWindow(
            WidgetsBinding.instance!.window,
          ).padding.add(EdgeInsets.only(top: 8)),
          child: Material(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(kSheetBorderRadius),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 24,
                  alignment: Alignment.center,
                  child: Container(
                    height: 4,
                    width: 36,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Expanded(child: CartSheet()),
              ],
            ),
          ),
        ),
      );

  @override
  _CartSheetState createState() => _CartSheetState();
}

class _CartSheetState extends State<CartSheet> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, i) => CartItem(),
    );
  }
}
