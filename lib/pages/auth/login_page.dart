import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/features/auth/application/auth_state_notifier.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';
import 'package:pudge/pages/auth/widgets/login_form.dart';
import 'package:pudge/shared/ui/animations/circular_progress_indicator.dart';
import 'package:pudge/shared/ui/background/custom_background.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';
import 'package:pudge/shared/utils/utils.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authStateNotifierProvider, (_, state) {
      if (state is AppAuthLoadingState) {
        showDialog(
          context: context,
          builder: (_) => Center(child: CustomCircularProgressIndicator()),
          barrierDismissible: false
        );
      } else {
        if (Navigator.canPop(context)) Navigator.pop(context);
      }
    });

    return CustomBackground(
      child: CustomScaffold(
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(AppSpacing.md),
        centerContent: true,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome back to\nPUDGE',
              textAlign: TextAlign.center,
              style: AppTypography.displayLarge,
            ),
            Gap(AppSpacing.md),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
