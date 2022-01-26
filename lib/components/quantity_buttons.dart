import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/theme/palette.dart';

class QuantityButtons extends StatefulWidget {
  final int quantity;
  final ValueChanged<int>? onChanged;
  final VoidCallback? onRemoved;

  const QuantityButtons({
    this.quantity = 1,
    this.onChanged,
    this.onRemoved,
  }) : assert(quantity > 0);

  @override
  State<QuantityButtons> createState() => _QuantityButtonsState();
}

class _QuantityButtonsState extends State<QuantityButtons> {
  final size = 30.0;
  late int quantity = widget.quantity;

  void changeQuantity(int increment) {
    setState(() => quantity += increment);
    widget.onChanged?.call(quantity);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        quantity == 1
            ? widget.onRemoved == null
                ? SizedBox.square(dimension: size)
                : quantityButton(
                    color: Palette.red,
                    icon: LucideIcons.trash,
                    onTap: widget.onRemoved,
                  )
            : quantityButton(
                color: theme.primaryColor,
                icon: LucideIcons.minus,
                onTap: () => changeQuantity(-1),
              ),
        SizedBox.square(
          dimension: size,
          child: Center(
            child: Text(
              '$quantity',
              style: theme.textTheme.bodyText2,
            ),
          ),
        ),
        quantityButton(
          color: theme.primaryColor,
          icon: LucideIcons.plus,
          onTap: () => changeQuantity(1),
        ),
      ],
    );
  }

  Widget quantityButton({
    required Color color,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    final borderRadius = BorderRadius.circular(15);
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: borderRadius,
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: kSmallIconSize,
          color: color,
        ),
      ),
    );
  }
}
