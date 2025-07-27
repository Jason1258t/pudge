import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;

  final Color color;
  final double radius;

  ArcPainter(
    this.startAngle,
    this.sweepAngle, {
    this.color = Colors.blue,
    this.radius = 100,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    );

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
