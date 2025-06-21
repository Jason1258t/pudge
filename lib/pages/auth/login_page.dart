import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/pages/auth/widgets/login_form.dart';
import 'package:pudge/shared/ui/background/custom_background.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';
import 'package:pudge/shared/utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
