import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/features/post_overlay/arc_menu/utils.dart';
import 'package:pudge/features/post_overlay/post_overlay_notifier.dart';
import 'package:pudge/pages/explore/post_overlay/arc_layout/arc_layout.dart';

import 'animated_rounded_button.dart';

class ArcMenu extends ConsumerStatefulWidget {
  const ArcMenu({super.key});

  @override
  ConsumerState<ArcMenu> createState() => _ArcMenuState();
}

class _ArcMenuState extends ConsumerState<ArcMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _radiusAnimation;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    final options = ref
        .read(postOverlayStateNotifierProvider)
        .menuState
        .options;
    _controller = AnimationController(
      vsync: this,
      duration: options.radiusAnimationDuration,
    );
    _radiusAnimation = Tween<double>(begin: 0, end: options.radius).animate(
      CurvedAnimation(parent: _controller, curve: options.radiusAnimationCurve),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postOverlayStateNotifierProvider);
    final options = state.menuState.options;

    final angle = getArcStartAngle(context: context, center: options.center);

    return AnimatedBuilder(
      animation: _radiusAnimation,
      builder: (context, _) {
        final radius = _radiusAnimation.value;
        return Positioned(
          left: options.center.dx - radius - options.padding,
          top: options.center.dy - radius - options.padding,
          width: radius * 2 + options.padding * 2,
          height: radius * 2 + options.padding * 2,
          child: ArcLayout(
            center: Offset(radius + options.padding, radius + options.padding),
            radius: radius,
            itemSpacing: options.itemSpacing,
            startAngle: -angle,
            children: List.generate(
              state.menuState.buttons.length,
              (i) => AnimatedRoundedButton(
                icon: state.menuState.buttons[i].icon,
                onPressed: state.menuState.buttons[i].callback,
                active: i == state.menuState.hoveredButtonIndex,
              ),
            ),
          ),
        );
      },
    );
  }
}
