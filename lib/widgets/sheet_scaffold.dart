import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:mywaiter_design/config/constants.dart';

class SheetScaffold extends StatelessWidget {
  final double backgroundHeight;
  final Widget background;
  final Widget body;

  const SheetScaffold({
    required this.backgroundHeight,
    required this.background,
    required this.body,
  });

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minHeight = (screenHeight(context) - backgroundHeight) /
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
            background, //? parallax
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
                      top: Radius.circular(24),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: controller,
                    padding: EdgeInsets.symmetric(
                      horizontal: kScreenPadding,
                      vertical: 24,
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
