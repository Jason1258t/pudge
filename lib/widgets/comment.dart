import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/entities/comment/comment.dart';
import 'package:pudge/shared/ui/icon/icon.dart';
import 'package:pudge/widgets/user_avatar.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatar(user: comment.author, size: 48),
        Gap(AppSpacing.md),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.author.username,
                      style: AppTypography.caption,
                    ),
                    Gap(AppSpacing.md),
                    Text(
                      DateFormat('dd.MM.YYYY').format(comment.createAt),
                      style: AppTypography.caption,
                    ),
                  ],
                ),
                Text(comment.content, style: AppTypography.bodySmall),
                Gap(AppSpacing.xs),
                Row(
                  children: [
                    CustomIcon.icon(
                      Icons.favorite_border_rounded,
                      color: AppColors.onBackground,
                      size: 16,
                    ),
                    Gap(AppSpacing.xs),
                    Text(
                      comment.likesCount.toString(),
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
