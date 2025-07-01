import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';

class CustomTextFieldWithoutBorders extends StatelessWidget {
  const CustomTextFieldWithoutBorders({
    super.key,
    this.controller,
    this.hint,
    this.style,
    this.hintStyle,
    this.maxLines,
  });

  final TextEditingController? controller;
  final String? hint;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      minLines: 1,
      style: style ?? AppTypography.titleLarge,
      cursorColor: AppColors.onBackground,
      decoration: InputDecoration(
        border: InputBorder.none,
        counter: SizedBox.shrink(),
        hintText: hint,
        hintStyle: hintStyle ?? AppTypography.titleMedium.copyWith(
            color: AppColors.textHint,
            fontWeight: FontWeight.w300
        ),
      ),
    );
  }
}
