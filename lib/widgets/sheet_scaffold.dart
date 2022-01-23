import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:mywaiter_design/config/constants.dart';

class SheetScaffold extends StatelessWidget {
  final double? backgroundHeight;
  final Widget? background;
  final Widget body;

  const SheetScaffold({
    this.backgroundHeight,
    this.background,
    required this.body,
  });

  double get borderRadius => 24;
  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minHeight = backgroundHeight == null
        ? 0.4
        : (screenHeight(context) - backgroundHeight! + borderRadius) /
            (screenHeight(context) - kToolbarHeight);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: Material(
            elevation: 4,
            shape: CircleBorder(),
            child: BackButton(),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: theme.colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            if (background != null) background!, //? parallax
            Padding(
              padding: EdgeInsets.only(top: kToolbarHeight),
              child: FlexibleBottomSheet(
                minHeight: minHeight,
                initHeight: minHeight,
                maxHeight: 1,
                isCollapsible: false,
                builder: (context, controller, offset) => Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(borderRadius),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: controller,
                    padding: EdgeInsets.symmetric(
                      horizontal: kScreenPadding,
                      vertical: borderRadius,
                    ),
                    child: body,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
