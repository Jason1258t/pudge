import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pudge/features/post_overlay/arc_menu/utils.dart';

part 'render_arc_layout.dart';
part 'arc_direction.dart';

class ArcLayout extends MultiChildRenderObjectWidget {
  const ArcLayout({
    super.key,
    required super.children,
    required this.center,
    required this.radius,
    required this.itemSpacing,
    this.startAngle = 0,
    this.direction = ArcDirection.clockwise,
  });

  final Offset center;
  final double radius;
  final double startAngle;
  final ArcDirection direction;

  /// spacing between children centers in radians
  final double itemSpacing;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderArcLayout(
      center: center,
      radius: radius,
      startAngle: startAngle,
      direction: direction,
      itemSpacing: itemSpacing,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderArcLayout renderObject) {
    renderObject
      ..center = center
      ..radius = radius
      ..startAngle = startAngle
      ..itemSpacing = itemSpacing
      ..direction = direction;
  }
}

class ArcParentData extends ContainerBoxParentData<RenderBox> {}
