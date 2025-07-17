import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'arc_menu/arc_menu_state.dart';

part 'post_overlay_state.freezed.dart';

typedef PointerMoveHandler = Function(LongPressMoveUpdateDetails);

@freezed
abstract class PostOverlayState with _$PostOverlayState {
  const factory PostOverlayState({
    @Default(null) PointerMoveHandler? onPointerMove,
    @Default(null) OverlayEntry? overlayEntry,
    required ArcMenuState menuState,
  }) = _PostOverlayState;
}
