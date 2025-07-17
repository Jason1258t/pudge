import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pudge/features/post_overlay/arc_menu/arc_menu_options.dart';
import 'package:pudge/features/post_overlay/button_data.dart';

part 'arc_menu_state.freezed.dart';

@freezed
abstract class ArcMenuState with _$ArcMenuState {
  const factory ArcMenuState({
    required List<ButtonData> buttons,
    @Default(null) int? hoveredButtonIndex,
    required ArcMenuOptions options,
  }) = _ArcMenuState;
}

extension HoverdButton on ArcMenuState {
  ButtonData get hoveredButton => buttons[hoveredButtonIndex!];
}
