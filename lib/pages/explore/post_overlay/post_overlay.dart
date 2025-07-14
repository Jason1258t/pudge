import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pudge/core/theme/app_radii.dart';
import 'package:pudge/pages/explore/post_overlay/arc_layout/arc_layout.dart';
import 'package:pudge/pages/explore/post_overlay/rounded_icon_button.dart';
import 'package:pudge/shared/ui/icon/icon.dart';

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

class _PostOverlayState extends State<PostOverlay>
    with SingleTickerProviderStateMixin {
  static const radius = 100.0;
  static const padding = 32;
  static const touchRadius = 25;

  late final AnimationController _controller;
  late final Animation<double> _radiusAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _radiusAnimation = Tween<double>(
      begin: 0,
      end: radius,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angle = _getArcStartAngle(widget.globalPosition);
    return Stack(
      children: [
        Container(color: Colors.black54),
        Positioned(
          top: widget.imageOffset.dy,
          left: widget.imageOffset.dx,
          child: SizedBox(width: widget.size.width, child: widget.image),
        ),
        AnimatedBuilder(
          animation: _radiusAnimation,
          builder: (context, _) {
            final radius = _radiusAnimation.value;
            return Positioned(
              left: widget.globalPosition.dx - radius - padding,
              top: widget.globalPosition.dy - radius - padding,
              width: radius * 2 + padding * 2,
              height: radius * 2 + padding * 2,
              child: ArcLayout(
                center: Offset(radius + padding, radius + padding),
                radius: radius,
                itemSpacing: pi / 5,
                startAngle: -angle,
                children: [
                  RoundedIconButton(
                    onPressed: () {},
                    icon: CustomIcon.icon(
                      Icons.bookmark_add_outlined,
                    ),
                  ),
                  RoundedIconButton(
                    onPressed: () {},
                    icon: CustomIcon.icon(
                      Icons.share_outlined,
                    ),
                  ),
                  RoundedIconButton(
                    onPressed: () {},
                    icon: CustomIcon.icon(
                      Icons.telegram,
                    ),
                  ),
                  RoundedIconButton(
                    onPressed: () {},
                    icon: CustomIcon.icon(
                      Icons.favorite_border_rounded,
                    ),
                  ),
                ],
              ),
            );
          },
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

  double _getArcStartAngle(Offset globalPosition, {double arcLength = pi / 2}) {
    final startAngle = pi / 2 + (arcLength / 2);
    final screenHalf = MediaQuery.sizeOf(context).width / 2;

    final middleOffset = globalPosition.dx - screenHalf;
    final circleOffset = arcLength * (middleOffset / screenHalf);

    final angle = startAngle + circleOffset;

    return angle;
  }
}
