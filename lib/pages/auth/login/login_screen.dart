import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/shared/scaffold/custom_scaffold.dart';
import 'package:pudge/shared/theme/colors.dart';
import 'package:pudge/shared/ui/background/custom_background.dart';
import 'package:pudge/shared/ui/buttons/elevated_button.dart';
import 'package:pudge/shared/ui/buttons/social_button.dart';
import 'package:pudge/shared/ui/containers/glass_container.dart';
import 'package:pudge/shared/ui/inputs/outline_text_field.dart';
import 'package:pudge/shared/ui/inputs/password_field.dart';
import 'package:pudge/shared/utils/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: CustomScaffold(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(12.0),
        centerContent: true,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome back to\nPUDGE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.onBcg,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(16),
            GlassContainer(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Welcome back, we missed you bro. Let\'s login to start',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.onBcg.withAlpha(100),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Gap(32),
                  CustomOutlineTextField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.hint,
                    ),
                  ),
                  Gap(16),
                  PasswordField(),
                  Gap(48),
                  CustomElevatedButton(callback: () {}, text: 'Login'),
                  Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        asset: Assets.icon('google.svg'),
                        callback: () {},
                      ),
                      Gap(12),
                      SocialButton(
                        asset: Assets.icon('apple.svg'),
                        callback: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
