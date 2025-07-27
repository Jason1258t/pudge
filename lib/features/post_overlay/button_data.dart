import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'button_data.freezed.dart';

@freezed
abstract class ButtonData with _$ButtonData {
  const factory ButtonData({
    required Offset? position,
    required String id,
    required VoidCallback callback,
    required IconData icon
  }) = _ButtonData;
}
