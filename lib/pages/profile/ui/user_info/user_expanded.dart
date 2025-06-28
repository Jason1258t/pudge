import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/user/user.dart';
import 'package:pudge/widgets/user_avatar.dart';

class UserExpanded extends StatelessWidget {
  const UserExpanded({super.key, required this.user, required this.maxHeight});

  final User user;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(MediaQuery.paddingOf(context).top + AppSpacing.md),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return UserAvatar(
                user: user,
                size: min(120, constraints.maxHeight),
              );
            },
          ),
        ),
        Gap(AppSpacing.lg, crossAxisExtent: double.infinity),
        Text(
          user.username ?? 'undefined',
          style: AppTypography.titleLarge,
          textAlign: TextAlign.center,
        ),
        Text(
          user.bio ?? '',
          style: AppTypography.bodyRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
