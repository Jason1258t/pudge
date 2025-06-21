import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/shared/ui/background/custom_background.dart';
import 'package:pudge/shared/ui/buttons/elevated_button.dart';
import 'package:pudge/shared/ui/buttons/social_button.dart';
import 'package:pudge/shared/ui/containers/glass_container.dart';
import 'package:pudge/shared/ui/inputs/outline_text_field.dart';
import 'package:pudge/shared/ui/inputs/password_field.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';
import 'package:pudge/shared/utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              'Welcome to\nPUDGE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.onBackground,
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
                    'We\'ve been waiting for you, by pressing register you accepts our privacy policy',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.onBackground.withAlpha(100),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Gap(32),
                  CustomOutlineTextField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.textHint,
                    ),
                  ),
                  Gap(16),
                  PasswordField(),
                  Gap(16),
                  PasswordField(hint: 'Repeat your password'),
                  Gap(60),
                  CustomElevatedButton(callback: () {}, text: 'Register'),
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
