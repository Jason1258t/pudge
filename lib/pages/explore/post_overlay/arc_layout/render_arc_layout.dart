part of 'arc_layout.dart';

class RenderArcLayout extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, ArcParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, ArcParentData> {
  RenderArcLayout({
    required Offset center,
    required double radius,
    required double startAngle,
    required ArcDirection direction,
    required double itemSpacing,
  }) : _center = center,
       _radius = radius,
       _startAngle = startAngle,
       _itemSpacing = itemSpacing,
       _direction = direction;

  Offset _center;
  double _radius;
  double _startAngle;
  ArcDirection _direction;
  double _itemSpacing;

  set center(Offset v) => _center = v;

  set startAngle(double v) => _startAngle = v;

  set radius(double v) => _radius = v;

  set direction(ArcDirection v) => _direction = v;

  set itemSpacing(double v) => _itemSpacing = _itemSpacing;

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! ArcParentData) {
      child.parentData = ArcParentData();
    }
  }


  @override
  void performLayout() {
    size = constraints.biggest;
    if (getChildrenAsList().length * _itemSpacing > 2 * math.pi) {
      throw Exception("Can't fit all children");
    }

    int index = 0;
    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData as ArcParentData;

      // Lay out the child with unbounded constraints
      child.layout(constraints.loosen(), parentUsesSize: true);

      final childSize = child.size;

      final angle = _startAngle + _itemSpacing * index * _direction.toInt();
      final dx = _center.dx + _radius * math.cos(angle) - childSize.width / 2;
      final dy = _center.dy + _radius * math.sin(angle) - childSize.height / 2;

      childParentData.offset = Offset(dx, dy);

      child = childParentData.nextSibling;
      index++;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData as ArcParentData;
      context.paintChild(child, offset + childParentData.offset);
      child = childParentData.nextSibling;
    }
  }
}
