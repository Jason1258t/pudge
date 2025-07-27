import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pudge/features/post_overlay/button_data.dart';
import 'package:pudge/pages/explore/post_overlay/arc_layout/arc_layout.dart';

int? touchedButton(
  List<ButtonData> buttons,
  Offset position,
  double threshold,
) {
  for (int i = 0; i < buttons.length; i++) {
    final buttonPosition = buttons[i].position!;
    final distance = (position - buttonPosition).distance;

    if (distance <= threshold) return i;
  }

  return null;
}

Offset getButtonPosition({
  required int index,
  required double startAngle,
  required Offset center,
  required double radius,
  required double spacing,
  ArcDirection direction = ArcDirection.clockwise,
}) {
  final angle = startAngle + spacing * index;
  final buttonCenter = Offset(
    center.dx + cos(angle * direction.toInt()) * radius,
    center.dy + sin(angle * direction.toInt()) * radius,
  );
  return buttonCenter;
}

double getArcStartAngle({
  required BuildContext context,
  required Offset center,
  double arcLength = pi / 2,
}) {
  final startAngle = pi / 2 + (arcLength / 2);
  final screenHalf = MediaQuery.sizeOf(context).width / 2;

  final middleOffset = center.dx - screenHalf;
  final circleOffset = arcLength * (middleOffset / screenHalf);

  final angle = startAngle + circleOffset;

  return angle;
}
