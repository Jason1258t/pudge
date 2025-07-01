import 'package:flutter/material.dart';
import 'package:pudge/core/theme/app_spacing.dart';
import 'package:pudge/shared/ui/buttons/social_button.dart';
import 'package:pudge/shared/utils/utils.dart';

class OAuthButtonSection extends StatelessWidget {
  const OAuthButtonSection({super.key,  this.googleSignIn});

  final VoidCallback? googleSignIn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          asset: Assets.icon('google.svg'),
          callback: () {},
        ),
        Gap(AppSpacing.md),
        SocialButton(
          asset: Assets.icon('apple.svg'),
          callback: () {},
        ),
      ],
    );
  }
}
