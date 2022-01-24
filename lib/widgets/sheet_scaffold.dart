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
  var bodyHeight = 0.0;
  var trailingHeight = 0.0;

  @override
  void afterFirstLayout(BuildContext context) => setState(() {
        trailingHeight = trailingKey.currentContext?.size!.height ?? 0.0;
        bodyHeight = bodyKey.currentContext!.size!.height;
      });

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
        backgroundColor: theme.colorScheme.surface, //! placeholder background
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (widget.background != null)
              Align(
                alignment: Alignment.topCenter,
                child: widget.background!,
              ),
            Padding(
              padding: EdgeInsets.only(top: kToolbarHeight),
              child: _Sheet(
                key: ValueKey(bodyHeight),
                minHeight: widget.minHeight,
                height: bodyHeight + trailingHeight,
                builder: (context, controller) => Material(
                  key: bodyKey,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(kSheetBorderRadius),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: controller,
                    padding: EdgeInsets.symmetric(horizontal: kScreenPadding)
                        .add(EdgeInsets.only(
                      top: kSheetBorderRadius,
                      bottom: 8 + trailingHeight,
                    )),
                    child: widget.body,
                  ),
                ),
              ),
            ),
            if (widget.trailing != null)
              Padding(
                key: trailingKey,
                padding: EdgeInsets.symmetric(horizontal: kScreenPadding)
                    .add(EdgeInsets.only(bottom: kScreenPadding)),
                child: widget.trailing!,
              ),
          ],
        ),
      ),
    );
  }
}

class _Sheet extends StatelessWidget {
  final double? minHeight;
  final double height;
  final Widget Function(
    BuildContext context,
    ScrollController? scrollController,
  ) builder;

  const _Sheet({
    Key? key,
    this.minHeight,
    required this.height,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (height == 0) return builder(context, null);
    if (minHeight != null && minHeight! < height)
      return LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight;
          final minRelative = (minHeight! / maxHeight).clamp(0.0, 1.0);
          final maxRelative = (height / maxHeight).clamp(0.0, 1.0);
          return FlexibleBottomSheet(
            minHeight: minRelative,
            initHeight: minRelative,
            maxHeight: maxRelative,
            isCollapsible: false,
            builder: (context, controller, _) => builder(context, controller),
          );
        },
      );
    return SizedBox(
      height: minHeight,
      child: builder(context, null),
    );
  }
}
