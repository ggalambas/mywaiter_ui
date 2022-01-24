import 'package:after_layout/after_layout.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/config/theme/theme_config.dart';

class SheetScaffold extends StatefulWidget {
  final double? minHeight;
  final Widget? background;
  final Widget body;

  const SheetScaffold({
    this.minHeight,
    this.background,
    required this.body,
  });

  @override
  State<SheetScaffold> createState() => _SheetScaffoldState();
}

class _SheetScaffoldState extends State<SheetScaffold>
    with AfterLayoutMixin<SheetScaffold> {
  final bodyKey = GlobalKey();
  late var minHeight = (widget.minHeight ?? 0.0) + borderRadius;
  var maxHeight = double.infinity;

  @override
  void afterFirstLayout(BuildContext context) {
    final bodyHeight = bodyKey.currentContext!.size!.height;
    setState(() {
      if (widget.minHeight == null) minHeight = bodyHeight;
      maxHeight = bodyHeight;
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
              elevation: 4,
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
                  elevation: 4,
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

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  @override
  Widget build(BuildContext context) {
    final totalHeight = (screenHeight(context) - kToolbarHeight);
    final minRelative = (minHeight / totalHeight).clamp(0.0, 1.0);
    final maxRelative = (maxHeight / totalHeight).clamp(0.0, 1.0);
    return minRelative < maxRelative
        ? FlexibleBottomSheet(
            key: ValueKey(minHeight),
            minHeight: minRelative,
            initHeight: minRelative,
            maxHeight: maxRelative,
            isCollapsible: false,
            builder: (context, controller, _) => builder(context, controller),
          )
        : SizedBox(
            key: ValueKey(minHeight),
            height: minHeight,
            child: builder(context, null),
          );
  }
}
