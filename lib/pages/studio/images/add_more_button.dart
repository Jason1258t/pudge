import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';

class AddMoreButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddMoreButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      margin:  EdgeInsets.only(right: AppSpacing.sm),
      decoration: BoxDecoration(
        borderRadius: AppRadii.allMd,
        color: Colors.black12,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppRadii.allMd,
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 32,
                color: AppColors.onBackground,
              ),
              Gap(AppSpacing.xs),
              Text(
                'Add another image',
                style: AppTypography.bodySmall
              ),
            ],
          ),
        ),
      ),
    );
  }
}