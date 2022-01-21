import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String asset;
  final Color? color;
  final double? size;

  const SvgIcon(this.asset, {this.color, this.size});

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? IconTheme.of(context).color;
    final size = this.size ?? IconTheme.of(context).size;
    return SvgPicture.asset(
      asset,
      height: size,
      color: color,
    );
  }
}
