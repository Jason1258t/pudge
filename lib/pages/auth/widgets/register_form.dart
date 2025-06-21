import 'package:flutter/material.dart';
import 'oauth_section.dart';
import 'package:pudge/shared/ui/buttons/elevated_button.dart';
import 'package:pudge/shared/ui/containers/glass_container.dart';

import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/shared/ui/inputs/outline_text_field.dart';
import 'package:pudge/shared/ui/inputs/password_field.dart';
import 'package:pudge/shared/utils/utils.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            textAlign: TextAlign.center,
            'We\'ve been waiting for you, by pressing register you accepts our privacy policy',
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
          Gap(AppSpacing.md),
          PasswordField(hint: 'Repeat your password'),
          Gap(AppSpacing.section),
          CustomElevatedButton(callback: () {}, text: 'Register'),
          Gap(AppSpacing.lg),
          OAuthButtonSection(),
        ],
      ),
    );
  }
}
