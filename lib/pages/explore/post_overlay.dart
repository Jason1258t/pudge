import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pudge/core/theme/app_radii.dart';

class PostOverlay extends StatefulWidget {
  const PostOverlay({
    super.key,
    required this.image,
    required this.size,
    required this.globalPosition,
    required this.imageOffset,
  });

  final Widget image;
  final Size size;
  final Offset globalPosition;
  final Offset imageOffset;

  @override
  State<PostOverlay> createState() => _PostOverlayState();
}

class _PostOverlayState extends State<PostOverlay> {
  static const radius = 80.0;
  static const padding = 32;
  static const touchRadius = 25;

  @override
  Widget build(BuildContext context) {
    final angle = getArcStartAngle(widget.globalPosition);
    return Stack(
      children: [
        Container(color: Colors.black54),
        Positioned(
          top: widget.imageOffset.dy,
          left: widget.imageOffset.dx,
          child: SizedBox(width: widget.size.width, child: widget.image),
        ),
        Positioned(
          left: widget.globalPosition.dx - radius - padding,
          top: widget.globalPosition.dy - radius - padding,
          child: CustomPaint(
            size: Size(radius * 2 + padding * 2, radius * 2 + padding * 2),
            painter: ArcPainter(-angle, 0.7 * pi),
          ),
        ),
        Positioned(
          left: widget.globalPosition.dx - touchRadius,
          top: widget.globalPosition.dy - touchRadius,
          child: Container(
            width: touchRadius * 2,
            height: touchRadius * 2,
            decoration: BoxDecoration(
              borderRadius: AppRadii.full,
              border: Border.fromBorderSide(
                BorderSide(color: Colors.white70, width: 4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  double getArcStartAngle(Offset globalPosition, {double arcLength = pi / 2}) {
    final startAngle = pi / 2 + (arcLength / 2);
    final screenHalf = MediaQuery.sizeOf(context).width / 2;

    final middleOffset = globalPosition.dx - screenHalf;
    final circleOffset = arcLength * (middleOffset / screenHalf);

    final angle = startAngle + circleOffset;

    return angle;
  }
}

class ArcPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;

  ArcPainter(this.startAngle, this.sweepAngle);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: 100,
    );

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppRadii.full,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
