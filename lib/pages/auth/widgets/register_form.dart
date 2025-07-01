import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/features/auth/application/auth_state_notifier.dart';
import 'oauth_section.dart';
import 'package:pudge/shared/ui/buttons/elevated_button.dart';
import 'package:pudge/shared/ui/containers/glass_container.dart';

import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/shared/ui/inputs/outline_text_field.dart';
import 'package:pudge/shared/ui/inputs/password_field.dart';
import 'package:pudge/shared/utils/utils.dart';

class RegisterForm extends HookConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();

    final notifier = ref.watch(authStateNotifierProvider.notifier);

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
            controller: emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(Icons.email_outlined, color: AppColors.textHint),
          ),
          Gap(AppSpacing.md),
          PasswordField(controller: passwordController),
          Gap(AppSpacing.md),
          PasswordField(
            hint: 'Repeat your password',
            controller: repeatPasswordController,
          ),
          Gap(AppSpacing.lg),
          CustomElevatedButton(
            callback: () {
              final email = emailController.text.trim();
              final password = passwordController.text.trim();
              final repeatPassword = repeatPasswordController.text.trim();

              if (email.isNotEmpty &&
                  password.isNotEmpty &&
                  password == repeatPassword) {
                notifier.register(email, password);
              }
            },
            text: 'Register',
          ),
          Gap(AppSpacing.lg),
          OAuthButtonSection(googleSignIn: notifier.signInWithGoogle),
          Gap(AppSpacing.md),
          GestureDetector(
            child: Text(
              'Already have account? Sign In',
              style: AppTypography.bodySmall,
            ),
            onTap: () {
              context.go('/auth/login');
            },
          ),
        ],
      ),
    );
  }
}
