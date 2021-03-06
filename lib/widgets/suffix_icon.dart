import 'package:flutter/material.dart';
import 'package:mywaiter_design/config/constants.dart';

class SuffixIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const SuffixIcon(this.icon, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(icon, size: kSmallIconSize),
      ),
    );
  }
}
