import 'dart:math';

import 'package:flutter/animation.dart';

class ArcMenuOptions {
  ArcMenuOptions({
    required this.center,
    this.radius = 100,
    this.padding = 32,
    this.itemSpacing = pi / 5,
    this.touchThreshold = 36,
    this.radiusAnimationDuration = const Duration(milliseconds: 200),
    this.radiusAnimationCurve = Curves.easeOutCubic,
  });

  final Offset center;

  final double radius;
  final double padding;
  final double itemSpacing;
  final double touchThreshold;

  final Duration radiusAnimationDuration;
  final Curve radiusAnimationCurve;
}
