import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/features/post_overlay/arc_menu/arc_menu_options.dart';
import 'package:pudge/features/post_overlay/arc_menu/utils.dart';
import 'package:pudge/features/post_overlay/post_overlay_notifier.dart';
import 'package:pudge/pages/explore/post_overlay/arc_layout/arc_layout.dart';
import 'package:pudge/pages/explore/post_overlay/rounded_icon_button.dart';
import 'package:pudge/shared/ui/icon/icon.dart';

import '../button_data.dart';

class ArcMenu extends ConsumerStatefulWidget {
  const ArcMenu({super.key, required this.buttons, required this.options});

  final ArcMenuOptions options;
  final List<ButtonData> buttons;

  @override
  ConsumerState<ArcMenu> createState() => _ArcMenuState();
}

class _ArcMenuState extends ConsumerState<ArcMenu>
    with SingleTickerProviderStateMixin {
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onPointerMove(LongPressMoveUpdateDetails event) {
    final state = ref.watch(postOverlayStateNotifierProvider);

    int? newHoveredIndex = touchedButton(
      state.buttons,
      event.globalPosition,
      widget.options.touchThreshold,
    );

    if (newHoveredIndex != state.hoveredButtonIndex) {
      HapticFeedback.lightImpact();
      ref
          .watch(postOverlayStateNotifierProvider.notifier)
          .setHoveredButton(newHoveredIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    angle = getArcStartAngle(context: context, center: widget.options.center);
    final state = ref.watch(postOverlayStateNotifierProvider);

    return AnimatedBuilder(
      animation: _radiusAnimation,
      builder: (context, _) {
        final radius = _radiusAnimation.value;
        return Positioned(
          left: widget.options.center.dx - radius - widget.options.padding,
          top: widget.options.center.dy - radius - widget.options.padding,
          width: radius * 2 + widget.options.padding * 2,
          height: radius * 2 + widget.options.padding * 2,
          child: ArcLayout(
            center: Offset(
              radius + widget.options.padding,
              radius + widget.options.padding,
            ),
            radius: radius,
            itemSpacing: widget.options.itemSpacing,
            startAngle: -angle,
            children: List.generate(
              widget.buttons.length,
              (i) => AnimatedScale(
                duration: const Duration(milliseconds: 150),
                scale: i == state.hoveredButtonIndex ? 1.2 : 1,
                child: RoundedIconButton(
                  onPressed: widget.buttons[i].callback,
                  icon: CustomIcon.icon(widget.buttons[i].icon),
                  backgroundColor: i == state.hoveredButtonIndex
                      ? Colors.deepPurple[300]!
                      : Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.options.radiusAnimationDuration,
    );
    _radiusAnimation = Tween<double>(begin: 0, end: widget.options.radius)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: widget.options.radiusAnimationCurve,
          ),
        );

    _controller.forward();
  }

  void _initButtons() {
    final notifier = ref.watch(postOverlayStateNotifierProvider.notifier);

    final buttons = _createButtons();
    notifier.setButtons(buttons);
    notifier.setPointerMove(onPointerMove);
  }

  List<ButtonData> _createButtons() {
    final buttons = <ButtonData>[];

    for (int i = 0; i < widget.buttons.length; i++) {
      final buttonPosition = getButtonPosition(
        index: i,
        startAngle: -angle,
        center: widget.options.center,
        radius: widget.options.radius,
        spacing: widget.options.itemSpacing,
      );
      buttons.add(widget.buttons[i].copyWith(position: buttonPosition));
    }
    return buttons;
  }
}
