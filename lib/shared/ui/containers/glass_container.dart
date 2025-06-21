import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';

class GlassContainer extends StatelessWidget {
  GlassContainer({
    super.key,
    this.borderRadius = 12,
    EdgeInsets? contentPadding,
    this.width,
    this.height,
    this.child,
  }) {
    padding = contentPadding ?? EdgeInsets.all(16);
  }

  final double borderRadius;
  late final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: AppFilters.backdropFilter,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Color(0xffB379DF).withAlpha(20),
          ),
          child: child,
        ),
      ),
    );
  }
}
