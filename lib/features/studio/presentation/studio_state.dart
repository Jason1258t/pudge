import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'studio_state.freezed.dart';

@freezed
abstract class StudioState with _$StudioState {
  factory StudioState({
    required String title,
    required String description,
    required List<XFile> images,
    @Default(false) bool loading,
  }) = _StudioState;
}
