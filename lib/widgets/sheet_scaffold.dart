import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/theme/theme_config.dart';

class SheetScaffold extends StatefulWidget {
  final double? minHeight;
  final Widget? background;
  final Widget body;
  final Widget? trailing;

  const SheetScaffold({
    this.minHeight,
    this.background,
    required this.body,
    this.trailing,
  });

  @override
  State<SheetScaffold> createState() => _SheetScaffoldState();
}

class _SheetScaffoldState extends State<SheetScaffold>
    with AfterLayoutMixin<SheetScaffold> {
  final bodyKey = GlobalKey();
  final trailingKey = GlobalKey();
  late var minHeight = (widget.minHeight ?? 0.0) + borderRadius;
  var maxHeight = double.infinity;

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      kToolbarHeight;

  @override
  void afterFirstLayout(BuildContext context) {
    final trailingHeight = trailingKey.currentContext?.size!.height ?? 0;
    final bodyHeight = bodyKey.currentContext!.size!.height;
    final finalHeight = bodyHeight + trailingHeight;
    setState(() {
      if (widget.minHeight == null) minHeight = finalHeight;
      maxHeight = max(minHeight, finalHeight);
    });
  }

  double get borderRadius => 24;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: ThemeConfig.systemOverlayStyle,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(8),
            child: Material(
              elevation: 2,
              shape: CircleBorder(),
              child: BackButton(),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: theme.colorScheme.surface,
        body: Stack(
          children: [
            // TODO parallax
            if (widget.background != null) widget.background!,
            Container(
              padding: EdgeInsets.only(top: kToolbarHeight),
              alignment: Alignment.bottomCenter,
              child: _Sheet(
                minHeight: minHeight,
                maxHeight: maxHeight,
                builder: (context, controller) => Material(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(borderRadius),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Padding(
                      key: bodyKey,
                      padding: EdgeInsets.symmetric(
                        horizontal: kScreenPadding,
                        vertical: borderRadius,
                      ),
                      child: widget.body,
                    ),
                  ),
                ),
              ),
            ),
            if (widget.trailing != null)
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(kScreenPadding),
                child: KeyedSubtree(
                  key: trailingKey,
                  child: widget.trailing!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Sheet extends StatelessWidget {
  final double minHeight;
  final double maxHeight;
  final Widget Function(
    BuildContext context,
    FlexibleDraggableScrollableSheetScrollController? scrollController,
  ) builder;

  const _Sheet({
    required this.minHeight,
    required this.maxHeight,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final minRelative = (minHeight / maxHeight).clamp(0.0, 1.0);
    return SizedBox(
      key: ValueKey(maxHeight),
      height: maxHeight,
      child: minHeight < maxHeight
          ? FlexibleBottomSheet(
              minHeight: minRelative,
              initHeight: minRelative,
              maxHeight: 1,
              isCollapsible: false,
              builder: (context, controller, _) => builder(context, controller),
            )
          : builder(context, null),
    );
  }
}
