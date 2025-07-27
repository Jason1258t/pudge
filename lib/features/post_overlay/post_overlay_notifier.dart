import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pudge/features/post_overlay/arc_menu/arc_menu_options.dart';
import 'package:pudge/features/post_overlay/button_data.dart';
import 'package:pudge/features/post_overlay/post_overlay_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'arc_menu/arc_menu_state.dart';
import 'arc_menu/utils.dart';

part 'post_overlay_notifier.g.dart';

@riverpod
class PostOverlayStateNotifier extends _$PostOverlayStateNotifier {
  get _baseState => PostOverlayState(
    onPointerMove: _onPointerMove,
    menuState: ArcMenuState(
      buttons: [],
      options: ArcMenuOptions(center: Offset(0, 0)),
    ),
  );

  @override
  PostOverlayState build() {
    return _baseState;
  }

  void setOptions(ArcMenuOptions options) => state = state.copyWith(
    menuState: state.menuState.copyWith(options: options),
  );

  void setOverlay(OverlayEntry overlay) =>
      state = state.copyWith(overlayEntry: overlay);

  void setButtons(List<ButtonData> data, BuildContext context) {
    final buttons = _createButtons(data, context, state.menuState.options);
    state = state.copyWith(
      menuState: state.menuState.copyWith(buttons: buttons),
    );
  }

  static List<ButtonData> _createButtons(
    List<ButtonData> data,
    BuildContext context,
    ArcMenuOptions options,
  ) {
    final angle = getArcStartAngle(context: context, center: options.center);
    final buttons = <ButtonData>[];

    for (int i = 0; i < data.length; i++) {
      final buttonPosition = getButtonPosition(
        index: i,
        startAngle: -angle,
        center: options.center,
        radius: options.radius,
        spacing: options.itemSpacing,
      );
      buttons.add(data[i].copyWith(position: buttonPosition));
    }
    return buttons;
  }

  void _onPointerMove(LongPressMoveUpdateDetails event) {
    int? newHoveredIndex = touchedButton(
      state.menuState.buttons,
      event.globalPosition,
      state.menuState.options.touchThreshold,
    );

    if (newHoveredIndex != state.menuState.hoveredButtonIndex) {
      HapticFeedback.lightImpact();
      _setHoveredButton(newHoveredIndex);
    }
  }

  void _setHoveredButton(int? index) => state = state.copyWith(
    menuState: state.menuState.copyWith(hoveredButtonIndex: index),
  );

  void dispose() {
    state.overlayEntry?.remove();
    state.overlayEntry?.dispose();
    state = _baseState;
  }
}
