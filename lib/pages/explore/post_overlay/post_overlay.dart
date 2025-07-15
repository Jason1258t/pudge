import 'package:flutter/material.dart';
import 'package:pudge/core/theme/app_radii.dart';
import 'package:pudge/features/post_overlay/arc_menu/arc_menu.dart';
import 'package:pudge/features/post_overlay/arc_menu/arc_menu_options.dart';
import 'package:pudge/features/post_overlay/button_data.dart';

class PostOverlay extends StatelessWidget {
  const PostOverlay({
    super.key,
    required this.buttons,
    required this.image,
    required this.size,
    required this.center,
    required this.imageOffset,
    this.touchRadius = 25,
  });

  final Widget image;
  final Size size;
  final Offset center;
  final Offset imageOffset;
  final List<ButtonData> buttons;
  final double touchRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.black.withAlpha((255 * 0.7).floor())),
        Positioned(
          top: imageOffset.dy,
          left: imageOffset.dx,
          child: SizedBox(width: size.width, child: image),
        ),
        ArcMenu(
          buttons: buttons,
          options: ArcMenuOptions(center: center),
        ),
        Positioned(
          left: center.dx - touchRadius,
          top: center.dy - touchRadius,
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
}
