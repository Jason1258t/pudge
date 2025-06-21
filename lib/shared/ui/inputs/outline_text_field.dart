import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';

class CustomOutlineTextField extends StatelessWidget {
  const CustomOutlineTextField({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadii.allLg,
      child: BackdropFilter(
        filter: AppFilters.backdropFilter,
        child: Container(
          decoration: BoxDecoration(gradient: _leftTopGradient),
          child: TextField(
            controller: controller,
            style: TextStyle(color: AppColors.onBackground, fontSize: 18),
            cursorColor: AppColors.onBackground,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(AppSpacing.md),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.textHint,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderRadius: AppRadii.allLg,
                borderSide: BorderSide(color: Colors.white, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static final _leftTopGradient = RadialGradient(
    colors: [Colors.white24, Colors.white.withAlpha(0)],
    radius: 6,
    center: Alignment(-0.4, -3),
  );
}
