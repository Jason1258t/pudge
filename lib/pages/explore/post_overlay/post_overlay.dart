import 'dart:developer';
import 'dart:math' hide log;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/core/theme/app_radii.dart';
import 'package:pudge/features/post_overlay/button_data.dart';
import 'package:pudge/features/post_overlay/post_overlay_notifier.dart';
import 'package:pudge/pages/explore/post_overlay/arc_layout/arc_layout.dart';
import 'package:pudge/pages/explore/post_overlay/rounded_icon_button.dart';
import 'package:pudge/shared/ui/icon/icon.dart';

class PostOverlay extends ConsumerStatefulWidget {
  const PostOverlay({
    super.key,
    required this.buttons,
    required this.image,
    required this.size,
    required this.center,
    required this.imageOffset,
  });

  final Widget image;
  final Size size;
  final Offset center;
  final Offset imageOffset;
  final List<ButtonData> buttons;

  @override
  ConsumerState<PostOverlay> createState() => _PostOverlayState();
}

class _PostOverlayState extends ConsumerState<PostOverlay>
    with SingleTickerProviderStateMixin {
  static const radius = 100.0;
  static const padding = 32;
  static const touchRadius = 25;
  static const itemSpacing = pi / 5;
  static const touchSpread = 36;

  late final AnimationController _controller;
  late final Animation<double> _radiusAnimation;
  late double angle;

  @override
  void initState() {
    _initAnimation();
    _controller.addListener(() {
      if (_controller.isCompleted) {
        _initButtons();
      }
    });
    super.initState();
  }

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _radiusAnimation = Tween<double>(
      begin: 0,
      end: radius,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  void _initButtons() {
    final notifier = ref.watch(postOverlayStateNotifierProvider.notifier);

    final buttons = <ButtonData>[];

    for (int i = 0; i < widget.buttons.length; i++) {
      final buttonPosition = _getButtonPosition(i, -angle, widget.center);
      buttons.add(widget.buttons[i].copyWith(position: buttonPosition));
    }

    notifier.setButtons(buttons);

    notifier.setPointerMove(onPointerMove);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onPointerMove(LongPressMoveUpdateDetails event) {
    final state = ref.watch(postOverlayStateNotifierProvider);

    final currentPosition = event.globalPosition;
    int? newHoveredIndex;

    for (int i = 0; i < state.buttons.length; i++) {
      final buttonPosition = state.buttons.map((e) => e.position!).toList()[i];
      final distance = (currentPosition - buttonPosition).distance;

      if (distance <= touchSpread) {
        newHoveredIndex = i;
        log('found hovered button $i');
        break;
      }
    }

    if (newHoveredIndex != state.hoveredButtonIndex) {
      HapticFeedback.lightImpact();
      ref
          .watch(postOverlayStateNotifierProvider.notifier)
          .setHoveredButton(newHoveredIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postOverlayStateNotifierProvider);
    angle = _getArcStartAngle(widget.center);
    return Stack(
      children: [
        Container(color: Colors.black.withAlpha((255 * 0.7).floor())),
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
              left: widget.center.dx - radius - padding,
              top: widget.center.dy - radius - padding,
              width: radius * 2 + padding * 2,
              height: radius * 2 + padding * 2,
              child: ArcLayout(
                center: Offset(radius + padding, radius + padding),
                radius: radius,
                itemSpacing: itemSpacing,
                startAngle: -angle,
                children: List.generate(
                  widget.buttons.length,
                  (i) => AnimatedScale(
                    duration: const Duration(milliseconds: 150),
                    scale: i == state.hoveredButtonIndex ? 1.2 : 1,
                    child: RoundedIconButton(
                      onPressed: widget.buttons[i].callback,
                      icon: CustomIcon.icon(widget.buttons[i].icon),
                      backgroundColor: i == state.hoveredButtonIndex ? Colors.deepPurple[300]! : Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          left: widget.center.dx - touchRadius,
          top: widget.center.dy - touchRadius,
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

  Offset _getButtonPosition(int index, double startAngle, Offset center) {
    final angle = startAngle + itemSpacing * index;
    final buttonCenter = Offset(
      center.dx + cos(angle) * radius,
      center.dy + sin(angle) * radius,
    );
    return buttonCenter;
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
