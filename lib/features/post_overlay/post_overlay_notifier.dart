import 'package:flutter/cupertino.dart';
import 'package:pudge/features/post_overlay/button_data.dart';
import 'package:pudge/features/post_overlay/post_overlay_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_overlay_notifier.g.dart';

@riverpod
class PostOverlayStateNotifier extends _$PostOverlayStateNotifier {
  @override
  PostOverlayState build() {
    return PostOverlayState(buttons: []);
  }

  void setOverlay(OverlayEntry overlay) =>
      state = state.copyWith(overlayEntry: overlay);

  void dispose() {
    state.overlayEntry?.remove();
    state.overlayEntry?.dispose();
    state = PostOverlayState(buttons: []);
  }

  void setButtons(List<ButtonData> data) {
    state = state.copyWith(buttons: data);
  }

  void setHoveredButton(int? index) =>
      state = state.copyWith(hoveredButtonIndex: index);

  setPointerMove(PointerMoveHandler v) =>
      state = state.copyWith(onPointerMove: v);
}
