import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pudge/core/theme/theme.dart';

class CustomOverlayBackButton extends StatelessWidget {
  const CustomOverlayBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: AppRadii.allMd,
        onTap: () => context.pop(),
        child: Ink(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: AppRadii.allMd,
            color: AppColors.navigation,
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: AppColors.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
