import 'package:flutter/material.dart';
import 'package:pudge/core/theme/app_radii.dart';
import 'package:pudge/core/theme/colors.dart';

class DotIndicators extends StatelessWidget {
  const DotIndicators({
    super.key,
    required this.length,
    required this.curr,
    this.size = 8,
    this.padding = 6, this.backgroundColor,
  });

  final int length;
  final int curr;
  final double size;
  final double padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: AppRadii.full,
          color: backgroundColor ?? Colors.black54,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildDots(),
        ),
      ),
    );
  }

  _buildDots() {
    return List.generate(
      length,
          (index) => Container(
        width: size,
        height: size,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: curr == index ? AppColors.primary : Colors.white30,
        ),
      ),
    );
  }
}
