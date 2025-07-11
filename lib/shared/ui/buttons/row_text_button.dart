import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';

class RowTextButton extends StatelessWidget {
  const RowTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.description,
  });

  final String text;
  final VoidCallback onPressed;
  final Widget icon;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon,
                Gap(AppSpacing.md),
                Expanded(
                  child: Text(
                    text,
                    style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            if (description != null) ...[
              Gap(AppSpacing.xs),
              Padding(
                padding: const EdgeInsets.only(left: 24 + AppSpacing.md),
                child: Text(description!, style: AppTypography.bodyRegular),
              )
            ]
          ],
        ),
      ),
    );
  }
}
