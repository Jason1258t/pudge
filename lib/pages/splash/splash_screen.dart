import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
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
            SizedBox(width: 30, height: 30, child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            )),
          ],
        ),
      ),
    );
  }
}
