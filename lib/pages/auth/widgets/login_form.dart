import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/features/auth/application/auth_state_notifier.dart';
import 'oauth_section.dart';
import 'package:pudge/shared/ui/buttons/elevated_button.dart';
import 'package:pudge/shared/ui/containers/glass_container.dart';
import 'package:pudge/shared/ui/inputs/outline_text_field.dart';
import 'package:pudge/shared/ui/inputs/password_field.dart';
import 'package:pudge/shared/utils/utils.dart';

import 'package:pudge/core/theme/theme.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final authNotifier = ref.watch(authStateNotifierProvider.notifier);

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
            controller: emailController,
          ),
          Gap(AppSpacing.md),
          PasswordField(controller: passwordController),
          Gap(AppSpacing.lg),
          CustomElevatedButton(
            callback: () {
              final email = emailController.text.trim();
              final password = passwordController.text.trim();
              if (email.isNotEmpty && password.isNotEmpty) {
                authNotifier.login(email, password);
              }
            },
            text: 'Login',
          ),
          Gap(AppSpacing.lg),
          OAuthButtonSection(googleSignIn: authNotifier.signInWithGoogle),
          Gap(AppSpacing.md),
          GestureDetector(
            child: Text(
              'Haven\'t account yet? Sign Up',
              style: AppTypography.bodySmall,
            ),
            onTap: () {
              context.go('/auth/register');
            },
          ),
        ],
      ),
    );
  }
}
