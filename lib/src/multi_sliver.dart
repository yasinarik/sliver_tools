import 'package:flutter/widgets.dart';

import 'rendering/multi_sliver.dart';

/// [MultiSliver] allows for returning multiple slivers from a single build method
class MultiSliver extends MultiChildRenderObjectWidget {
  MultiSliver({
    Key? key,
    required List<Widget> children,
    this.pushPinnedChildren = false,
    this.reverse = false,
  }) : super(key: key, children: children);

  final bool reverse;

  /// If true any children that paint beyond the layoutExtent of the entire [MultiSliver] will
  /// be pushed off towards the leading edge of the [Viewport]
  final bool pushPinnedChildren;

  @override
  RenderMultiSliver createRenderObject(BuildContext context) => RenderMultiSliver(
        reverse: reverse,
        containing: pushPinnedChildren,
      );

  @override
  void updateRenderObject(BuildContext context, covariant RenderMultiSliver renderObject) {
    renderObject.containing = pushPinnedChildren;
  }
}
