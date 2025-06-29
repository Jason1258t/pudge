import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/shared/ui/animations/circular_progress_indicator.dart';
import 'package:pudge/shared/ui/logo/logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppLogo(),
            Gap(48),
            CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
