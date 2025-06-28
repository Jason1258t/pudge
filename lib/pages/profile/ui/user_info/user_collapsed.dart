import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/user/user.dart';
import 'package:pudge/widgets/user_avatar.dart';

class UserCollapsed extends StatelessWidget {
  const UserCollapsed({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserAvatar(user: user, size: 48),
          Gap(AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.username ?? 'error', style: AppTypography.bodyLarge),
              Text(
                "creator",
                style: AppTypography.bodySmall.copyWith(color: Colors.white60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
