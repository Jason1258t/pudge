import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/core/theme/app_radii.dart';
import 'package:pudge/features/post_overlay/arc_menu/arc_menu.dart';
import 'package:pudge/features/post_overlay/post_overlay_notifier.dart';

class PostOverlay extends ConsumerWidget {
  const PostOverlay({
    super.key,
    required this.image,
    required this.size,
    required this.imageOffset,
    this.touchRadius = 25,
  });

  final Widget image;
  final Size size;
  final Offset imageOffset;
  final double touchRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postOverlayStateNotifierProvider);

    return Stack(
      children: [
        Container(color: Colors.black.withAlpha((255 * 0.7).floor())),
        Positioned(
          top: imageOffset.dy,
          left: imageOffset.dx,
          child: SizedBox(width: size.width, child: image),
        ),
        ArcMenu(),
        Positioned(
          left: state.menuState.options.center.dx - touchRadius,
          top: state.menuState.options.center.dy - touchRadius,
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
