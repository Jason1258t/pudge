import 'package:flutter/material.dart';
import 'oauth_section.dart';
import 'package:pudge/shared/ui/buttons/elevated_button.dart';
import 'package:pudge/shared/ui/containers/glass_container.dart';
import 'package:pudge/shared/ui/inputs/outline_text_field.dart';
import 'package:pudge/shared/ui/inputs/password_field.dart';
import 'package:pudge/shared/utils/utils.dart';

import 'package:pudge/core/theme/theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            textAlign: TextAlign.center,
            'Welcome back, we missed you bro. Let\'s login to start',
            style: AppTypography.bodySmallLight,
          ),
          Gap(AppSpacing.xl),
          CustomOutlineTextField(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.email_outlined, color: AppColors.textHint),
          ),
          Gap(AppSpacing.md),
          PasswordField(),
          Gap(AppSpacing.xxl),
          CustomElevatedButton(callback: () {}, text: 'Login'),
          Gap(AppSpacing.lg),
          OAuthButtonSection(),
        ],
      ),
    );
  }
}
