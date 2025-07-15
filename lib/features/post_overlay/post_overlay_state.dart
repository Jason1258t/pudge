import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pudge/features/post_overlay/button_data.dart';

part 'post_overlay_state.freezed.dart';

typedef PointerMoveHandler = Function(LongPressMoveUpdateDetails);

@freezed
abstract class PostOverlayState with _$PostOverlayState {
  const factory PostOverlayState({
    required List<ButtonData> buttons,
    @Default(null) PointerMoveHandler? onPointerMove,
    @Default(null) int? hoveredButtonIndex,
    @Default(null) OverlayEntry? overlayEntry
  }) = _PostOverlayState;
}

extension PostOverlayHoveredButton on PostOverlayState {
  ButtonData get hoveredButton => buttons[hoveredButtonIndex!];
}
