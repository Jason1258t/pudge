import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/pages/auth/widgets/register_form.dart';
import 'package:pudge/shared/ui/background/custom_background.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';
import 'package:pudge/shared/utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              'Welcome to\nPUDGE',
              textAlign: TextAlign.center,
              style: AppTypography.displayLarge,
            ),
            Gap(AppSpacing.md),
            RegisterForm()
          ],
        ),
      ),
    );
  }
}
