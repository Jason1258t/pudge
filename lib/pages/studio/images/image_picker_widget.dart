import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key, required this.pickImages});

  final Function(BuildContext context) pickImages;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.white12, blurRadius: 8, spreadRadius: 2),
        ],
        borderRadius: AppRadii.allLg,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppRadii.allLg,
          onTap: () => pickImages(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                size: 48,
                color: AppColors.textHint,
              ),
              Gap(AppSpacing.md),
              Text(
                'Add images',
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
