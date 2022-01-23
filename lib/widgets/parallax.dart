import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

class Parallax extends StatelessWidget {
  final List<ParallaxItem> children;
  const Parallax({required this.children});

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: _ParallaxFlowDelegate(
        context: context,
        scrollable: Scrollable.of(context)!,
        items: children,
      ),
      children: children,
    );
  }
}

class ParallaxItem extends StatelessWidget {
  final Widget child;
  final double offset;
  const ParallaxItem({required this.offset, required this.child})
      : assert(offset >= -1 && offset <= 1);

  @override
  GlobalKey get key => GlobalKey();

  @override
  Widget build(BuildContext context) => child;
}

class _ParallaxFlowDelegate extends FlowDelegate {
  final BuildContext context;
  final ScrollableState scrollable;
  final List<ParallaxItem> items;

  _ParallaxFlowDelegate({
    required this.context,
    required this.scrollable,
    required this.items,
  }) : super(repaint: scrollable.position);

  List<GlobalKey> get keys => items.map((i) => i.key).toList();
  bool get vertical => [AxisDirection.up, AxisDirection.down].contains(
        scrollable.axisDirection,
      );

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(height: constraints.maxHeight);
  }

  @override
  void paintChildren(FlowPaintingContext flowContext) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final itemBox = context.findRenderObject() as RenderBox;
    final itemOffset = itemBox.localToGlobal(
      itemBox.size.bottomCenter(Offset.zero),
      ancestor: scrollableBox,
    );

    final offset = vertical ? itemOffset.dy : itemOffset.dx;
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (offset / viewportDimension); //.clamp(0.0, 1.0);

    for (var i = 0; i < items.length; i++) {
      final item = items[i];

      final flowSize = flowContext.size;
      final itemSize =
          (item.key.currentContext!.findRenderObject() as RenderBox).size;
      final offsetFraction =
          item.offset.sign == 1 ? scrollFraction : (1 - scrollFraction);

      late final double dx, dy;
      if (vertical) {
        dx = (flowSize.width - itemSize.width) / 2;
        dy = item.offset.abs() * itemSize.height * offsetFraction;
      } else {
        dy = (flowSize.height - itemSize.height) / 2;
        dx = item.offset.abs() * itemSize.width * offsetFraction;
      }

      flowContext.paintChild(
        i,
        transform: Transform.translate(offset: Offset(dx, dy)).transform,
      );
    }
  }

  @override
  bool shouldRepaint(_ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        context != oldDelegate.context ||
        ListEquality().equals(keys, oldDelegate.keys);
  }
}
