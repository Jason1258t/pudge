import 'package:flutter/material.dart';
import 'package:pudge/core/theme/colors.dart';

class GalleryDots extends StatelessWidget {
  const GalleryDots({super.key, required this.length, required this.curr});

  final int length;
  final int curr;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black54,
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
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: curr == index ? AppColors.primary : Colors.white30,
        ),
      ),
    );
  }
}
