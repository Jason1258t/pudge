import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.text,
    this.callback,
    required this.highlight,
  });

  final String text;
  final VoidCallback? callback;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: Colors.white54, width: 1),
          ),
          boxShadow: [
            if (highlight) ...[
              BoxShadow(color: Colors.white12, blurRadius: 8, spreadRadius: 2),
            ],
          ],
          borderRadius: AppRadii.allMd,
        ),
        child: Text(
          text,
          style: AppTypography.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
