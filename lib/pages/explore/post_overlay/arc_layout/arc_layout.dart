import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

part 'render_arc_layout.dart';

enum ArcDirection { clockwise, counterClockwise }

extension ArcDirectionToInt on ArcDirection {
  int toInt() => this == ArcDirection.clockwise ? 1 : -1;
}

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
